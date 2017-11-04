class Article < ActiveRecord::Base

	validate :title, presence: true, length: {min: 3, max: 50}
	validate :description, presence: true, length: {min: 10, max: 300}
	
end