require 'rails_helper'

describe TCasesController  , type: :controller do
  describe "POST #create" do
    before(:each) do
      # Create factory: project
      @project_factory = create(:project)
    end
    it "creates a new tcase" do
      expect{post :create, params: {t_case: {t_case_id: "TC01",
      title: "Title_01", scenario: "Scenario_01", status: "Passed",
      }, project_id: @project_factory.id}}.to change(TCase, :count).from(0).to(1)
    end
    it "is assigned to the right project" do
      post :create, params: {t_case: {t_case_id: "TC01",
      title: "Title_01", scenario: "Scenario_01", status: "Passed",
      }, project_id: @project_factory.id}
      expect(assigns(:t_case).project_id).to eq(@project_factory.id)
    end
   it 'redirects to project path' do
     post :create, params: {t_case: {t_case_id: "TC01",
     title: "Title_01", scenario: "Scenario_01", status: "Passed",
     }, project_id: @project_factory.id}
     expect(response).to redirect_to(assigns(:project))
   end
 end   
  describe "DELETE #destroy" do
    before(:each) do
      # Create factory: project
      @project_factory = create :project
      # Create factory: tcase
      @tcase_factory = create(:t_case, project: @project_factory)
    end
    it "assigns the requested TCase to @tcase" do
      delete :destroy, params: {project_id: @project_factory.id,
        t_case_id: @tcase_factory.id}
      expect(assigns(:t_case)).to eq(@tcase_factory)
    end
    it "deletes a tcase" do
      expect{delete :destroy, params: {project_id: @project_factory.id,
        t_case_id: @tcase_factory.id}}.to change(TCase,:count).by(-1)
    end
    it "redirects to projects" do
      delete :destroy, params: {project_id: @project_factory.id,
        t_case_id: @tcase_factory.id}
      expect(response).to redirect_to assigns(:project)
    end
  end
end
