class OrderTicket < ActiveRecord::Base
	belongs_to :menu
	has_many :line_items
end
