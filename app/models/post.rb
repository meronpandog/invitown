class Post < ApplicationRecord
  # belongs_to :customer
  has_many :post_comments, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :maps
  has_many :favorites, dependent: :destroy

  has_one_attached :image

  # validates :image, presence: true
  validates :title, presence: true
  validates :body, presence: true
  # validates :comment, presence: true
  validates :category, presence: true

 def favorited_by?(customer)
   favorites.exists?(customer_id: customer.id)
 end

  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?", "#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
end
