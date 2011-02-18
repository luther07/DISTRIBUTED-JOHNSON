let s_descr = Unix.socket Unix.PF_INET Unix.SOCK_DGRAM 0 ;;
let s_string = "127.0.0.1" ;;
let s_IAddress = Unix.inet_addr_of_string s_string ;;
let s_Port = 12345 ;;
let s_addr = Unix.ADDR_INET(s_IAddress , s_Port) ;;
Unix.connect s_descr s_addr ;;
print_endline "Hello Princess!" ;;
Unix.close s_descr ;;
