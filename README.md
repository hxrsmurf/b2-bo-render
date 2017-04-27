
This is a basic script that I thought of after playing around with [CumulusClips](http://cumulusclips.org/). I would like to eventually implement a better rendering machine/virtual machine. This would also allow archiving at the same time.

I will post what I used to do (the script). It was on Google Compute Engine and Google Storage, but the outgoing bandwidth and 64-core VM was eating my money.

#### Warnings:

* This **deletes** the Droplet when you are done
* ***Assumes*** you have zero (0) Droplets
* Uses B2 Storage (cost)
* Uses Digital Ocean Droplets (cost)

Here are some variables that are hard-coded:

1. Video file is [Big Buck Bunny - 4K 60FPS](http://bbb3d.renderfarming.net/), a large file.
2. [Digital Ocean](https://www.digitalocean.com) Droplet is 512mb droplet size (their smallest offering).
3. [Digital Ocean](https://www.digitalocean.com) Droplet Region is nyc2
4. [Digital Ocean](https://www.digitalocean.com) Droplet Operating System is Debian 8 x64

Manual stuff like variables and software install:

* Backblaze B2 Account Number, B2 Secret Key & Bucket Name
* What file to download
* E-mail
* Install Digital Ocean's [(doctl)](https://www.digitalocean.com/community/tutorials/how-to-use-doctl-the-official-digitalocean-command-line-client)
* Setup Digital Ocean SSH key to Droplet

#### Services Used

* [BackBlaze](https://www.backblaze.com)
* Digital Ocean ([doctl](https://www.digitalocean.com/community/tutorials/how-to-use-doctl-the-official-digitalocean-command-line-client))
* OVH/[SoYouStart](https://www.soyoustart.com/us/) (remote dev. machine)

#### Used to be services

* [Google Compute Engine](https://cloud.google.com/compute/)
* [Google Compute Storage](https://cloud.google.com/storage/)
