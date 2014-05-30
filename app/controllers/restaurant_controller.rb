class RestaurantController < ApplicationController
	respond_to :json

	def restaurant
		respond_with Restaurant.find(params[:r_id])
	end

	def menu
		menu_sections = [];
		menu_items = [];
		menu_item_option_sections = [];
		menu_item_options = [];

		@menu = Menu.find(params[:m_id])
		@menu.menu_sections.each do |section| 
			menu_sections.push(section)
			section.menu_items.each do |item|
				menu_items.push(item)
				item.menu_item_option_sections.each do |op_section|
					menu_item_option_sections.push(op_section)
					op_section.menu_item_options.each do |option|
						menu_item_options.push(option)
					end
				end
			end
		end
		ret = {};
		ret[:menu] = @menu.as_json
		ret[:menu_sections] = menu_sections.as_json
		ret[:menu_items] = menu_items.as_json
		ret[:menu_item_option_sections] = menu_item_option_sections.as_json
		ret[:menu_item_options] = menu_item_options.as_json
		respond_with ret
	end

end
