require 'rails_helper'

describe Product do
  context "if the product has comments" do
    let(:product) { Product.create!(name: "test book", description: "Lovely book", price: 200, image_url: "hello.jpg", color: "red") }

    before(:each) do
      @user = FactoryBot.create(:user)
    end

    before do
      product.comments.create!(rating: 1, user: @user, body: "Terrible book")
      product.comments.create!(rating: 3, user: @user, body: "Avergae book")
      product.comments.create!(rating: 5, user: @user, body: "Great book")
    end

    it "returns average rating of all comments" do
      expect(Comment.average(:rating)).to eq 3
    end
  end

# Test validations on product model
  context "is not valid without input in all requested fields (name, description, price, color, imagage_url)" do
    let(:product) {Product.new(description: "What a lovely book")}

    it "returns a validation error" do
      expect(Product.new(description: "What a lovely book")).not_to be_valid
    end
  end

  context "is not valid without input in all requested fields (name, description, price, color, imagage_url)" do
    let(:product) {Product.new(price: "200")}

    it "returns a validation error" do
      expect(Product.new(price: "200")).not_to be_valid
    end
  end

  context "is not valid without input in all requested fields (name, description, price, color, imagage_url)" do
    let(:product) {Product.new(color: "red")}

    it "returns a validation error" do
      expect(Product.new(color: "red")).not_to be_valid
    end
  end

  context "is not valid without input in all requested fields (name, description, price, color, imagage_url)" do
    let(:product) {Product.new(image_url: "hello.jpg")}

    it "returns a validation error" do
      expect(Product.new(image_url: "hello.jpg")).not_to be_valid
    end
  end

  context "is only valid with input in all requested fields (name, description, price, color, imagage_url)" do
    let(:product) {Product.new(name: "test book", description: "lovely book", price: 200, image_url: "hello.jpg", color: "red")}

    it "returns no validation error" do
      expect(Product.new(name: "test book", description: "lovely book", price: 200, image_url: "hello.jpg", color: "red")).to be_valid
    end
  end

end



