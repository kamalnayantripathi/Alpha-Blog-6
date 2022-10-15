class Article < ApplicationRecord
	belongs_to :user, dependent: :destroy
	validates :title, presence: true , length: {maximum: 40,minimum: 3}
	validates :description, presence: true, length: {maximum: 100, minimum: 10}

end
