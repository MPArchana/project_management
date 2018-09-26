class CommentsController < ApplicationController
   before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
		@comment = Comment.new
	end

  def create
  	@task = Task.find(params[:comment][:task_id])
  	puts "here #{@task}"
    puts "================="
    puts params.inspect
    puts params[:comment][:comment].inspect
    @comment = Comment.create(comment: params[:comment][:comment], task_id: params[:comment][:task_id])

    redirect_to task_path(@task)
  end

  def update
  end

  
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to task_path, notice: 'comment deleted' }
      format.json { head :no_content }
    end
  end

  def view
  end
   
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def set_task
      @comment = Comment.find(params[:id])
      #@comment = Comment.new
    end

    def comment_params
      params.require(:comment).permit(:comment, :task_id)
    end
end

