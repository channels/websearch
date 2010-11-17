require 'metachannels-api-client'

class SearchController < ApplicationController
  def index
    # if no search terms provided, don't bother searching
    if params[:searchTerms].blank?
      @results = []
    else
      @api = MetachannelsApi.new(METACHANNELS_APIKEY, METACHANNELS_ENDPOINT)
      @results = @api.search("searchTerms" => params[:searchTerms])
    end
  end

end

