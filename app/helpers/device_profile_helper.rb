module DeviceProfileHelper
  def lookup_apikey_by_user_agent(user_agent)
    api_key = nil

    device_profiles = MetaChannelsConfig.config["device_profiles"]
    device_profiles.keys.sort.each do |device|
      if device_profiles[device].has_key?("user_agent_regex")
        user_agent_regex = device_profiles[device]["user_agent_regex"]
        if Regexp.new(user_agent_regex).match(user_agent)
          api_key = device_profiles[device]["apikey"]
          break;
        end
      end
    end

    api_key = MetaChannelsConfig.config["general_apikey"] if api_key.nil?
    
    api_key
  end
end
