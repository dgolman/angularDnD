class MenuSection < ActiveRecord::Base
	belongs_to :menu
	has_many :menu_items
end
