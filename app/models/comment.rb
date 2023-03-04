class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :community

  validates :comment, presence: true, length: { maximum: 1_255 }
end
