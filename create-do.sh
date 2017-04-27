#!/bin/bash
sshKey=""
b2Account=""
b2Key=""
doRegion="nyc2"
doImage="debian-8-x64"
doSize="512mb"
doName="test"

doctl compute droplet create $doName --size $doSize --image $doImage --region $doRegion --ssh-keys $sshKey

