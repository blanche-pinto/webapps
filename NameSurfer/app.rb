require 'sinatra'
require 'json'  # need to first do a gem install json
require 'sinatra/reloader' if development?


# This path simply serves the static namesurfer.html file
# You should NOT need to change this.
get '/' do
  # this is just a hack to serve the static namesurfer.html file (in the public directory)
  send_file File.join(settings.public_folder, 'namesurfer.html')
end


# This path is what is called by namesurfer.html to get the data for a name
# Must return either a JSON object minimally with the integer popularities
# of the name over the past century (1900 - 2000),
# OR if the name is not found in the dataset, will do a halt(404)
#
# You are allowed to add other items to the JSON you return.  Since you are
# also writing the JavaScript to receive the data how you format it is up to you.
#
# In my solution, I return a JSON object with a keys, :name, and :pops
# for example, accessing /Phil or /phil will return the following.
# NOTE: 0's have been converted to 1001!
# {:name => 'Phil', :pops => [566, 527, 536, 382, 304, 395, 429, 893, 1001, 1001, 1001]}
get '/:name' do
  # TODO: replace string below with the code to get this working
 # "<strong>You need to implement the /:name route</strong>"

  years = []
  found = 0
  print params[:name]
  if params[:name]
    #Return JSON
    content_type :json
    # @value = nil

    #Reading in the text file at once into results.
    # results = File.open("data/names-data.txt", 'r')

    File.open("data/names-data.txt", 'r') do |row|
      row.each_line do |eachLine|
        # print eachLine
        if params[:name].eql? eachLine.split()[0]
          found = 1
          eachLine.split().each do |year|
            # puts "Year is:" + year
            if year == "0"
              years.push("1001")
            else
              years.push(year)
            end
          end
        end
      end
    end
  end

  if found==1
    # print [years].to_json
    return [years].to_json
  else
    halt(404)
    return [["Name not found"]]
  end
end

      # if row.has_value?(params[:name])
      #   @value = row.values
      #   #Before returning there are some values that need to be converted
      #   @value.map!{|x| x == 0 ? 1001 : x}.flatten!
      #
      # else if @value == nil
      #        @value = ["Name not found", -1]
      #        #Returning Error message if not found
      #        # {:result => @value}.to_json
      #        {:name => params[:name], :result => @value}.to_json
      #
      #      end
      # end
  #   end
  #   #Returning Array of Specific data back to html
  #   # {:result => @value}.to_json
  #   {:name => params[:name], :result => @value}.to_json
  #
  #   # puts @value
  # else
  #   halt(404)
  # end
