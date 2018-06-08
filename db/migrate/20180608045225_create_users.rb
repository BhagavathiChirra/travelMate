class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :username
      t.text :email
      t.text :password_digest
      t.text :password_confirmation
      t.text :bio

      t.timestamps
    end
  end
end
