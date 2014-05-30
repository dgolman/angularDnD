class MenuEditorController < ApplicationController
	respond_to :json

	def create_menu
		menu = current_user.restaurants.find(params[:r_id]).menus.build(menu_params)
		if menu.save
			respond_with menu do |format|
				format.json {render json: menu}
			end
		end
	end

	def delete_menu
		respond_with Menu.find(params[:menu_id]).destroy
	end
	######################
	######################

	###SECTIONS API#######
	######################
	def create_section   
		section = Menu.find(params[:menu_id]).menu_sections.build(section_params)
		if section.save
			respond_with section do |format|
				format.json {render json: section}
			end
		end
	end

	def delete_section
		respond_with Menu.find(params[:menu_id]).menu_sections.destroy(params[:section_id])
	end

	######################
	######################

	###ITEMS API##########
	def create_item   
		item = Menu.find(params[:menu_id]).menu_sections
				   .find(params[:section_id]).menu_items
				   .build(item_params)

		if item.save
			respond_with item do |format|
				format.json {render json: item}
			end
		end
	end

	def delete_item
	    respond_with Menu.find(params[:menu_id]).menu_sections
	    				 .find(params[:section_id]).menu_items
	    				 .destroy(params[:item_id])
	  end

	######################
	######################

	####OPTION_SECTIONS API######
	def create_option_section   
	    option_section = Menu.find(params[:menu_id]).menu_sections
	    					 .find(params[:section_id]).menu_items
	    					 .find(params[:item_id]).menu_item_option_sections
	    					 .build(option_section_params)
	    if option_section.save
	      respond_with option_section do |format|
	        format.json {render json: option_section}
	      end
	    end
	end

	def delete_option_section
	    respond_with Menu.find(params[:menu_id])
	                     .menu_sections.find(params[:section_id])
	                     .menu_items.find(params[:item_id])
	                     .menu_item_option_sections
	                     .destroy(params[:option_section_id])
	end
	#############################
	#############################

	#####OPTIONS API#############
	
	def create_option  
	    option = Menu.find(params[:menu_id]).menu_sections
	    					 .find(params[:section_id]).menu_items
	    					 .find(params[:item_id]).menu_item_option_sections
	    					 .find(params[:option_section_id]).menu_item_options
	    					 .build(option_params)
	    if option.save
	      respond_with option do |format|
	        format.json {render json: option}
	      end
	    end
	end

	def delete_option
	    respond_with Menu.find(params[:menu_id])
	                     .menu_sections.find(params[:section_id])
	                     .menu_items.find(params[:item_id])
	                     .menu_item_option_sections.find(params[:option_section_id])
	                     .menu_item_options
	                     .destroy(params[:option_id])
	end
	#############################
	#############################

	private

	def menu_params
	  params.require(:menu).permit(:name)
	end

	def section_params
	  params.require(:menu_section).permit(:title)
	end

	def item_params
      params.require(:menu_item).permit(:title, :price, :description)
    end

    def option_section_params
      params.require(:menu_option_section).permit(:description, :radiobuttons)
    end

    def option_params
      params.require(:menu_option).permit(:price, :description)
    end

end
