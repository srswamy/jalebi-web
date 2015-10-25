class MenuItem < ActiveRecord::Base
  belongs_to :menu_section
  belongs_to :unit
end
