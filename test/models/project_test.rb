require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save project without title" do
    project = Porject.new
    assert_not project.save
  end


end
