let s_descr = Unix.socket Unix.PF_INET Unix.SOCK_DGRAM 0 ;;
let s_hostname = Unix.gethostname() ;;
let s_host = Unix.gethostbyname s_hostname ;;
let s_IAddress = s_host.Unix.h_addr_list.(0) ;;

