# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# Use the existing token.
		File.read(token_file).chomp
	else
		# Generate a new token and store it in token_file.
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

SampleApp2::Application.config.secret_key_base = '8c51855376f1175877e92066437857ca2dfe2c88686306ac61ab516e04ef62b2beeee668aa5f3cbea2a292fb5e4f3ee4271dd256efcdbfaf87bb5e8abc5de1eb'
