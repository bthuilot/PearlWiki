class AddHomepageToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :homepage, :text
  end
end
