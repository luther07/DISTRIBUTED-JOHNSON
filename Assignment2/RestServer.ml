#load "unix.cma";
let s_descriptor = Unix.socket Unix.PF_INET Unix.SOCK_DGRAM 0 ;;
let s_hostname = Unix.gethostname() ;;
let s_host = Unix.gethostbyname s_hostname ;;
let my_addr = s_host.Unix.h_addr_list.(0) ;;
let s_address = Unix.ADDR_INET(my_addr, 12345) ;;
Unix.bind s_descriptor (Unix.ADDR_INET(my_addr, 12345)) ;;
(* recvfrom or recvmsg... *)
(*let buffer = String.create max_to_read in
   while true do
      ignore (Unix.recvfrom s_descriptor, buffer, 0, max_to_read []);
   done*)
