class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :random_idols

  def random_idols
    schedule_task = ScheduleTask.first
    if schedule_task
      number_of_run = schedule_task.number_of_run.to_i
      now = Time.now
      last_run = schedule_task.updated_at
      next_run = last_run + 2 * 60
      if now >= next_run
        Idol.update_sort unless Idol.count.zero?
        schedule_task.update(number_of_run: number_of_run + 1)
        schedule_task.save
        puts "#{Time.now} - Success!"
      end
    else
      Idol.update_sort unless Idol.count.zero?
      ScheduleTask.create!(number_of_run: 0)
    end
  end
end
