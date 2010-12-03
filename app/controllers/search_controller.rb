require 'metachannels-api-client'

class SearchController < ApplicationController
  def index
    # if no search terms provided, don't bother searching
    if params[:searchTerms].blank?
      @results = []
    else
      @page = params[:startPage] || 1
      per_page = params[:perPage] || 20
      @api = MetachannelsApi.new(METACHANNELS_APIKEY, METACHANNELS_ENDPOINT)
      @results = @api.search("searchTerms" => params[:searchTerms], "order" => "keyword", "perPage" => per_page, "startPage" => @page)
    end
  end

end

