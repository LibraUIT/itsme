class CreateBanner < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.timestamps null: false
      t.string :image
      t.integer :sort
    end
  end
end
