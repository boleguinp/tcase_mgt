require "rails_helper"
RSpec.describe "projects/show.html.erb" do
      before(:each) do
        # Create factory: project
        @project = create :project
        # Create factories: tcases
        @tcases = create_list(:t_case, 3, project: @project)
      end
      it "renders the html template" do
        render
        # visible text
        expect(rendered).to include("Add a Test Case:")
        # html tag
        expect(rendered).to include('<a href="/projects">Back</a>')
      end
      it "displays all the test cases" do
        render
        expect(rendered).to include("TC4").and include("TC5").and include("TC6")
        expect(rendered).not_to include("TC7")
      end
  end
