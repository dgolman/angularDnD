class Menu < ActiveRecord::Base
	belongs_to :restaurant
	has_many :menu_sections
	has_many :order_tickets
end
