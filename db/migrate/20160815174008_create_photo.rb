class CreatePhoto < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.timestamps null: false
      t.string :image
      t.integer :idol_id
    end
  end
end
