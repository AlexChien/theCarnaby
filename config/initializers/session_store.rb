# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_www_session',
  :secret      => 'd19b68fedcff54dc391ed6e52accc3fa0883ad852e53352cb4fca96a4f6b9cdb0026d31b6938f9d0c16c1bfd0340aaa45219b96b05acfa3281ac3a2145c8e322'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
