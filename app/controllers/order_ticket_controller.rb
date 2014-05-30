class OrderTicketController < ApplicationController
	respond_to :json

	def ticket
		if session[:r_id].nil?
			session[:r_id] = OrderTicket.new
		end
		stored_ticket = session[:r_id]
		
		ticket = {}
		line_items = []
		options = []
			
		stored_ticket.line_items.each do |line_item|
			line_items.push(line_item)
			line_item.line_item_options.each do |option|
				options.push(option)
			end
		end
		ticket[:data] = stored_ticket
		ticket[:count] = stored_ticket.line_items.size
		ticket[:line_items] = line_items
		ticket[:line_item_options] = options
		respond_with ticket
	end

	def add_item
		stored_ticket = session[:r_id]
		line_item = stored_ticket.line_items.build(line_item_params)
		line_item.line_item_options.build(line_item_option_params)
		respond_with line_item do |format|
	        format.json {render json: line_item}
	    end
	end

	private

	def line_item_params
		params.require(:line_item).permit(:unique_id, :menu_section_id, :item_id, :name, :price, :notes)
	end

	def line_item_option_params
		params.permit(:line_item_options => [:parent_id, :id, :description, :price]).require(:line_item_options)
	end

end
