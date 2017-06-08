
require 'rails_helper'

describe Product do 
   context 'when the product has comments' do
    
  
    before do
      @product = Product.create!(name:"race bike")
      @user = User.create!(first_name: "Mark", last_name:"Price", email: "MPrice3@yahoo.com", password: "234jhjh34")
      @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
      @product.comments.create!(rating: 3, user: @user, body: "Ok bike!")
      @product.comments.create!(rating: 5, user: @user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq(3)
    end
    it "is not valid without a name" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end
  end
end


# The Let Way:

=begin

require 'rails_helper'

describe Product do 

  context 'when the product has comments' do
      let (:product) {Product.create!(name:"race bike")}
      let (:user) {User.create!(first_name: "Mark", last_name:"Price", email: "MPrice3@yahoo.com", password: "23478734")}
      
  

    it "returns the average rating of all comments" do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
      expect(product.average_rating).to eq(3)
    end
    it "is not valid without a name" do
      expect(Product.new(description:"Nice Bike")).not_to be_valid
    end
  end
end
=end
