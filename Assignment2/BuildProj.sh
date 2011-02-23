#!/bin/bash
ocamlc get_bytes_from_file.ml
ocamlc -o get_bytes get_bytes_from_file.cmo
