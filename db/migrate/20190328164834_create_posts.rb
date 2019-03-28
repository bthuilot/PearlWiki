class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :contents
      t.datetime :created
      t.datetime :updated
      t.integer :category_id

      t.timestamps
    end
  end
end
