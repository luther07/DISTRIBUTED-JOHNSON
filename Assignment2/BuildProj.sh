#!/bin/bash
ocamlc get_bytes_from_file.ml
ocamlc get_bytes_from_file.cmo
ocamlc -custom unix.cma threa.ml -cclib -lunix
