{ pkgs ? import <nixpkgs> {} }:
let
in
  pkgs.mkShell {
    buildInputs = with pkgs; [ emacs26-nox ];
  }
