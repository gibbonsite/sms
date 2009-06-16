require 'test_helper'

class <%= sessions_class_name %>ControllerTest < ActionController::TestCase
  context "new action" do
    should "render new template" do
      get :new
      assert_template 'new'
    end
  end
  
  context "create action" do
    should "render new template when authentication is invalid" do
      <%= user_class_name %>.stubs(:authenticate).returns(nil)
      post :create
      assert_template 'new'
      assert_nil session['<%= user_singular_name %>_id']
    end
    
    should "redirect when authentication is valid" do
      <%= user_class_name %>.stubs(:authenticate).returns(<%= user_class_name %>.first)
      post :create
      assert_redirected_to root_url
      assert_equal <%= user_class_name %>.first.id, session['<%= user_singular_name %>_id']
    end
  end
end
