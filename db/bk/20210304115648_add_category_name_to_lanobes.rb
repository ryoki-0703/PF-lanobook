class AddCategoryNameToLanobes < ActiveRecord::Migration[5.2]
  def change
    add_column :lanobes, :category_name, :string
  end
end
