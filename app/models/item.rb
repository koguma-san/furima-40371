class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :connection
  belongs_to :delivery_charge
  belongs_to :delivery_day
  belongs_to :prefecture

  has_one_attached :image
  belongs_to :user

  validates :item_name, presence: true
  validates :item_details, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :price, presence: true
end
