class CreateSystemPages < ActiveRecord::Migration[5.2]
  def change
    create_table :system_pages do |t|
      t.string :name
      t.text :contents

      t.timestamps
    end
  end
end
