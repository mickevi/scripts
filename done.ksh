#!/bin/bash
UTLOG="/home/mickevi/torrents/log.txt"
LOGFILE="/home/mickevi/public_html/tr.html"
# packa upp crap..
/home/mickevi/bin/unrarMedia.ksh 2>&1 >> $UTLOG &
chmod -R g+rw $TR_TORRENT_DIR 2>&1 >> $UTLOG &
#echo "$(date) $TR_TORRENT_NAME $TR_TORRENT_DIR $TR_TORRENT_ID $TR_APP_VERSION $TR_TORRENT_HASH $TR_TIME_LOCALTIME" >>  $LOGFILE
echo "$(date) $TR_TORRENT_NAME <br>" >>  $LOGFILE
#transmission-remote  -n transmission:transmission -l >> $LOGFILE
#echo "=========================" >> $LOGFILE
 

# parsa ut shownamn och säsong från $TR_TORRENT_NAME
# Stargate.Universe.S02E10.Resurgence.HDTV.XviD-FQM.avi

# hårdlänka till media/tv_serier/ $show / $season

# kolla efter avslutade torrents och plocka bort hårdlänken ur $TR_TORRENT_DIR


