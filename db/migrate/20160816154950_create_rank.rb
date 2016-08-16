class CreateRank < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.timestamps null: false
      t.integer :idol_id
      t.integer :all_rank
      t.integer :month_rank
      t.integer :week_rank
    end
  end
end
