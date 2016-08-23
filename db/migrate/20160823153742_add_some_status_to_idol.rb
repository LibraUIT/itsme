class AddSomeStatusToIdol < ActiveRecord::Migration
  def change
    add_column :idols , :approved, :boolean, default: true
  end
end
