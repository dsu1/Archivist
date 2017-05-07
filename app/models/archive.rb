class Archive < ActiveRecord::Base
	belongs_to :user
	has_many :contents, dependent: :destroy

	validates :name, presence: true, uniqueness: {message: "Article name is taken."}

end
