class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.boolean :status, default: false
      t.timestamps null: false
    end
  end
end
