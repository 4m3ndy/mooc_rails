require 'test_helper'

class LectureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Invalid Lecture without title" do
    invalid_lecture = Lecture.new
    invalid_lecture.content = 'test_content'
    invalid_lecture.course_id = 1
    invalid_lecture.user_id = 1

    assert_not invalid_lecture.save
    assert invalid_lecture.invalid?
  end

  test "Invalid Lecture without content" do
    invalid_lecture = Lecture.new
    invalid_lecture.title = 'test_title'
    invalid_lecture.course_id = 1
    invalid_lecture.user_id = 1

    assert_not invalid_lecture.save
    assert invalid_lecture.invalid?
  end

  test "Invalid Lecture without course_id" do
    invalid_lecture = Lecture.new
    invalid_lecture.content = 'test_content'
    invalid_lecture.title = 'test_title'
    invalid_lecture.user_id = 1

    assert_not invalid_lecture.save
    assert invalid_lecture.invalid?
  end

  test "Valid Lecture" do
    valid_lecture = Lecture.new
    valid_lecture.content = 'test_content'
    valid_lecture.title = 'test_title'
    valid_lecture.course_id = 1
    valid_lecture.user_id = 1

    assert valid_lecture.valid?
  end

  test "Fixture Inserted " do
    assert_equal 1, Lecture.all.size
  end

end
