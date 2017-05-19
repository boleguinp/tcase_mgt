require 'rails_helper'

RSpec.describe "TCase", type: :model do
    before(:each) do
      # Create factory: project
      @project = create :project
    end
    context "#new" do
      it "is invalid without a tcase_id" do
        tcase = TCase.new(t_case_id: nil, title: "title", scenario: "scenario",
        status: "status", project_id: @project.id)
        expect(tcase).to_not be_valid
      end
      it "is invalid without a tcase_id minimum length of 3" do
        tcase = TCase.new(t_case_id: "TC", title: "title", scenario: "scenario",
        status: "status", project_id: @project.id)
        expect(tcase).to_not be_valid
      end
      it "is valid with a tcase_id minimum length of 3" do
        tcase = TCase.new(t_case_id: "TC1", title: "title", scenario: "scenario",
        status: "status", project_id: @project.id)
        expect(tcase).to be_valid
      end
      it "is invalid without a project_id" do
        tcase = TCase.new(t_case_id: "TC01", title: "title", scenario: "scenario",
        status: "status", project_id: nil)
        expect(tcase).to_not be_valid
      end
      it "is invalid without an existing project_id" do
        tcase = TCase.new(t_case_id: "TC01", title: "title", scenario: "scenario",
        status: "status", project_id: 3)
        expect(tcase).to_not be_valid
      end
      it "is valid with an existing project_id" do
        tcase = TCase.new(t_case_id: "TC01", title: "title", scenario: "scenario",
        status: "status", project_id: @project.id)
        expect(tcase).to be_valid
      end
    end
end
