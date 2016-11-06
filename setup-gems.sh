#!/bin/bash

sudo gem install httparty sinatra thin --no-ri --no-rdoc
sudo gem install faye -v 1.2.2 --no-ri --no-rdoc #until they fix https://github.com/faye/faye/issues/452
