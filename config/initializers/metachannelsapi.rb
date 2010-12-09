class MetaChannelsConfig
  cattr_accessor :config
  cattr_accessor :endpoint
end

mc_config_filename = File.join(Rails.root, "config", "metachannels-api.yml")

raise "#{mc_config_filename} does not exist." unless File.exists?(mc_config_filename)
yaml = File.open(mc_config_filename) {|yf| YAML::load(yf) }
MetaChannelsConfig.endpoint = yaml["endpoint"]
MetaChannelsConfig.config = yaml
