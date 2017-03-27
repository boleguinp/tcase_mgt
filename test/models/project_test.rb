require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "should not save project without title" do
    project = Project.new
    assert_not project.save, "Saved the project without a title"
  end
  test "should_report_error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end
end
