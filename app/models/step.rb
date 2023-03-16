class Step < ApplicationRecord
  belongs_to :recipe

  validates :number, :step, presence: true
end
