# Dealerk Varying Vagrant Vagrants

Dealerk  Varying Vagrant Vagrants is an open source [Vagrant](http://vagrantup.com) configuration focused on [WordPress](http://wordpress.org) development. VVV is MIT Licensed.

## Overview

### How to Use Varying Vagrant Vagrants

#### Software Requirements

VVV requires recent versions of both Vagrant and VirtualBox to be installed.

[Vagrant](http://www.vagrantup.com) is a "tool for building and distributing development environments". It works with [virtualization](http://en.wikipedia.org/wiki/X86_virtualization) software such as [VirtualBox](https://www.virtualbox.org/) to provide a virtual machine sandboxed from your local environment.

#### VVV as a MAMP/XAMPP Replacement

Once Vagrant and VirtualBox are installed, download or clone VVV and type `vagrant up` to automatically build a virtualized Ubuntu server on your computer containing everything needed to develop a WordPress theme or plugin. See our section on [The First Vagrant Up](#the-first-vagrant-up) for detailed instructions.

### The First Vagrant Up

1. Start with any local operating system such as Mac OS X, Linux, or Windows.
1. Install [VirtualBox 4.3.x](https://www.virtualbox.org/wiki/Downloads)
1. Install [Vagrant 1.6.x](http://www.vagrantup.com/downloads.html)
    * `vagrant` will now be available as a command in your terminal, try it out.
    * ***Note:*** If Vagrant is already installed, use `vagrant -v` to check the version. You may want to consider upgrading if a much older version is in use.
1. Install the [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) plugin with `vagrant plugin install vagrant-hostsupdater`
    * Note: This step is not a requirement, though it does make the process of starting up a virtual machine nicer by automating the entries needed in your local machine's `hosts` file to access the provisioned VVV domains in your browser.
    * If you choose not to install this plugin, a manual entry should be added to your local `hosts` file that looks like this: `192.168.50.4  vvv.dev local.wordpress.dev local.wordpress-trunk.dev src.wordpress-develop.dev build.wordpress-develop.dev`
1. Install the [vagrant-triggers](https://github.com/emyl/vagrant-triggers) plugin with `vagrant plugin install vagrant-triggers`
    * Note: This step is not a requirement. When installed, it allows for various scripts to fire when issuing commands such as `vagrant halt` and `vagrant destroy`.
    * By default, if vagrant-triggers is installed, a `db_backup` script will run on halt, suspend, and destroy that backs up each database to a `dbname.sql` file in the `{vvv}/database/backups/` directory. These will then be imported automatically if starting from scratch. Custom scripts can be added to override this default behavior.
    * If vagrant-triggers is not installed, VVV will not provide automated database backups.
1. Clone or extract the Varying Vagrant Vagrants project into a local directory
    * `git clone git@bitbucket.org:drivek/dkvagrant.git`
1. In a command prompt, change into the new directory with `cd dkvagrant`
1. Start the Vagrant environment with `vagrant up`
    * Be patient as the magic happens. This could take a while on the first run as your local machine downloads the required files.
    * Watch as the script ends, as an administrator or `su` ***password may be required*** to properly modify the hosts file on your local machine.
1. Visit any of the following default sites in your browser:
    * [http://autoviemme.dev/](http://autoviemme.dev/) Autoviemme
    * [http://gruppobossoni.dev/](http://gruppobossoni.dev/) Gruppo Bossoni
    * [http://leonori.dev/](http://leonori.dev/) Leonori
    * [http://malvestitigroup.dev/](http://malvestitigroup.dev/) Malvestiti
    * [http://vvv.dev/](http://vvv.dev/) for a default dashboard containing several useful tools

Fancy, yeah?

### What Did That Do?

The first time you run `vagrant up`, a packaged box containing a basic virtual machine is downloaded to your local machine and cached for future use. The file used by Varying Vagrant Vagrants contains an installation of Ubuntu 14.04 and is about 332MB.

After this box is downloaded, it begins to boot as a sandboxed virtual machine using VirtualBox. Once booted, it runs the provisioning script included with VVV. This initiates the download and installation of around 100MB of packages on the new virtual machine.

The time for all of this to happen depends a lot on the speed of your Internet connection. If you are on a fast cable connection, it will likely only take several minutes.

On future runs of `vagrant up`, the packaged box will be cached on your local machine and Vagrant will only need to apply the requested provisioning.

* ***Preferred:*** If the virtual machine has been powered off with `vagrant halt`, `vagrant up` will quickly power on the machine without provisioning.
* ***Rare:*** If you would like to reapply the provisioning scripts with `vagrant up --provision` or `vagrant provision`, some time will be taken to check for updates and packages that have not been installed.
* ***Very Rare:*** If the virtual machine has been destroyed with `vagrant destroy`, it will need to download the full 100MB of package data on the next `vagrant up`.

### Now What?

Now that you're up and running, start poking around and modifying things.

1. Access the server via the command line with `vagrant ssh` from your `dkvagrant` directory. You can do almost anything you would do with a standard Ubuntu installation on a full server.
    * **MS Windows users:** An SSH client is generally not distributed with Windows PCs by default. However, a terminal emulator such as [PuTTY](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html) will provide access immediately.
1. Power off the box with `vagrant halt` and turn it back on with `vagrant up`.
1. Suspend the box's state in memory with `vagrant suspend` and bring it right back with `vagrant resume`.
1. Reapply provisioning to a running box with `vagrant provision`.
1. Destroy the box with `vagrant destroy`. Files added in the `www` directory will persist on the next `vagrant up`.

#### Caveats

VVV relies on the stability of both Vagrant and Virtualbox. These caveats are common to Vagrant environments and are worth noting:
* If the directory VVV is inside of is moved once provisioned (`vagrant-local`), it may break.
    * If `vagrant destroy` is used before moving, this should be fine.
* If Virtualbox is uninstalled, VVV will break.
* If Vagrant is uninstalled, VVV will break.

The default memory allotment for the VVV virtual machine is 1024MB. 

### Credentials and Such

All database usernames and passwords for WordPress installations included by default are `wp` and `wp`.

#### MySQL Root
* User: `root`
* Pass: `root`
* See: [Connecting to MySQL](https://github.com/varying-vagrant-vagrants/vvv/wiki/Connecting-to-MySQL) from your local machine

### What do you get?

A bunch of stuff!

1. [Ubuntu](http://www.ubuntu.com/) 14.04 LTS (Trusty Tahr)
1. [WordPress Develop](http://develop.svn.wordpress.org/trunk/)
1. [WordPress Stable](http://wordpress.org/)
1. [WordPress Trunk](http://core.svn.wordpress.org/trunk/)
1. [WP-CLI](http://wp-cli.org/)
1. [nginx](http://nginx.org/) 1.6.x
1. [mysql](http://www.mysql.com/) 5.5.x
1. [php-fpm](http://php-fpm.org/) 5.5.x
1. [memcached](http://memcached.org/) 1.4.13
1. PHP [memcache extension](http://pecl.php.net/package/memcache/3.0.8/) 3.0.8
1. PHP [xdebug extension](http://pecl.php.net/package/xdebug/2.2.5/) 2.2.5
1. PHP [imagick extension](http://pecl.php.net/package/imagick/3.1.2/) 3.1.2
1. [PHPUnit](http://pear.phpunit.de/) 4.0.x
1. [ack-grep](http://beyondgrep.com/) 2.04
1. [git](http://git-scm.com/) 1.9.x
1. [subversion](http://subversion.apache.org/) 1.8.x
1. [ngrep](http://ngrep.sourceforge.net/usage.html)
1. [dos2unix](http://dos2unix.sourceforge.net/)
1. [Composer](https://github.com/composer/composer)
1. [phpMemcachedAdmin](https://code.google.com/p/phpmemcacheadmin/)
1. [phpMyAdmin](http://www.phpmyadmin.net/) 4.1.14 (multi-language)
1. [Opcache Status](https://github.com/rlerdorf/opcache-status)
1. [Webgrind](https://github.com/jokkedk/webgrind)
1. [NodeJs](http://nodejs.org/) Current Stable Version
1. [grunt-cli](https://github.com/gruntjs/grunt-cli) Current Stable Version