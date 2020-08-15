module FoodsHelper
    require "uri"
    require "net/http"
    require 'json'

    def food_index
    url = URI("https://api.nal.usda.gov/fdc/v1/foods/search?dataType=Foundation&sortBy=foodNutrients.value&sortOrder=desc&requireAllWords=true")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["x-api-key"] = ENV["FDC_KEY"]

    response = https.request(request)
    index = response.read_body
    @food_index = JSON.parse(index)
    end

end
