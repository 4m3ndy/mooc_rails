require 'test_helper'

class LecturesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
     @lecture = lectures(:one)
  end


  test "should get index" do
    sign_in(User.all.first)
    get :index
    assert_response(404)
    assert_nil assigns(:lectures)
    sign_out(User.all.first)
  end

  test "should get new" do
    sign_in(User.all.first)
    get :new
    assert_response :success
    sign_out(User.all.first)
  end

  test "should create lecture" do
    sign_in(User.all.first)
    assert_difference('Lecture.count') do
      post :create, lecture: { title: @lecture.title ,content: @lecture.content, course_id: @lecture.course_id, user_id: @lecture.user_id }
    end
    assert_redirected_to lecture_path(assigns(:lecture))
    sign_out(User.all.first)
  end

  test "should show lecture" do
    sign_in(User.all.first)
    get :show, id: @lecture.id , lecture: { title: @lecture.title ,attachment: @lecture.attachment, content: @lecture.content, course_id: @lecture.course_id, user_id: @lecture.user_id }
    assert_response :success
    sign_out(User.all.first)
  end

  test "should get edit" do
    sign_in(User.all.first)
    get :edit, id: @lecture
    assert_response :success
    sign_out(User.all.first)
  end

  test "should update lecture" do
    sign_in(User.all.first)
    patch :update, id: @lecture, lecture: { title: @lecture.title ,attachment: @lecture.attachment, content: @lecture.content, course_id: @lecture.course_id, user_id: @lecture.user_id }
    assert_redirected_to lecture_path(assigns(:lecture))
    sign_out(User.all.first)
  end

  test "should destroy lecture" do
    sign_in(User.all.first)
    assert_difference('Lecture.count', -1) do
      delete :destroy, id: @lecture
    end
    assert_redirected_to root_path
    sign_out(User.all.first)
  end


  test "should create comment" do
    sign_in(User.all.first)
    assert_difference('Comment.count') do
      post :create_comment, comment: { comment: 'comment test', user_id: User.all.first.id , lecture_id: @lecture.id  }
    end
    sign_out(User.all.first)
  end

  test "should put like and redirect to the lecture page" do
    sign_in(User.first)
    put :upvote, id: @lecture
    assert_redirected_to @lecture
    sign_out(User.first)
  end

  test "should put unlike and redirect to the lecture page" do
    sign_in(User.all.first)
    put :downvote, id: @lecture
    assert_redirected_to @lecture
    sign_out(User.all.first)
  end

  test "should put Spam the lecture and redirect to the lecture page" do
    sign_in(User.all.first)
    put :set_spammed, id: @lecture
    assert_redirected_to @lecture
    sign_out(User.all.first)
  end

  test "should put unSpam the lecture and redirect to the lecture page" do
    sign_in(User.all.first)
    put :set_unspammed, id: @lecture
    assert_redirected_to @lecture
    sign_out(User.all.first)
  end

end
