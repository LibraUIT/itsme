class RanameIdol < ActiveRecord::Migration
  def up
    rename_column :idols, :rank, :raking
  end
end
