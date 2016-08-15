class AddSomeFieldToIdol < ActiveRecord::Migration
  def change
    add_column :idols, :rank, :integer, unique: true
    add_column :idols, :status, :string
  end
end
