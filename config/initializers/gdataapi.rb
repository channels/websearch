gdata_config_filename = File.join(Rails.root, "config", "gdata.yml")

raise "#{gdata_config_filename} does not exist." unless File.exists?(gdata_config_filename)

yaml = File.open(gdata_config_filename) {|yf| YAML::load(yf) }
GDATA_APIKEY   = yaml["apikey"]
