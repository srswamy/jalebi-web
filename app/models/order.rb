class Order < ActiveRecord::Base
  belongs_to :order_status
  has_many :order_items
  has_one :order_customer
end
