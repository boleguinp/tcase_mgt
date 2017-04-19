require 'rails_helper'
include WebMock::API

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

      post "/projects", params: {project: {title: "first title",
        description: "first description"}}
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(assigns(:project))
      follow_redirect!
      expect(response.body).to include("first title").and include("first description")
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
  describe "STUBBING GET /projects/project.id" do
    before(:each) do
      # Create factory: project
      @project = create :project
      # Fake response
      @fake_response = '[{"id":45,"title":"Fake Title","description":"Fake Description",
        "created_at":"2017-04-19T14:27:32.441Z","updated_at":"2017-04-19T14:27:32.441Z"}]'
      stub_request(:get, "/projects/#{@project.id}.json").to_return(:body => @fake_response, :headers => {})
    end
    it "gives a list of projects" do
      get "/projects/#{@project.id}.json"
      WebMock.should have_requested(:get, "/projects/#{@project.id}.json").with(:body => @fake_response, :headers => {})
      puts response.body
      # expect(JSON.parse(response.body)).to include("Fake Title").and include("Fake Description")
      # expect(response.body).not_to include("Project_1")
      # expect(response.body).not_to include("Proj_Description_1")
    end
  end
end
