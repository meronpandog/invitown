class Post < ApplicationRecord
  # belongs_to :customer
  has_many :post_comments, dependent: :destroy
  has_one_attached :image

  # validates :image, presence: true
  validates :title, presence: true
  validates :body, presence: true
  # validates :comment, presence: true


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
