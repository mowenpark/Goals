require 'rails_helper'
# require 'shoulda-matchers'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "validate presence of username" do
    should validate_presence_of(:username)
  end
  subject {User.new(password: 123456, session_token: 'abcd') }
  it "validate uniqueness of username" do
    should validate_uniqueness_of(:username)
  end
  it "validate presence of password_digest" do
    should validate_presence_of(:password_digest)
  end
  it "validate presence of session_token" do
   should validate_presence_of(:session_token)
 end
 it "validate length of password" do
  should validate_length_of(:password).is_at_least(6)
end

end
