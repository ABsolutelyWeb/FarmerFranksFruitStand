# to get json from url
require 'open-uri'

class FruitController < ApplicationController
  def import
    url = "http://di-interview-project.elasticbeanstalk.com/assignments/fruit/data"
    
    # getting json from above url (simple get request)
    json_string = open(url).read
    
    # parsing json string into json hash
    @data = JSON.parse(json_string)
    
    # sort data: address is json inside json
    @data = @data.sort_by{|record| JSON.parse(record["location_1"]["human_address"])["city"]}
  end
  
  def homepage
  end
end
