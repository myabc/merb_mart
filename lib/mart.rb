module Mart
  
  # Should we use live rate calculation via FedEx?
   mattr_accessor :use_live_rate_calculation
   self.use_live_rate_calculation = false

   # Override SSL production mode?
   # If set to true the cart and checkout are accessed via HTTP not HTTPS
   # regardless of the mode that the server is run in.
   # 
   # This is useful for me on the demo site where I don't want
   # to set up a SSL cert.
   mattr_accessor :override_ssl_production_mode
   self.override_ssl_production_mode = false

 	# For alternating row colors...
 	def alternate(str1 = "odd", str2 = "even")
 		 @alternate_odd_even_state = true if @alternate_odd_even_state.nil?
 		 @alternate_odd_even_state = !@alternate_odd_even_state
 		 @alternate_odd_even_state ? str2 : str1
 	end

 	# For linking to sections (using subdirs)
   def link_to_section(label, options = {})
 		$ctrlop = options[:controller]
     if request.request_uri == options[:controller]
       link_to(label, options, { :class => "active"})
     else
       link_to(label, options)
     end
   end
   
 	# Gets a link to checkout
 	# If we're in production mode we go to the HTTPS server
 	#
 	def get_link_to_checkout
 		# For things like the demo site I need to disable SSL
 		if (Substruct.override_ssl_production_mode == true) then
 			return "/store/checkout"
 		elsif ENV['RAILS_ENV'] == "production" then
       return "https://#{request.host}/store/checkout"
     else
       return "/store/checkout"
     end
 	end

   # Generates a navigation string from an array list
   def generate_navigation(options, currently_viewing=nil, action='list')
     list = "<ul class=\"navigation secondary\">\n"

     options.each do |item|
       if currently_viewing == item then
         list << "<li class=\"active\">#{item}</li>"
       else
         list << "<li>"
         list << link_to(item, :action => action, :key => item)
         list << "</li>"
       end
     end

     return list << "</ul>"
   end

   # Truncates to the nearest word
   def truncate_words(text, length = 30, end_string = '')
     words = text.split()
     words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
   end

  
end