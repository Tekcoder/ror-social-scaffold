require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = create(:user)
    @user2 = create(:user, email: 'example@me.com', password: 'example', name: 'Example name')
  end
end