# spec/models/project.rb
require 'rails_helper'

RSpec.describe "Project", type: :model do
    context "#new" do
      it "is invalid without a title" do
        project = Project.new(title: nil, description: "Proj_Description_1")
        expect(project).to_not be_valid
      end
      it "is valid without a description" do
        project = Project.new(title: "Project_1", description: nil)
        expect(project).to be_valid
      end
      it "is invalid without a title minimum lenght of 5" do
        project = Project.new(title: "Proj", description: "Proj_Description_1")
        expect(project).to_not be_valid
      end
      it "is valid with a title minimum lenght of 5" do
        project = Project.new(title: "Proj_", description: "Proj_Description_1")
        expect(project).to be_valid
      end
    end
    context "#has_many" do
      before(:each) do
        # Create factory: project
        @project = create :project
        # Create factories: tcases
        @tcases = create_list(:t_case, 3, project: @project)
      end
      it "has a many relations with t_cases" do
        expect(@project.t_cases.size).to be_equal 3
      end
    end
end
