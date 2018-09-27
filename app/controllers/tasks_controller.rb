class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :assign_users_form, :assign_users]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @comment = Comment.new
    @comments = Comment.where(task_id: @task.id)
  end

  # GET /tasks/new
  def new
    @task = Task.new
    #params[:project_id].inspect
  end

  # GET /tasks/1/edit
  def edit
  end

  def assign_users_form
    @users = User.all
  end


  def assign_users
     @task.user_ids = params[:task][:user_ids] rescue []
    if @task.save
      redirect_to @task, notice: "Users added successfully."
    else
      redirect_to assign_users_form_task_path(@task), alert: "Error: #{task.errors.full_messages.join(",")}"
    end   
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    #if @task.done
      #redirect_to @task, notice: 'Task already done.'
    #else
      respond_to do |format|
        if @task.update(task_params)
          format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
          format.json { render :show, status: :ok, location: @task }
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    #end
  end

  # DELETE /tasks/1
  # DELETE /tSasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
      #s@comment = Comment.new
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:project_id, :name, :status, :due_date, :label, :done, :user_ids => [])
    end
end
