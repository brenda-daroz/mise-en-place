class Review < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :content, length: {maximum: 100}
end
