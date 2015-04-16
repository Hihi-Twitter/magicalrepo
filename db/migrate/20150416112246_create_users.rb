class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :password_confirmation
      t.string :handle
      t.references :followers
      t.references :following
    end
  end
end
