require 'rails_helper' 
 
describe UsersController, type: :controller do 
  let(:user) { User.create( :email => "kelly@test1.com", :password => "testing")}
  let(:user_two) { User.create( :email => "kelly@test2.com", :password => "testing")}

  describe 'GET #show' do 
    context 'when a user is logged in' do 
      before do 
        sign_in user
      end
      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user
      end
      
    context 'when a user is not logged in' do 
      it 'redirects to login' do 
        get :show, params: { id: user.id } 
        expect(response).to redirect_to(new_user_session_path) 
      end 
    end
      
    context 'one user cannot view another' do 
      it 'redirects to root path' do 
        get :show, params: { id: user_two.id } 
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path) 
      end 
    end 
  
  end
end