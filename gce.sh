#! /bin/bash
apt-get install apache2 ffmpeg -yf

gsutil -m cp gs://input-video/bbb.mkv /root/bbb.mkv
ffmpeg -i /root/bbb.mkv -vf "scale=min(640\,iw):trunc(ow/a/2)*2" -ss 10 -vframes 1 -f mjpeg /root/bbb.jpg
ffmpeg -i /root/bbb.mkv -threads 0 -vcodec libx264 -vf scale=1920x1080 -vb 7000K -acodec aac -ab 96k -ar 44100 -f mp4 /root/render_bbb.mp4 2> /root/bbb.log

selfUptime=$(uptime)
echo $selfUptime > /root/uptime_bbb.txt

gsutil -m cp /root/uptime_bbb.txt gs://output-video/uptime_bbb.txt
gsutil -m cp /root/render_bbb.jpg gs://output-video/render_bbb.jpg
gsutil -m cp /root/render_bbb.mp4 gs://output-video/render_bbb.mp4

echo "I'm done" > /var/www/html/index.html

THISHOST=$(hostname)

gcloud compute instances delete $THISHOST --zone us-east1-b -q
