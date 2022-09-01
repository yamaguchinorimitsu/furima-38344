class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :birthday, presence: true
  validates :nick_name, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_fgn, presence: true
  validates :first_name_fgn, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_fgn, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_fgn, format: { with: /\A[ァ-ヶー－]+\z/ }

  has_many :items
  has_many :orders
end
