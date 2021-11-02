#!/bin/bash
DIR=$(pwd)
OUTPUT=$DIR/index.html
HTML="<!DOCTYPE html><html lang=\"en\"><head><title>random</title><meta charset=\"utf-8\"><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"><meta name=\"description\" content=\"random images\"><meta name=\"author\" content=\"xero harrison\"><meta name=\"theme-color\" content=\"#222222\"><style type=\"text/css\">body {background:#222;color:#ccc;padding:10px;font-size:8pt;font-family:Monaco, Consolas, \"Lucida Console\", monospace}::-webkit-scrollbar{width: 13px}::-webkit-scrollbar-button:vertical:increment {background-color:#111}::-webkit-scrollbar-button:vertical:increment:hover {background-color:#666}::-webkit-scrollbar-button:vertical:decrement {background-color:#222}::-webkit-scrollbar-button:vertical:decrement:hover {background-color:#666} ::-webkit-scrollbar-thumb{background-color:#222;border-radius: 0}::-webkit-scrollbar-thumb:hover{background-color:#111}::-webkit-scrollbar-track{background-color:#111}h1 {margin:2px;color:#eee;padding-bottom:10px;border-bottom:4px solid #000}ul {list-style-type:none;padding:0;margin:0}li {display:block;margin:0;padding:5px}li:hover {background:#272822}a {color:#6A8C8C;text-decoration:none;margin-right:10px;font-size:15pt}a:hover {color:#93BBBB} @media only screen and (min-width:641px) {body{font-size:12pt}a {font-size:25pt}}</style></head><body><h1>0.xxe.ro</h1><ul>"
for FILE in "$DIR"/*
do
	EXT=$(awk -F'.' '{print $NF}' <<< $FILE)
	if [ $EXT = "gif"  ] || [ $EXT = "jpg"  ] || [ $EXT = "jpeg"  ] || [ $EXT = "png"  ] ; then
		NAME=$(awk -F'/' '{print $NF}' <<< $FILE)
		SIZE=$(cat $FILE | wc -c)

		for DESIG in bytes kb mb gb tb pb
		do
		   [ $SIZE -lt 1024 ] && break
		   let SIZE=$SIZE/1024
		done
		HTML+="<li><a href=\"$NAME\">$NAME</a>{$SIZE $DESIG}</li>"
	fi
done
HTML+="</ul></body></html>"
echo $HTML > $OUTPUT
