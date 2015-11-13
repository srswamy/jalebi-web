class OrderCustomer < ActiveRecord::Base
  belongs_to :order

  validates :first_name, presence: true, length: { in: 2..25 }
  validates :last_name, presence: true, length: { in: 2..25 }
  
  validates :phone_number, presence: true, :numericality: true, :length => { :minimum => 10, :maximum => 15 }

  validates :address_line_1, presence: true
  validates :city, presence: true
  validates :state, presence: true

  validates :order_present

  private
	def order_present
		if order.nil?
			errors.add(:order, "is not valid or is not active.")
		end
	end
end
