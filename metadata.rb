maintainer       "Pavel Snagovsky"
maintainer_email "paha01@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures nginx2"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.1"

recipe "nginx", "Installs nginx package and sets up configuration with Debian apache style with sites-enabled/sites-available"
recipe "static", "Simple site with index."

supports "ubuntu"
