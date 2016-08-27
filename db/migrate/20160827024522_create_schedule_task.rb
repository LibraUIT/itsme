class CreateScheduleTask < ActiveRecord::Migration
  def change
    create_table :schedule_tasks do |t|
      t.integer :number_of_run
      t.timestamps null: false
    end
  end
end
