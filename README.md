
This is a basic script that I thought of after playing around with [CumulusClips](http://cumulusclips.org/). I would like to eventually implement a better rendering machine/virtual machine. This would also allow archiving at the same time.

I will post what I used to do (the script). It was on Google Compute Engine and Google Storage, but the outgoing bandwidth and 64-core VM was eating my money.

**Note**: This deletes the droplet when you are done.

Here are some variables that are hard-coded:

1. Video file is hard-coded as [Big Buck Bunny](http://bbb3d.renderfarming.net/).
2. [Digital Ocean](https://www.digitalocean.com) Droplet is hard-coded as 512mb (their smallest offering).

Manual stuff like variables and software install:

* Backblaze B2 Account Number, B2 Secret Key & Bucket Name
* What file to download
* E-mail
* Install Digital Ocean's [(doctl)](https://www.digitalocean.com/community/tutorials/how-to-use-doctl-the-official-digitalocean-command-line-client)

#### Services Used

* [BackBlaze](https://www.backblaze.com)
* Digital Ocean [(doctl)](https://www.digitalocean.com/community/tutorials/how-to-use-doctl-the-official-digitalocean-command-line-client)
* OVH/[SoYouStart](https://www.soyoustart.com/us/) (remote dev. machine)

#### Used to be services

* [Google Compute Engine](https://cloud.google.com/compute/)
* [Google Compute Storage](https://cloud.google.com/storage/)
