class TCasesController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @t_case = @project.t_cases.create(t_case_params)
    redirect_to project_path(@project)
  end
  def destroy
    @project = Project.find(params[:project_id])
    @t_case = @project.t_cases.find_by_t_case_id(params[:t_case_id])
    unless @t_case.present?
      @t_case = @project.t_cases.find(params[:t_case_id])
    end
    @t_case.destroy
    redirect_to project_path(@project)
  end

  private
  def t_case_params
    params.require(:t_case).permit(:t_case_id, :title, :scenario, :status)
  end
end
