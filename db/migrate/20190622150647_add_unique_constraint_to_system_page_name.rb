class AddUniqueConstraintToSystemPageName < ActiveRecord::Migration[5.2]
  def change
    add_index :system_pages, :name, unique: true
  end
end
