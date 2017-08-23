require 'rails_helper' 
 
describe Product do
  context "when the product has comments" do
    let(:product) { Product.create!(name: "sweatshirt") }
    # Here the factory is generating or attempting to generate several users with the 
    # email 'kelly@test1.com', to prevent this use ruby rand()
    let(:user) { FactoryGirl.create(:user, email: "kelly-other-#{rand(100)}@test.com", password: 'testing') }
    
    before do 
      product.comments.create!(rating: 1, user: user, body: "Awful sweatshirt!") 
      product.comments.create!(rating: 3, user: user, body: "Ok sweatshirt!") 
      product.comments.create!(rating: 5, user: user, body: "Great sweatshirt!") 
    end
    
    it "returns the average rating of all comments" do
      expect(product.average_rating).to eq(3)
    end
    
    it "is not valid without a name" do
      expect(Product.new(description: "Nice sweatshirt")).not_to be_valid
    end
        
  end
 
end