class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :auth_token
      t.string :username
      t.text :bio

      t.timestamps
    end
  end
end
