require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save project without title" do
    project = Project.new
    assert_not project.save, 'Saved project with out title'
  end


end
