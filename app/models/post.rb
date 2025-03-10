class Post < ApplicationRecord
  acts_as_paranoid
  
  enum status: { pending: 0, approved: 1, rejected: 2 }
  belongs_to :user
  has_many :tags
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reports

  validate :validate_categories_presence
  validates :title, presence: true
  validates :body, presence: true
  
  acts_as_taggable_on :categories
  #(参照)https://qiita.com/guri3/items/c667ce2bfbb5baca4b5a
  
  scope :most_liked_in_last_week, -> {
    left_joins(:likes).where('likes.created_at >= ? OR likes.id IS NULL', 1.week.ago)
    .group(:id).select('posts.*, COUNT(likes.id) AS likes_count').order('likes_count DESC')
  }

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
  
  def validate_categories_presence
    if category_list.empty?
      errors.add(:category_list, "を入力してください")
    end
  end

  #def flagged?
    #reports.count >= 5
  #end
  
end
