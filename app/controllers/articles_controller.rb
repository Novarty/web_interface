require 'net/http'
class ArticlesController < ApplicationController
  def index
    if params[:search].present?
      fetch_articles_from_api
    end
  end

  private

  def fetch_articles_from_api
    url = "https://fast-stream-52562.herokuapp.com/api/search"
    uri = URI(url)

    url_params = { "search" => params[:search]}
    uri.query = URI.encode_www_form(url_params)

    @response = Net::HTTP.get(uri)
    @response = JSON.parse(@response)
  end
end
