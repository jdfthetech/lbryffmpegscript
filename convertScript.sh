#!/bin/bash

getname () { 
  clear
  echo -e "\n"
  read -p "Type the name of your file and press enter: " FLNAME
  [[ -z "$FLNAME" ]] && flname
  added="_lbry.mp4"
  XFLNAME=${FLNAME%.*}
  NEWFLNAME="$XFLNAME$added"
  
}

convert () {

ffmpeg -i ${FLNAME} -c:v libx264 -crf 21 -preset faster -pix_fmt yuv420p -maxrate 5000K -bufsize 5000K -vf 'scale=if(gte(iw\,ih)\,min(1920\,iw)\,-2):if(lt(iw\,ih)\,min(1920\,ih)\,-2)' -movflags +faststart -c:a aac -b:a 160k ${NEWFLNAME}

}

getname
convert

