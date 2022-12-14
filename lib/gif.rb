require 'json'
require 'net/http'

def get_gif(query)
  url = "https://api.giphy.com/v1/gifs/search?q=#{query}&api_key=#{ENV['GIPHY_KEY']}&limit=10&rating=g"
  result = JSON.parse(Net::HTTP.get_response(URI.parse(url)).body)
  images = result['data'].map { |item| item['images'] }
  images.empty? ? ':cry:' : images[rand images.size]['fixed_height']['url']
end
