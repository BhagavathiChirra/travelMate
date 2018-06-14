class AddPostIdToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :post_id, :integer
  end
end
