class CreatePolicy < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.text :content
      t.boolean :status, default: false
    end
  end
end
