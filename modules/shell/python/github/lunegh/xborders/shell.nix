{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell
{
	nativeBuildInputs = with pkgs; [
		python313
		python313Packages.ninja
		python313Packages.pygobject3
		python313Packages.pycairo
		python313Packages.requests
		python313Packages.zc-lockfile
		python313Packages.xlib
		gtk3
		libwnck3
	];

	shellHook = ''
		sed -i "1s|^#!/bin/python3|#!/usr/bin/env python3|" xborders
	'';
}