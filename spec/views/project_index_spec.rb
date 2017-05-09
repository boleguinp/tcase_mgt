require "rails_helper"
RSpec.describe "projects/index.html.erb" do
      before(:each) do
        # Create factories: projects
        @projects = create_list(:project, 3)
        assign(:projects, @projects)
      end
      it "renders the html template" do
        render
        # visible text
        expect(rendered).to include("Projects List")
        # html tag
        expect(rendered).to include('<a href="/projects/new">New Project</a>')
      end
      it "displays all the projects" do
        render
        expect(rendered).to include("Project_4").and include("Project_5").and include("Project_6")
        expect(rendered).not_to include("Project_7")
      end
  end
