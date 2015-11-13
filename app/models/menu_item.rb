class MenuItem < ActiveRecord::Base
  belongs_to :menu_section
  belongs_to :unit
  has_many :order_items
  validates :name, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than: 0} 
  validates :unit_id, presence: true
end
