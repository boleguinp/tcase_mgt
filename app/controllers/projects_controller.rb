class ProjectsController < ApplicationController
  #respond_to :html, :xml, :json
  def index
    @projects = Project.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
      format.json { render :json => @projects }
    end
  end
  def show
    @project = Project.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
      format.json { render :json => @project }
    end
  end
  def new
    @project = Project.new
  end
  def edit
    @project = Project.find(params[:id])
  end
  def create
    @project = Project.new(project_params)
    if @project.save
      respond_to do |format|
        format.html { redirect_to @project}
        format.xml  { render :xml => @project }
        format.json { render :json => @project }
      end
    else
      respond_to do |format|
        format.html { render 'new' }
        format.xml  { render :xml => @project }
        format.json { render :json => @project }
      end
    end
  end
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end
  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
