class Post < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :dislikes
	has_many :users_disliked, through: :dislikes, source: :user
	validates :title, presence: true,
						length: {minimum: 3}
end
