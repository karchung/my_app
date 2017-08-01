require 'rails_helper' 
 
describe StaticPagesController, type: :controller do 
  context 'GET #index' do 
    it 'renders the index template' do 
      get :index 
      expect(response).to be_ok 
      expect(response).to render_template('index') 
    end 
  end 
end

describe MyController do
  login_admin

  it "should have a current_user" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_user).to_not eq(nil)
  end

  it "should get index" do
    # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
    # the valid_session overrides the devise login. Remove the valid_session from your specs
    get 'index'
    response.should be_success
  end
end