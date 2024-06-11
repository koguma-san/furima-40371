class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :building_name, :address, :tel_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "must be in the format of 3 digits hyphen 4 digits"}
    validates :city
    validates :address
    validates :tel_number
    validates :item_id, format: { with: /\A\d{10,11}\z/, message: "must be 10 to 11 digits" }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, building_name: building_name, address: address, tel_number: tel_number, order_id: order.id)
  end
end