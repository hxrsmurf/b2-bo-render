This is a basic shell script that I wanted to create to help render external videos. The virtual machine(s) I have access to, only have 2 CPUs/4 threads.

I was using Google Copmute Engine with 64 cores and Google Storage, but it was getting expensive to test with as well as a large cost in general. The 64-cores are very cheap, but the outgoing bandwidth from Google Storage is way more expensive.

#### Warnings:

* **Deletes** the Droplet when you are done
* ***Assumes*** you have zero (0) Droplets
* Uses B2 Storage (incurs a cost)
* Uses DigitalOcean Droplets (incurs a cost)

Here are some variables that are hard-coded:

1. Video file is [Big Buck Bunny - 4K 60FPS](http://bbb3d.renderfarming.net/), a large file.
2. DigitalOcean Droplet is 64GB, 20 CPU droplet size (their largest offering).
3. DigitalOcean Droplet Region is nyc2
4. DigitalOcean Droplet Operating System is Debian 8 x64
5. ffmpeg settings and/or variables

Manual stuff like variables and software install:

* Backblaze B2 Account Number, B2 Secret Key & Bucket Name
* E-mail
* Install DigitalOcean's doctl
* Attach an SSH key to your DigitalOcean Account

#### Services Used

* [BackBlaze](https://www.backblaze.com)
* [Digital Ocean](https://www.digitalocean.com) - ([doctl](https://www.digitalocean.com/community/tutorials/how-to-use-doctl-the-official-digitalocean-command-line-client))
* OVH/[SoYouStart](https://www.soyoustart.com/us/)

#### Old Services Used

* [Google Compute Engine](https://cloud.google.com/compute/)
* [Google Compute Storage](https://cloud.google.com/storage/)
