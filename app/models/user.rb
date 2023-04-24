class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/,message: "is invalid. Input full-width characters" } do
    validates :family_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/, message: "is invalid. Input full-width katakana characters"} do
    validates :family_name_kana
    validates :first_name_kana
  end
  validates :birth_day, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "is invalid. Include both letters and numbers"}
end