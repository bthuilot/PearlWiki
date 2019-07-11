# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

HOME_DEFAULT_PAGE = "# Welcome to Pearl Wiki\n"\
                    "A wiki powered by rails\n"\
                    "\n\n"\
                    "To get started, create a [category](/categories/new) and [post](/page/new) or edit the [home page](/home/edit) and the [about page](/about/edit)."

ABOUT_DEFAULT_PAGE = "# About the wiki\n"\
                     "Check me out on [Github](https://github.com/bthuilot/RailsWiki)!"
#
SystemPage.create({name: "Home", contents: HOME_DEFAULT_PAGE})
SystemPage.create({name: "About", contents: ABOUT_DEFAULT_PAGE})
