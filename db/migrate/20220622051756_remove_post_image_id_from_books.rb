class RemovePostImageIdFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :post_image_id, :integer
  end
end
