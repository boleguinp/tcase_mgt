require 'rails_helper'

RSpec.describe "TCases", type: :request do
  describe "GET /{project_id}" do
    before(:each) do
      # Create factory: project
      @project = create :project
      # Create factories: tcases
      @tcases = create_list(:t_case, 3, project: @project)
    end
    it "gives a list of tcases for a project" do
      get "/projects/#{@project.id}"
      expect(response).to have_http_status(200)
      expect(response.body).to include("TC1").and include("Title_1").and include ("Scenario_1")
      expect(response.body).to include("TC2").and include("Title_2").and include ("Scenario_2")
      expect(response.body).to include("TC3").and include("Title_3").and include ("Scenario_3")
    end
  end
  describe "POST /{project_id}/t_cases" do
    before(:each) do
      # Create factory: project
      @project = create :project
    end
    it "creates a new t_case" do
      post "/projects/#{@project.id}/t_cases", params: {t_case: {t_case_id: "TC01",
      title: "Title_01", scenario: "Scenario_01", status: "Passed"}}
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(assigns(:project))
      follow_redirect!
      expect(response).to have_http_status(200)
      expect(response.body).to include("TC01").and include("Title_01").and include("Scenario_01").and include("Passed")
    end
  end
  describe "DELETE /{project_id}/t_cases" do
    before(:each) do
      # Create factory: project
      @project = create :project
      # Create factory: tcase
      @tcase = create(:t_case, project: @project)
    end
    it "removes a t_case" do
      delete "/projects/#{@project.id}/t_cases/#{@tcase.id}", params: {t_case_id: "#{@tcase.id}",
      project_id: "#{@project.id}"}
      expect(response).to have_http_status(302)
      expect(response).to redirect_to(assigns(:project))
      follow_redirect!
      expect(response).to have_http_status(200)
      expect(response.body).not_to include("TC1")
      expect(response.body).not_to include("Title_1")
      expect(response.body).not_to include("Scenario_1")
      expect(response.body).not_to include("Passed")
    end
  end
end
