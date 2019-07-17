# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Create the default pages for home and about
SystemPage.create({name: "Home", contents: "# About the wiki\n"\
                     "Check me out on [Github](https://github.com/bthuilot/PearlWiki)!"})
SystemPage.create({name: "About", contents: "# Welcome to Pearl Wiki\n"\
                    "A wiki powered by rails\n"\
                    "\n\n"\
                    "To get started, create a [category](/categories/new) and [post](/page/new) or edit the [home page](/home/edit) and the [about page](/about/edit)."})
