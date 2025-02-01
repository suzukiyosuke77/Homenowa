class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  acts_as_paranoid 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, uniqueness: true, length: {in: 2..20}
  has_many :likes, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  has_one_attached :profile_image
  
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
  
  def get_profile_image(width, height)
    if profile_image.attached?
      profile_image.variant(resize_to_fill: [width, height]).processed
    else
      "default_profile_image.png"
    end
  end
  
end
