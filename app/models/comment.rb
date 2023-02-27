class Comment < ApplicationRecord
  belongs_to :user

  validates :comment, presence: true, length: { maximum: 1_150 }
end
