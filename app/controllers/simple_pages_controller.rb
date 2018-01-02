class SimplePagesController < ApplicationController
  
	def landing_page
  	@products = Product.all
  	@featured_product = Product.all
	end

  def about
  end

  def contact
  end

 
end




