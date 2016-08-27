class AddTwoFieldsToRanks < ActiveRecord::Migration
  def change
    add_column :ranks , :transform_month, :boolean
    add_column :ranks , :transform_week, :boolean
  end
end
