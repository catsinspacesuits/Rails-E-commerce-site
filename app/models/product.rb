class Product < ApplicationRecord
	validates :name, presence: true
	has_many :orders
	has_many :comments, dependent: :destroy

	def highest_rating_comment
	  comments.rating_desc.first&.rating
	end

	def lowest_rating_comment
		comments.rating_asc.first&.rating
	end

	def average_rating
	  comments.average(:rating).to_f
	end

	def self.search(search_term)
  	Product.where("name LIKE ?", "%#{search_term}%")
	end

	# models/product_view.rb
	  
  def views
    $redis.get("product:#{id}")
  end
  
  def viewed!
    $redis.incr("product:#{id}")
  end

end
