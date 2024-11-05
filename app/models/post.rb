class Post < ApplicationRecord
  belongs_to :like, optional: true
  belongs_to :user
  has_many :tags
  has_many :comments
  
  # 承認済み・未承認の投稿を簡単に呼び出せるようにスコープを追加
  scope :admin_check, -> { where(admin_check: true) }
  scope :un_admin_check, -> { where(admin_check: false) }
  
  validates :category, presence: true
  validates :title, presence: true
  validates :body, presence: true
  
# 管理者かどうか
  def admin?
    role == 1
  end

  # ゲスト会員かどうか
  def guest?
    role == 2
  end

  # 一般会員かどうか
  def general_member?
    role == 3
  end  
  
end
