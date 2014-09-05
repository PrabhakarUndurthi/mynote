require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  setup do
    @note = notes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notes)
  end

  test "should be redirected when not logged in" do
    get :new
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end


  test "should render the new page when logged in" do 
    sign_in users(:prabhakar)
    get :new 
    assert_response :success
  end


  test "should  be logged in to post a note" do 
    post :create, note: {subject: "Rails 4 Notes", content: "Strong parameters introduced"}
    assert_response :redirect
    assert_redirected_to new_user_session_path
  end

  test "should create note when logged in" do
    sign_in users(:prabhakar)
    assert_difference('Note.count') do
      post :create, note: { content: @note.content, subject: @note.subject }
    end

    assert_redirected_to note_path(assigns(:note))
  end

  test "should show note" do
    get :show, id: @note
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @note
    assert_response :success
  end



  test "should get edit when logged in" do 
    sign_in(:prabhakar)
    get :edit, id: @note 
    assert_response :success
  end



  test "should redirect note when not logged in " do
    patch :update, id: @note, note: { content: @note.content, subject: @note.subject }
    assert_redirected_to note_path(assigns(:note))
  end

  test "should update note when logged in " do
     sign_in(:prabhakar)
     put :update, id: @note, note: {content: @note.content, subject: @note.subject} 
     assert_redirected_to note_path(assigns(:note))
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete :destroy, id: @note
    end

    assert_redirected_to notes_path
  end
end
