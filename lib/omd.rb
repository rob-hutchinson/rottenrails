class Omd

  include HTTParty
  format :json

  def self.search title
    JSON.parse(HTTParty.get("http://www.omdbapi.com/?t=#{title}&plot=short&r=json"))
  end

end