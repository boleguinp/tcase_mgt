require "rails_helper"

RSpec.describe "projects/index", type: :view do
      before(:each) do
        # Create factories: projects
        @projects = create_list(:project, 3)
        assign(:projects, @projects)
      end
      it "displays all the projects" do
        render
        expect(rendered).to include("Project_1").and include("Project_2").and include("Project_3")
        expect(rendered).not_to include("Project_4")
      end
  end
  RSpec.describe "projects/index.html.erb", type: :view do
    before(:each) do
      # Create factories: projects
      @projects = create_list(:project, 3)
      assign(:projects, @projects)
    end
    it "renders the right template" do
      render
      expect(rendered).to match /HTML/
    end
  end
