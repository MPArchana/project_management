class UserProjectController < ApplicationController
  def index
  end

  def create
  	@project = ProjectUser.new(project_params)
 
  	@project.save
  	redirect_to projects_path
  end

  def sow
  end
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:user_project).permit(:project_id, :user_id)
    end

end




