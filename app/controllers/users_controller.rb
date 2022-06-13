class UsersController < ApplicationController
  before_action :set_data, only: %i[ show ]
  def show
    #タスクの成功率に関する式
    @success_task = @task.where(status: 1)

    #ビートの平均時間を求める式
    total_time = 0
    @beats.each do |beat|
      total_time += beat.beat_time
    end
    @average_time = total_time.fdiv(@beats.count)

    #目標値に対する達成度合いを求める式
    @current_number = @beats.count.to_f / @target_number * 100

    #今週作ったビートを取得するコード
    today = Time.now
    range = today.all_week(:sunday)
    @weekly_beats = @beats.where(created_at: range)
  
  end



  private 

  def set_data
    @user = current_user
    @task = @user.tasks
    @beats = @user.beats 
    @notes = @user.notes
    @target_number = 100
  end
end
