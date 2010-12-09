require 'spec_helper'

describe DeviceProfileHelper do
  describe "helper" do
    before(:each) do
      MetaChannelsConfig.config = {
        "general_apikey" => 'generalapikey',
        "device_profiles" => {
          "otherdevice" => {
            "apikey" => 'otherdeviceapikey',
            "user_agent_regex" => 'Other Device 1'
          }
        }
      }
    end

    it "should detect device" do
      user_agent = "Mozilla/5.0 (Other Device 1_0_3 Linux; en-us;) AppleWebKit/530.17 (KHTML, like Gecko)"
      helper.lookup_apikey_by_user_agent(user_agent).should == MetaChannelsConfig.config["device_profiles"]["otherdevice"]["apikey"]
    end

    it "should default to generic device profile when device is unknown" do
      user_agent = "Some Wierd Device 1.0"
      helper.lookup_apikey_by_user_agent(user_agent).should == MetaChannelsConfig.config["general_apikey"]
    end
  end
end
