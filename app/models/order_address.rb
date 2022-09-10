class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building, :tell_number, :item_id, :user_id, :token

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  with_options presence: true do
    validates :token
    validates :city
    validates :house_number
    validates :user_id
    validates :item_id
    validates :tell_number, format: { with: /\A0[0-9]{9,10}\z/ }
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(tell_number: tell_number, post_code: post_code, prefecture_id: prefecture_id, city: city,
                   house_number: house_number, building: building, order_id: order.id)
  end
end
