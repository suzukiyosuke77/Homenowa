class Report < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  enum status: { pending: 0, reviewed: 1, resolved: 2 }
  validates :reason, presence: true

  #同じユーザーが複数回通報するのを防ぐ
  validates :post_id, uniqueness: { scope: :user_id, message: "は既に通報済みです！" }
  

  before_create :set_default_status

  private

  def set_default_status
    self.status ||= 'pending'
  end
end
