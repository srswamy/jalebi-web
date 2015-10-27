class Store < ActiveRecord::Base
	has_many :menu_sections, dependent: :destroy
	validates :name, presence: true,
			 length: { minimum: 5 }
end
