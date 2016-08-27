class CreateManager < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.string :fullname
      t.string :phone
      t.string :email
      t.string :facebook
      t.string :position
      t.string :avatar
      t.timestamps null: false
    end
  end
end
