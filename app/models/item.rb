class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_time
  belongs_to :prefecture
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :image, presence:{ message: 'を選択してください' }
  validates :item_name, presence: true
  validates :price, presence: true
  validates :content, presence: true
  validates :category_id, numericality: { other_than: 1, message: "が空なので登録できません" }
  validates :condition_id, numericality: { other_than: 1, message: "が空なので登録できません" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "が空なので登録できません"}
  validates :delivery_time_id, numericality: { other_than: 1, message: "が空なので登録できません" }
  validates :prefecture_id, numericality: { other_than: 1, message: "が空なので登録できません" }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ } , allow_blank: true
end
