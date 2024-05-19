class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'must contain at least one english letter and a number'

  with_options presence: true, format: {
    with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'must be full-width character' } do
    validates :family_name
    validates :first_name
  end

  with_options presence: true, format: {
    with: /\A[ァ-ヶー]+\z/, message: 'must be full-width katakana' } do
    validates :family_name_kana
    validates :first_name_kana
  end
end
