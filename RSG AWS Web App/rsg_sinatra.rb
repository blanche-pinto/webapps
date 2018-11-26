require 'sinatra'
require 'sinatra/reloader' if development?
require './rsg.rb'

get '/' do
  	# These two lines of code select all the file names in the grammars folder without the ".g" at the end.
	@grammars = Dir.glob("grammars/*.g").map do |elem|
	 (File.basename elem)[0..-3]
	end

	if params["file"] then
    # When the user selects the file, this code takes the file name and generates the sentence
    # and displays it using the erb file.
		if @grammars.include? params['file'] then
			@file = params['file']
			@generated_sentence = rsg(@file)
			erb :main
    	else
      		# In case the user goes to a wrong URL with the grammmar file not available, we would display an error!
			"<h1> Wrong Grammar Selected </h1><br>Please check the file name and try again!"
		end
  	else
    	# If the user enters the wrong URL entirely, nothing gets displayed.
		@file = ""
		@generated_sentence = ""
		erb :main
	end
end

