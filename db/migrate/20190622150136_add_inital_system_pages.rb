class AddInitalSystemPages < ActiveRecord::Migration[5.2]
  def up
    SystemPage.create({name: "Home", contents: HOME_DEFAULT_PAGE});
    SystemPage.create({name: "About", contents: ABOUT_DEFAULT_PAGE});
  end

  def down
    SystemPage.delete_all
  end
end


HOME_DEFAULT_PAGE = "# Welcome to Pearl Wiki\n"\
                    "A wiki powered by rails\n"\
                    "\n\n"\
                    "To get started, create a [category](/categories/new) and [post](/page/new) or edit the [home page](/home/edit) and the [about page](/about/edit)."

ABOUT_DEFAULT_PAGE = "# About the wiki\n"\
                     "Check me out on [Github](https://github.com/bthuilot/RailsWiki)!"
