class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :birthday, presence: true
  validates :nick_name, presence: true
  validates :last_name, presence: true 
  validates :first_name, presence: true
  validates :last_name_fgn,  presence: true 
  validates :first_name_fgn, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ } , allow_blank: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/ }, allow_blank: true
  validates :last_name_fgn, format: { with: /\A[ァ-ヶー－]+\z/ }, allow_blank: true
  validates :first_name_fgn, format: { with: /\A[ァ-ヶー－]+\z/ }, allow_blank: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }, allow_blank: true

  has_many :items
  has_many :orders
end
