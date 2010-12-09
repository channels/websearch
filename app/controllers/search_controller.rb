require 'metachannels-api-client'

class SearchController < ApplicationController
  include DeviceProfileHelper

  def index
    # if no search terms provided, don't bother searching
    if params[:searchTerms].blank?
      @results = []
    else
      @page = params[:startPage] || 1
      per_page = params[:perPage] || 20
      @api_key = lookup_apikey_by_user_agent(request.user_agent)

      @api = MetachannelsApi.new(@api_key, MetaChannelsConfig.endpoint)
      @results = @api.search("searchTerms" => params[:searchTerms], "order" => "keyword", "perPage" => per_page, "startPage" => @page)
    end
  end

end

