require 'rails_helper'

describe Product do

  context "when the product has comments" do
    
    let(:product) { Product.create!(name: "random book", description: "awesome book") }
    let(:user) { User.create!(email: "example@random.com",first_name: "Joe", last_name: "Random", password: "password") }
    before do
      product.comments.create!(rating: 1, user: user, body: "Awful book!")
      product.comments.create!(rating: 3, user: user, body: "Ok book!")
      product.comments.create!(rating: 5, user: user, body: "Great book!")
    end

	it "returns the average rating of all comments" do
	  expect(product.average_rating).to eq 3
	end

	context "is not valid without a name" do
		
		let(:product) { Product.new(description: "") }

		it "should have no description" do
			expect(Product.new(description: "Nice book")).not_to be_valid
		end
	end
end



