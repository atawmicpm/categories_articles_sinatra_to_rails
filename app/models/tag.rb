class Tag < ActiveRecord::Base
	has_and_belongs_to_many :articles
	
	extend FriendlyId
	friendly_id :name, use: :slugged
end
