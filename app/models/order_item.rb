class OrderItem < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greather_than: 0 }
  validates :menu_item_present
  validates :order_present

  private
	def menu_item_present
		if menu_item.nil?
			errors.add(:menu_item, "is not valid or is not active.")
		end
	end

	def order_present
		if order.nil?
			errors.add(:order, "is not valid or is not active.")
		end
	end
end
