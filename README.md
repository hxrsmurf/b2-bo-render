# b2-bo-render

This is a basic script that I thought of after playing around with [CummulusClips](http://cumulusclips.org/). I would like to eventually implement a better rendering machine/virtual machine. This would allow archiving at the same time. 

I was using [Google Compute Engine Storage](https://cloud.google.com/storage/) (or whatever), but the outgoing bandwidth was eating me alive. 

I as using (Google Compute Engine)[https://cloud.google.com/compute/], but that was eating me alive aswell. Especially, since I was doing the 64-core !

The video file is hard-coded as [Big Buck Bunny](http://bbb3d.renderfarming.net/).

The [Digital Ocean](https://www.digitalocean.com) Droplet is hard-coded as 512mb (their smallest offering). 

You need to set the [Backblaze](https://www.backblaze.com/) B2 Account and Secret key at the top.

Note: This deletes the droplet when you are done.

These need to be filled in manually below:
* B2 Bucket Name
* File
* E-mail




