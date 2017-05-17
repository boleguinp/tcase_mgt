require 'rails_helper'

describe ProjectsController  , type: :controller do
  describe "GET #index" do
    before(:each) do
      # Create factories: projects
      @project_factory = create_list(:project, 3)
    end
    it "assigns all projects to @projects" do
      get :index
      expect(assigns(:projects)).to eq(@project_factory)
    end
    it "responds to html by default" do
      get :index
      expect(response.status).to eq(200)
      expect(response.content_type).to eq "text/html"
    end
    it "responds to json format" do
      request.accept = "application/json"
      get :index
      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"
    end
    it "responds to xml format" do
      request.accept = "application/xml"
      get :index
      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/xml"
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
  describe "GET #show" do
    before(:each) do
      # Create factory: project
      @project_factory = create(:project)
    end
    it "assigns the requested Project to @project" do
      get :show, params: {id: @project_factory}
      expect(assigns(:project)).to eq(@project_factory)
    end
    it "responds to html by default" do
      get :show, params: {id: @project_factory}
      expect(response.status).to eq(200)
      expect(response.content_type).to eq "text/html"
    end
    it "responds to json format" do
      request.accept = "application/json"
      get :show, params: {id: @project_factory}
      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"
    end
    it "responds to xml format" do
      request.accept = "application/xml"
      get :show, params: {id: @project_factory}
      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/xml"
    end
    it "renders the :show template" do
      get :show, params: {id: @project_factory}
      expect(response).to render_template :show
    end
  end
  describe "GET #new" do
    it "renders the :new template" do
      get :new, params: {id: @project_factory}
      expect(response).to render_template :new
    end
  end
  describe "GET #edit" do
    before(:each) do
      # Create factory: project
      @project_factory = create(:project)
    end
    it "assigns the requested Project to @project" do
      get :edit, params: {id: @project_factory}
      expect(assigns(:project)).to eq(@project_factory)
    end
    it "renders the :edit template" do
      get :edit, params: {id: @project_factory}
      expect(response).to render_template :edit
    end
  end
  describe "POST #create" do
  it "creates the Project" do
    expect{post :create, params: {project: {title: "first title", lead: "pboleguin",
     description: "first description"}}}.to change(Project,:count).by(1)
  end
    it "redirects to the new project" do
      post :create, params: {project: {title: "first title", lead: "pboleguin",
        description: "first description"}}
      expect(response).to redirect_to assigns(:project)
    end
    it "responds to json format" do
      request.accept = "application/json"
      post :create, params: {project: {title: "first title", lead: "pboleguin",
        description: "first description"}}
      expect(response.content_type).to eq "application/json"
    end
    it "responds to xml format" do
      request.accept = "application/xml"
      post :create, params: {project: {title: "first title", lead: "pboleguin",
        description: "first description"}}
      expect(response.content_type).to eq "application/xml"
    end
  end
  describe "DELETE #destroy" do
    before(:each) do
      # Create factory: project
      @project_factory = create(:project)
    end
    it "assigns the requested Project to @project" do
      delete :destroy, params: {id: @project_factory}
      expect(assigns(:project)).to eq(@project_factory)
    end
    it "deletes the Project" do
      expect{delete :destroy, params: {id: @project_factory}}.to change(Project,:count).by(-1)
    end
    it "redirects to projects" do
      delete :destroy, params: {id: @project_factory}
      expect(response).to redirect_to "/projects"
    end
  end
end
