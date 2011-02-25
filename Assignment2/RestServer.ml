let s_descr = Unix.socket Unix.PF_INET Unix.SOCK_DGRAM 0 ;;
let s_hostname = Unix.gethostname() ;;
let s_host = Unix.gethostbyname s_hostname ;;
let my_addr = s_host.Unix.h_addr_list.(0) ;;
let s_address = Unix.ADDR_INET(my_addr, 12345) ;;
Unix.bind s_descr (Unix.ADDR_INET(my_addr, 12345)) ;;
Unix.listen s_descr 5 ;;
