require 'rails_helper'

RSpec.describe Review, type: :model do

    let(:user) { User.create email: 'tansaku@gmail.com', password: '12345678', password_confirmation: '12345678' }
    let(:user2) { User.create email: 'tansakuuu@gmail.com', password: '12345678', password_confirmation: '12345678' }
    let(:restaurant) {Restaurant.create(name: "Tayyabs", description: "Great Indian Restaurant",
  		user_id: user.id)}
  	subject(:review) {described_class.create(rating: "3", comment: "DONT ORDER HERE. Eat cereal you already have. See that canned soup in the pantry? Cook it. F$!@ this place! Never again!",
                      user_id: user2.id, restaurant_id: restaurant.id)}

  	it "should set the rating" do
  		expect(review.rating).to eq(3)
  	end

  	it "should set the comment" do
  		expect(review.comment).to eq("DONT ORDER HERE. Eat cereal you already have. See that canned soup in the pantry? Cook it. F$!@ this place! Never again!")
  	end

    it "needs a rating" do
      review2 = Review.new(rating: "")
      expect {review2.save}.to_not change{Review.count}
    end

    it "should have a rating greater than or equal to 1" do
      review2 = Review.new(rating: "0")
      expect {review2.save}.to_not change{Review.count}
    end

    it "should have a user" do
      expect(review.user).to eq user2
    end

    it "should have a restaurant" do
      expect(review.restaurant).to eq restaurant
    end

    it "should have a rating less than or equal to 5" do
      review2 = Review.new(rating: "6")
      expect {review2.save}.to_not change{Review.count}
    end

  end
