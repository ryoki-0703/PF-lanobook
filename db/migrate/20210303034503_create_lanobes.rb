class CreateLanobes < ActiveRecord::Migration[5.2]
  def change
    create_table :lanobes do |t|
      t.string :title
      t.text :introduction
      t.string :image_id
      t.integer :user_id

      t.timestamps
    end
  end
end
