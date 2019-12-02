class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :dislikes, dependent: :destroy
	has_many :users_disliked, through: :dislikes, source: :user
	validates :title, presence: true,
						length: {minimum: 3}
	#has_one_attached :photo
end
