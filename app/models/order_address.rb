class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :building_name, :address, :tel_number, :user_id, :item_detail

  with_options presence: true do
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :tel_number
  end
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }

  def save
  order = Order.create(item_id: item_id, user_id: user_id)
  Address.create(post_code: post_code, prefecture: prefectue, city: city, building_name: building_name, address: address, tel_number: tel_number, order_id: order_id)
  end
end