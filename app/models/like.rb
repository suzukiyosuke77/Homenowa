class Like < ApplicationRecord
  belongs_to :user
  has_many :posts
end
