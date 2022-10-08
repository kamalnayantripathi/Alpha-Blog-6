class Article < ApplicationRecord
	validates :title, presence: true , length: {maximum: 20,minimum: 3}
	validates :description, presence: true, length: {maximum: 100, minimum: 10}

end
