require 'rails_helper'

describe Comment do

  context "no comment" do
    it "is not valid without a comment" do
      expect(Comment.new(body: "")).not_to be_valid
    end
  end

  context "validations missing rating" do
    it "is not valid without a rating" do
      expect(Comment.new(body: nil)).not_to be_valid
      
    end
  end
end