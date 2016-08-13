class CreateIdol < ActiveRecord::Migration
  def change
    create_table :idols do |t|
      t.timestamps null: false
      t.string :name
      t.string :birthday
      t.string :nickname
      t.string :phone
      t.string :facebook
      t.string :instagram
      t.string :avatar
      t.integer :followers
      t.string :itsme_id
      t.string :bio
    end
  end
end
