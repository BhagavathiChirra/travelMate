class AddAddressToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :address, :text
  end
end
