let test_send = 
	(* let my_bytes = get_bytes_from_file README; *)
	let my_bytes = String.create 255;
	let my_address = "127.0.0.1";
	let my_size = 1024;
	let my_port = 12345;
	send_Dgram my_bytes my_size my_address my_port  ;

let send_Dgram buff len inet port = 
	let s_descr = Unix.socket Unix.PF_INET Unix.SOCK_DGRAM 0 ; (* create socket for DATAGRAM *)
	let s_ServerString = inet ; (* string for server address, 127.0.0.1 *)
	let s_IAddress = Unix.inet_addr_of_string s_string ; (* internet address for server *)
	let s_Port = port ; (* port for server, 12345 *)
	let s_addr = Unix.ADDR_INET(s_IAddress , s_Port) ; (* ? *)
	let s_message = "hello_world" ;
	Unix.connect s_descr s_addr; (* connect to server *)
	Unix.send s_descr s_message 0 (String.length s_message) [] ;
	(* TODO create datagram *)
	(* TODO write datagram to socket *)
	Unix.close s_descr ;; (* close socket *)

(* Copied this function from http://www.codecodex.com/wiki/index.php?title=Read_a_file_into_a_byte_array *)
let get_bytes_from_file filename =
    let ch = open_in filename in
    let buf = Buffer.create 1024 in
    (try Buffer.add_channel buf ch max_int with _ -> ());
    close_in ch;
    buf;;
	 

