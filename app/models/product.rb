class Product < ApplicationRecord
	validates :name, presence: true 
	
	def self.search(search_term)
		if Rails.env.production?
			Product.where("name ilike ?", "%#{search_term}%")
		elsif Rails.env.development?
			Product.where("name LIKE ?", "%#{search_term}%")
		end
	end
	
	has_many :comments
	
	def highest_rating_comment 
	  comments.rating_desc.first 
	end
	
	def average_rating 
	  comments.average(:rating).to_f 
	end
	
	def views
    $redis.get("product:#{id}") # Equivalent to 'GET product:1'
  end

  def viewed!
    $redis.incr("product:#{id}") # Equivalent to 'INC product:1'
  end
	
end