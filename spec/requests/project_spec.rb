require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /projects" do
    before(:each) do
      # Create factories: projects
      @projects = create_list(:project, 3)
    end
    it "gives a list of projects" do
      get "/projects"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("projects/index")
      expect(response.body).to include("Project_1").and include("Project_2").and include("Project_3")
      expect(response.body).not_to include("Project_4")
    end
  end
  describe "POST /projects" do
    it "creates a new project" do
      get "/projects/new"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
      expect(response.body).to include("New Project")

      post "/projects", params: {project: {title: "first title", lead: "pboleguin",
        description: "first description"}}
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(assigns(:project))
      follow_redirect!
      expect(response.body).to include("first title").and include("pboleguin").and include("first description")
    end
  end
  describe "DELETE /projects/:id" do
    before(:each) do
      # Create factory: project
      @project = create :project
    end
    it "removes a project" do
      get "/projects"
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template("projects/index")
      expect(response.body).to include("#{@project.title}").and include("#{@project.description}")

      delete "/projects/#{@project.id}", params: {id: @project.id}
      expect(response).to have_http_status(302)
      expect(response).to redirect_to("/projects")
      follow_redirect!
      expect(response.body).not_to include("#{@project.title}")
      expect(response.body).not_to include("#{@project.description}")
    end
  end
end
