class Restaurant < ActiveRecord::Base
	belongs_to :user
	has_many :menus
	
	geocoded_by :full_address # full_address is a method which take some model's attributes to get a formatted address for example
	after_validation :geocode
    # the full_address method
    def full_address
      "#{street}, #{zipcode}, #{city}"
    end
end
