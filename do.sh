#!/bin/bash
b2Account=""
b2Key=""

b2Account="[YOUR ACCOUNT NUMBER]"
b2Key="[YOUR SECRET KEY]"
doIP=""
doID=""
doStatus=""
doCreateDate=""

doctl compute droplet create test --size 512mb --image debian-8-x64 --region nyc2 --ssh-keys [YOUR SSH KEY]

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
        ssh -o "StrictHostKeyChecking no" root@$doIP apt-get install git -y
        ssh -o "StrictHostKeyChecking no" root@$doIP git clone https://github.com/Backblaze/B2_Command_Line_Tool.git
        echo "cd /root/B2_Command_Line_Tool/ && python setup.py install" | ssh -o "StrictHostKeyChecking no"  root@$doIP
        ssh -o "StrictHostKeyChecking no" root@$doIP python /root/B2_Command_Line_Tool/setup.py install
        ssh -o "StrictHostKeyChecking no" root@$doIP b2 authorize-account $b2Account $b2Key
        ssh -o "StrictHostKeyChecking no" root@$doIP b2 list-buckets
        ssh -o "StrictHostKeyChecking no" root@$doIP  b2 upload-file --threads 0 YOUR-B2-BUCKET bbb-4k.mp4 bbb-4k.mp4
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
echo -e "Subject:Droplet Log \n\nCongratulations, the Droplet has been created! \n\nIt can be accessed at this IP address: $doIP. \n\nWe started at $doCreateDate \n\nWe finished at $doFinishDate." | sendmail -v YOUREMAIL
}

getDOStatus
installThings
showComplete
doctl compute droplet delete $doID -f
