class Map < ApplicationRecord
  has_many :posts

  validates :body, presence: true
end
