class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :city, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, format: {with: /\d{10,11}/}, length: {maximum: 11}
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :token, presence: true
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 

  def save 
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end