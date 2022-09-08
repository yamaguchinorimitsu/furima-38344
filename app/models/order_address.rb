class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building, :tell_number, :order, :user_id

  with_options presence: true do
    

    validates :city
    validates :house_number
    validates :user_id
    validates :order, foreign_key: true
    validates :tell_number, format:{with: /\A0[0-9]{9,10}\z/}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id)
    Address.create(tell_number: tell_number, postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building: building )
  end


end