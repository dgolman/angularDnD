class MenuItem < ActiveRecord::Base
	belongs_to :menu_section
	has_many :menu_item_option_sections
end
