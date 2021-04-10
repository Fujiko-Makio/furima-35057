class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]/, message: "Full-width characters" } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" } do
    validates :first_name_kana
    validates :last_name_kana
  end

end
