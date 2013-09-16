rtqna - A question submission and voting tool for real-time events: town halls, panel discussions, Q&amp;A
=========================================

rtqna is a real-time application designed to support the posting of questions to ask a speak (or panel of speakers) during a live event such as a Town Hall, a Meetup, an expert panel, or a presentation, with the ability for the members of the audience to up-vote questions that they are most interested in. Think of it like a collaborative QnA.

Moderators have the ability to create a QnA event, share the URL with their audience members, and manage the questions being asked as they come in.

Audience members can submit questions, and upvote the questions that they'd like to see asked.

rtqna is built using [Meteor](http://meteor.com)

### Development setup
In our development, we use [Vagrant](http://vagrantup.com)

#### Prerequisites (for Vagrant install)
 * [VirtualBox](https://www.virtualbox.org/wiki/Downloads), or another [Vagrant-compatible virtualization provider](http://docs.vagrantup.com/v2)
 * [Vagrant](http://vagrantup.com)

#### Setup
After you've cloned a copy of the repo, cd into it, and just issue:
    vagrant up
After a few moments, the VM should be up and running. Provided that you have an `ssh` command available in your path, you can login to the VM:
    vagrant ssh
THen, it's just a matter of start up the meteor runtime. The expectation is that you'll be making all your code changes in your host operating system using your favorite editor or IDE.
    cd /vagrant/rtqna
    mrt run
From there, you can access your running version of the app on the private IP for the VM at: [http://10.11.12.13:3000]

#### When you're finished running meteor, just press `Ctrl-C` within the vagrant ssh session to shut it down.

When you're finished, either issue a shutdown from within the VM `sudo shutdown -h now` or exit out and ask Vagrant to suspend it `vagrant suspend` or shut it down `vagrant halt`. If you don't need the VM anymore, you can issue `vagrant destroy`. 