class Post < ApplicationRecord
  enum status: { pending: 0, approved: 1, rejected: 2 }
  belongs_to :user
  has_many :tags
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :category, presence: true
  validates :title, presence: true
  validates :body, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
  
  def favorited_by?(user)
    likes.exists?(user: user)
  end

end
