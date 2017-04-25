
This is a basic script that I thought of after playing around with [CumulusClips](http://cumulusclips.org/). I would like to eventually implement a better rendering machine/virtual machine. This would also allow archiving at the same time.

I was using [Google Compute Engine Storage](https://cloud.google.com/storage/) (or whatever), but the outgoing bandwidth was eating me alive.

I was using [Google Compute Engine](https://cloud.google.com/compute/), but that was eating me alive aswell. Especially, since I was doing the 64-core!

One will need to set the [Backblaze](https://www.backblaze.com/) B2 Account and Secret key at the top.


Here are some variables that are hard-coded:

1. Video file is hard-coded as [Big Buck Bunny](http://bbb3d.renderfarming.net/).
2. [Digital Ocean](https://www.digitalocean.com) Droplet is hard-coded as 512mb (their smallest offering).


**Note**: This deletes the droplet when you are done.

These need to be filled in manually below:

* B2 Bucket Name
* File
* E-mail

#### Services Used

* BackBlaze
* Digital Ocean
* OVH (my dev-machine)

#### Used to be services

* Google Compute Engine
* Google Compute Storage

#### To Do

* Fix hard coding
* Integration with CumulusClips (possibly FFMPEG)
* Better e-mail
* Detailed History of project
