class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :goods, dependent: :destroy

  def gooded_by?(user)
    goods.where(user_id: user.id).exists?
  end

  validates :comment, presence: true, length: { minimum: 1, maximum: 255 }
end
