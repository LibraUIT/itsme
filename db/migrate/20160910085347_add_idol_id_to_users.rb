class AddIdolIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :idol_id, :integer
  end
end
