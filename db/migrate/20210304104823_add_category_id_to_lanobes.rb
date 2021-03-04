class AddCategoryIdToLanobes < ActiveRecord::Migration[5.2]
  def change
    add_column :lanobes, :category_id, :integer
  end
end
