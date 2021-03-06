require "test_helper"

describe UsersController do
  it "should get index" do
    get users_path
    must_respond_with :success
  end

  it "should get show" do
    get user_path(users(:userone))
    must_respond_with :success
  end

  it "should show a 404 when user is not found" do
    get user_path(0)
    must_respond_with :missing
  end

  it "should affect the model when creating a user" do
    proc {
      post users_path, params: { user:
        { name: "myname"
        }
      }
    }.must_change 'User.count', 1
  end
end
