class MenuController < ApplicationController
	respond_to :json

	def index
		respond_with Restaurant.find(params[:r_id]).menus
	end

	def menu
		respond_with Menu.find(params[:menu_id])
	end

	def sections
		respond_with Menu.find(params[:menu_id]).menu_sections
	end

	def section
		respond_with Menu.find(params[:menu_id]).menu_sections
		  				 .find(params[:section_id])
	end

	def items
		respond_with Menu.find(params[:menu_id]).menu_sections
						 .find(params[:section_id]).menu_items
	end

	def item
		respond_with Menu.find(params[:menu_id]).menu_sections
						 .find(params[:section_id]).menu_items
						 .find(params[:item_id])
	end

	def option_sections
		respond_with Menu.find(params[:menu_id]).menu_sections
						 .find(params[:section_id]).menu_items
						 .find(params[:item_id]).menu_item_option_sections
	end

	def option_section
		respond_with Menu.find(params[:menu_id]).menu_sections
						 .find(params[:section_id]).menu_items
						 .find(params[:item_id]).menu_item_option_sections
						 .find(params[:option_section_id])
	end

	def options
		respond_with Menu.find(params[:menu_id]).menu_sections
						 .find(params[:section_id]).menu_items
						 .find(params[:item_id]).menu_item_option_sections
						 .find(params[:option_section_id]).menu_item_options
	end

end
