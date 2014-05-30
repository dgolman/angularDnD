class LineItem < ActiveRecord::Base
	belongs_to :order_ticket
	has_many :line_item_options
end
