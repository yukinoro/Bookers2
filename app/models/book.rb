class Book < ApplicationRecord


	belongs_to :user
	 validates :title, presence: true
	 validates :title, length: { minimum: 1 }
     validates :body, length: { in: 1..200 }
end
