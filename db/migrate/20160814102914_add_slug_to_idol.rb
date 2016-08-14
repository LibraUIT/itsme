class AddSlugToIdol < ActiveRecord::Migration
  def change
    add_column :idols, :slug, :string, unique: true
  end
end
