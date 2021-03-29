require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "generates a token before validation" do
    user = User.new.tap(&:valid?)
    assert_not_empty user.token
  end
end
