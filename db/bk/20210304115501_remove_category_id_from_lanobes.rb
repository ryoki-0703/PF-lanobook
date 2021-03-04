class RemoveCategoryIdFromLanobes < ActiveRecord::Migration[5.2]
  def change
    remove_column :lanobes, :category_id, :integer
  end
end
