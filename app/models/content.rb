class Content < ActiveRecord::Base
	belongs_to :archive
	
	validates :title, presence: true

end
