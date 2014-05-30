class MenuItemOptionSection < ActiveRecord::Base
	belongs_to :menu_item
	has_many :menu_item_options
end
