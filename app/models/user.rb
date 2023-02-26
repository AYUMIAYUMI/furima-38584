class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  validates :first_name_kannji, presence: true
  validates :second_name_kannji, presence: true
  validates :first_name_kana, presence: true
  validates :second_name_kana, presence: true
  validates :date_birth, presence: true

  has_many :items
  has_many :buyers

end
