# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'
require 'dotenv'

# Initialize the Rails application.
Dotenv.load
Rails.application.initialize!
