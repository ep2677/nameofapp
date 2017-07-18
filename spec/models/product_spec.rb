
require 'rails_helper'

describe Product do 
   context 'when the product has comments' do
    
  
    before do
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:user)
      @comment1 = @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
      @comment2 = @product.comments.create!(rating: 3, user: @user, body: "Ok bike!")
      @comment3 = @product.comments.create!(rating: 5, user: @user, body: "Great bike!")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq(3)
    end
    it "is not valid without a name" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end
    it "has lowest rated comment" do
      expect(@comment1).to eq(@product.lowest_rating_comment)
    end
    it "has a highest rated comment" do
      expect(@comment3).to eq(@product.highest_rating_comment)
    end
    it "has views equal to the times viewed" do
      @product.reload
      expect("#{@product.viewed!}").to eq(@product.views)
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
