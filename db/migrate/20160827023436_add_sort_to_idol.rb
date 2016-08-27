class AddSortToIdol < ActiveRecord::Migration
  def change
    add_column :idols , :sort, :integer
  end
end
