#!/bin/bash
DIR=$(pwd)
OUTPUT="$DIR/index.html"
HTML="<!DOCTYPE html><html lang=\"en\"><head><title>reaction gif</title><meta charset=\"utf-8\"><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><meta name=\"description\" content=\"random images\"><meta name=\"author\" content=\"xero harrison\"><meta name=\"theme-color\" content=\"#222\"><style type=\"text/css\">body {background:#222;color:#ccc;padding:10px;font-size:8pt;font-family:Monaco, Consolas, \"Lucida Console\", monospace}::-webkit-scrollbar{width: 13px}::-webkit-scrollbar-button:vertical:increment {background-color:#111}::-webkit-scrollbar-button:vertical:increment:hover {background-color:#666}::-webkit-scrollbar-button:vertical:decrement {background-color:#222}::-webkit-scrollbar-button:vertical:decrement:hover {background-color:#666} ::-webkit-scrollbar-thumb{background-color:#222;border-radius: 0}::-webkit-scrollbar-thumb:hover{background-color:#111}::-webkit-scrollbar-track{background-color:#111}h1 {margin:2px;color:#eee;padding-bottom:10px;border-bottom:4px solid #000} h1 em {display:inline;padding-right:15px;margin:0;font-size:50%;color:#666;} h1 em a {text-decoration: none;color:#666;font-size:99%;margin:0;padding:0} .logo {transform:scale(0.5);image-rendering: -moz-crisp-edges; image-rendering: -o-crisp-edges; image-rendering: -webkit-optimize-contrast; -ms-interpolation-mode:nearest-neighbor;z-index:999;float:right;top:0;clear:none;margin:0;padding:0} ul {list-style-type:none;padding:0;margin:0;display:block;width:100%}li {display:block;margin:0;padding:5px;width:100%}li:hover {background:#272822}a {color:#6A8C8C;text-decoration:none;margin-right:10px;font-size:15pt}a:hover {color:#93BBBB} footer {border-top: 2px solid #000; margin-top:10px; padding-top:10px} footer a {font-size: 95%; color: #fff; margin-right: 50px} @media only screen and (min-width:641px) {body{font-size:12pt} a {font-size:25pt} .logo {transform:scale(1);position:sticky}}</style></head><body><img src=\"https://x-e.ro/ui/img/xero-graff.png\" alt=\"xero pixel graff\" class=\"logo\" /><h1>0.xxe.ro <em>{<a href=\"https://whois.x-e.ro\">xero</a>'s reaction gifs}</em></h1><ul>"
for FILE in *; do
	EXT=$(awk -F'.' '{print $NF}' <<< "$FILE")
	if [ "$EXT" = "gif"  ] || [ "$EXT" = "jpg"  ] || [ "$EXT" = "jpeg"  ] || [ "$EXT" = "png"  ] ; then
		NAME=$(awk -F'/' '{print $NF}' <<< "$FILE")
		SIZE=$(wc -c < "$FILE")

		for DESIG in bytes kb mb gb tb pb
		do
		   [ "$SIZE" -lt 1024 ] && break
			 SIZE=$((SIZE/1024))
		done
		HTML+="<li><a href=\"$NAME\">$NAME</a>{$SIZE $DESIG}</li>"
	fi
done
HTML+='</ul><footer><a href="https://x-e.ro">https://x-e.ro</a><a href="https://0w.nz">https://0w.nz</a><a href="https://xero.style">https://xero.style</a></footer></body></html>'
echo "$HTML" > "$OUTPUT"
