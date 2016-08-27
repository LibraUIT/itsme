class AddTransform < ActiveRecord::Migration
  def change
    add_column :ranks , :transform, :boolean
  end
end
