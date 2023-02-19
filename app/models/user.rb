class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def full_name
           last_name + first_name
         end

         def full_name_kana
           last_name_kana + first_name_kana
         end

  has_many :comments, dependent: :destroy
  has_many :communities
  has_many :goods
  has_many :favorite_events, dependent: :destroy
  accepts_nested_attributes_for :favorite_events, allow_destroy: true
  has_one_attached :profile_image

  enum sex: { women: 0, men: 1, other: 2 }
  enum year: { under19: 0, first20: 1, second20: 2, first30: 3, second30: 4, first40: 5, second40: 6, first50: 7, second50: 8, over60: 9 }

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com', last_name: 'guest', first_name: 'guest', last_name_kana: 'ゲスト', first_name_kana: 'ゲスト') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
end
