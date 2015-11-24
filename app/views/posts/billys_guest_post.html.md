# Billy's Guest Post

Thanks Leah for hosting my first guest blog post! How exciting.

In this post I'll be talking about how to get up and running with Ruby and Ruby on Rails (RoR) in Ubuntu 15.

OK... Ready?... Let's go...

First things first, let's open up a Terminal by opening the "dash" (the swirly icon in the top left of the screen) and searching for "terminal". You should see a list of application icons, the first of which will be "Terminal". Click that one and a dark window will pop up containing a Terminal and prompt:

	ubuntu@ubuntu-VirtualBox:~$

First let's update our software by running (the $ symbol is just to show you that we're typing these commands into a Terminal prompt):

	$ sudo apt-get update
	$ sudo apt-get upgrade

Let's install some basic things by running the following command:

	$ sudo apt-get install curl git vim

What does that mean? Well, `sudo` means "super user do" and it tells the Terminal to run the command as an admin user (a user that is allowed to install software). `apt-get` is a software package manager, it installs and uninstalls software for you. The instruction `install` is passed to `apt-get` and then `curl git vim` is passed to install as a list of software to install.

When this command finishes you'll have three new pieces of software. `curl` fetches files from the internet, if you run `curl http://google.co.uk` you'll see it spit out the HTML that runs the Google search page. `git` is a version control system, it's the one that GitHub uses, we'll use `git` to grab code from GitHub and push it back in after we've made changes. `vim` is a command-line text editor that we'll use sparingly.

Next, let's download Ruby and Ruby on Rails:

	$ \curl -sSL https://get.rvm.io | bash

This command uses `curl` to download a script that installs RVM, which is the "Ruby Version Manager", we'll use this to install Ruby. The pipe (`|`) symbol means "take the output of the command on the left and provide it as input to the command on the left". The `bash` part then takes the inputted script and executes it.

You'll notice at the end of this process that there are instructions to run this command:

	$ source /home/ubuntu/.rvm/scripts/rvm

`source` is similar to `bash` in that it will execute a script that's given to it. The `rvm` script, when executed, sets up the Ruby environment so that it works. We want this script to run everytime we open a Terminal. To do this we'll add it to our Terminal's startup script:

	$ echo "source /home/ubuntu/.rvm/scripts/rvm" >> ~/.bashrc

`echo` means "print this string to the console", the `>>` part means capture the output of the command on the left and write it into the end of the file on the right. `~/.bashrc` is a path to the Terminal's start up script.

Now we'll need to close the Terminal window and open a new one. This ensures that the new startup script is executed for us.

Now we can install Ruby:

	$ rvm install ruby-2.2

This might take a while...

All done?

Let's setup `git` so it know who we are:

	$ git config --global user.email "my@emailaddress.com"
	$ git config --global user.name "My Name"

This config is only used to display who made what change in GitHub.

Let's go grab our source code from GitHub. We installed `git` earlier on so let's use it to download the code:

	$ cd ~/Desktop
	$ git clone https://github.com/CodeGuild-co/DOMAIN.git
	$ cd DOMAIN
	$ ls

`cd` means "change directory" and we're telling the Terminal to move into the Desktop directory. The `git clone` command says to go to GitHub, find your blog's code and download it. You'll need to change `DOMAIN` to be whatever you're actual domain is (i.e. this blog's domain is `lt`). We then `cd` into the newly downloaded code and use `ls` to "list" the contents. You should see a list of files and folder that look like the contents you see in GitHub.

At this point we need to install the things nessessary to run your blog:

	$ gem install bundle
	$ bundle install
	$ sudo apt-get install nodejs

`gem` is a dependency manager for Ruby. This means that you tell `gem` what libraries and external bits of code you'd to use and it goes away, downloads and installs them, it's like `apt-get` but specifically for Ruby things. In this case `gem install bundle` finds the package called "bundle" and installs it for you. We then use the newly installed `bundle` to install *all* of your blog's dependencies. You should see a giant scrolling list of downloads and installs. Finally, we use `apt-get` to install a bit of node, this is a JavaScript application that Ruby on Rails needs (I don't know why).

Now we've installed everything we need, let's run our blog inside our virtual machine:

	$ rails server

Then open a browser (probably Firefox) and visit [localhost:3000](http://localhost:3000). You should see your blog, but this time it's only running inside the VM. Try making a change to the code and refreshing the page. On the local version you'll see the change, on the `DOMAIN.codeguild.co` version you won't.

To stop the server, and regain control of your Terminal, press Ctrl-c.

Made some changes? Happy with them? Let's push them live:

	$ git add .
	$ git commit -m 'WHAT HAVE YOU CHANGED?'
	$ git push

Now we're using `git` to describe what changes we've made and then to push those changes back up to GitHub. `git add` says take the changes I've made so far and add them to a "commit". A "commit" is a grouping of changes to files. We then use `git commit -m` to describe the commit and "finalise" it. Change the "WHAT HAVE YOU CHANGED" part to be a short description of the changes you made. Finally, `git push` sends the commit you jut described up into GitHub where Heroku will pick it up and put it on your website.

See? Easy!




