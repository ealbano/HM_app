class Experience < ActiveRecord::Base
	validates :title, presence: true

	has_many :notes
	belongs_to :user
end
