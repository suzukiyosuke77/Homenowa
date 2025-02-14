class Report < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :reason, presence: true
  enum status: { pending: 0, reviewed: 1, resolved: 2 }


  before_create :set_default_status

  private

  def set_default_status
    self.status ||= 'pending'
  end
end
