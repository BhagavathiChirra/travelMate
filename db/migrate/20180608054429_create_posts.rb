class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :image
      t.integer :city_id
      t.integer :user_id
      t.text :content

      t.timestamps
    end
  end
end
