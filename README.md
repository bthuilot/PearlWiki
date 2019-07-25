# Pearl Wiki
Open source wiki software powered by [rails](https://github.com/rails/rails)

I started this project when I was looking for wiki software to use for a club I was a apart of and didn't like any of the options I found

Thus spawned this!


## Getting started
*The wiki requires ruby versions >= 2.5.0*

To install first clone the source using 
```bash
$ git clone https://github.com/bthuilot/PearlWiki
$ cd PearlWiki
```

Once inside the cloned directory, run 
```bash
# Install Dependecys
$ gem install bundler && bundle install
# Set up and seed database
$ rake db:migrate
$ rake db:seed
# Start the server
rails server
```

## Code Status 
[![Build Status](https://travis-ci.com/bthuilot/PearlWiki.svg?token=DwRwXcm2t95em7ygX8ov&branch=master)](https://travis-ci.com/bthuilot/PearlWiki)

## License
Pearl Wiki is released under the [MIT License](https://github.com/bthuilot/PearlWiki/blob/master/LICENSE).
