class Item < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to :category
 belongs_to :condition
 belongs_to :delivery_charge
 belongs_to :delivery_time
 belongs_to :prefecture


 belongs_to :user
 has_one_attached :image

 

 validates :item_name, presence: true
 validates :price, presence: true
 validates :content, presence: true
 validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :delivery_time_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
 validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                  format: { with: /\A[0-9]+\z/ }
end


