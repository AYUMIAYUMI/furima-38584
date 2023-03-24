class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with:  VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります'
  validates :nick_name, presence: true, length: { maximum: 40 }
  validates :first_name_kannji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角ひらがな、全角カタカナ、漢字で入力して下さい。' }
  validates :second_name_kannji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は全角ひらがな、全角カタカナ、漢字で入力して下さい。' }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :second_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。' }
  validates :date_birth, presence: true

  has_many :items
  # has_many :buyers
end
