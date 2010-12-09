require 'spec_helper'

describe SearchController do
  integrate_views

  it "should handle api errors" do
    api_mock = mock('api_mock')
    MetachannelsApi.should_receive(:new).and_return(api_mock)
    api_mock.should_receive(:search).and_return({"error" => "Unauthorized"})

    get :index, :searchTerms => 'news'
    # make sure the response doesn't 500
    response.should be_success
  end
end
