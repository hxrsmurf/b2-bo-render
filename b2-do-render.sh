#!/bin/bash
doIP=""
doID=""
doStatus=""
doCreateDate=""

logEmail=""
sshKey=""
b2Account=""
b2Key=""
doRegion="nyc2"
doImage="debian-8-x64"
doSize="512mb"
#doSize="64gb"
doName="test"
b2Bucket=""

doctl compute droplet create $doName --size $doSize --image $doImage --region $doRegion --ssh-keys $sshKey

doCreateDate="$(date)"

initDOstatus()
{
	doID="$(doctl compute droplet list | awk 'NR==2 {print $1}')"
	doStatus="$(doctl compute droplet list | awk 'NR!=1 {print $11}')"
	doIP="$(doctl compute droplet list | awk 'NR==2 {print $3'})"
	doSSHstatus="$(nmap $doIP -PN -p ssh | egrep 'open|closed|filtered' | awk 'NR==1 {print $2}')"
	getDOStatus
}

getDOStatus()
{
while [ "$doStatus" != "active" ]; do
	echo "Your droplet is being created..."
	sleep 5
	initDOstatus
	break
done

while [ "$doSSHstatus" != "open" ]; do
	echo "We are waiting for SSH."
	initDOstatus
	break
done

}

installThings()
{
if [ "$doStatus" = "active" ]; then
        ssh -o "StrictHostKeyChecking no" root@$doIP wget -O bbb-4k.mp4 http://distribution.bbb3d.renderfarming.net/video/mp4/bbb_sunflower_native_60fps_normal.mp4
        ssh -o "StrictHostKeyChecking no" root@$doIP wget https://bootstrap.pypa.io/get-pip.py
        ssh -o "StrictHostKeyChecking no" root@$doIP python get-pip.py
        ssh -o "StrictHostKeyChecking no" root@$doIP pip install -U pip setuptools
	ssh -o "StrictHostKeyChecking no" echo "'deb http://ftp.de.debian.org/debian jessie-backports main' >> /etc/apt/sources.list"
        ssh -o "StrictHostKeyChecking no" root@$doIP apt-get update
        ssh -o "StrictHostKeyChecking no" root@$doIP apt-get install git ffmpeg -yf
        ssh -o "StrictHostKeyChecking no" root@$doIP git clone https://github.com/Backblaze/B2_Command_Line_Tool.git
        echo "cd /root/B2_Command_Line_Tool/ && python setup.py install" | ssh -o "StrictHostKeyChecking no"  root@$doIP
        ssh -o "StrictHostKeyChecking no" root@$doIP b2 authorize-account $b2Account $b2Key
        #ssh -o "StrictHostKeyChecking no" root@$doIP ffmpeg -i "bbb-4k.mp4" -threads 64 -vcodec libx264 -vf scale=1920x1080 -vb 10000K -acodec aac -ab 96k -ar 44100 -f mp4 "output.mp4"
        #ssh -o "StrictHostKeyChecking no" root@$doIP b2 upload-file --threads0 $b2Bucket  output.mp4 output.mp4
else
	echo "Failed"
fi
}

showComplete()
{
	echo "Congratulations, the Droplet has been created!"
	echo "It can be accessed at this IP address: $doIP"
	echo "We started at $doCreateDate"
	doFinishDate="$(date)"
	echo "We finished at $doFinishDate"
	echo -e "Subject:Droplet Log \n\nCongratulations, the Droplet has been created! \n\nIt can be accessed at this IP address: $doIP. \n\nWe started at $doCreateDate \n\nWe finished at $doFinishDate." | sendmail -v $logEmail
}

getDOStatus
installThings
showComplete
doctl compute droplet delete $doID -f
