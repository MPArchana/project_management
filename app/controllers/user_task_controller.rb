class UserTaskController < ApplicationController
  def index
  end

  def create
  		@user_task = UserTask.new(user_task_params)
  		@user_task.save
  		redirect_to tasks_path
  end

  def show
  end

   private
    def user_task_params
      params.require(:user_task).permit(:user_id, :task_id)
    end
end

