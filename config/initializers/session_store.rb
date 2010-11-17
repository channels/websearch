# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_websearch_session',
  :secret      => 'f8b868b96a5b0f75a5cdfe61134b48b91c4eb89ff6327ce87c9fa6d81ed633c15dc245202df3e1ff7e7d4cd694e0cdac1a94ec943489a3ae07f4a515ae854ce7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
