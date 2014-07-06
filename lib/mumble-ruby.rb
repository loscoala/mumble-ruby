require 'opus-ruby'
require 'celt-ruby'
require 'active_support/inflector.rb'
require 'mumble-ruby/version'
require 'mumble-ruby/messages.rb'
require 'mumble-ruby/connection.rb'
require 'mumble-ruby/client.rb'
require 'mumble-ruby/audio_stream.rb'
require 'mumble-ruby/packet_data_stream.rb'
require 'mumble-ruby/img_reader.rb'
require 'mumble-ruby/cert_manager.rb'
require 'mumble-ruby/receive_stream_handler.rb'
#require 'mumble-ruby/audio_copy_stream.rb'
require 'mumble-ruby/mumble2mumble.rb'

module Mumble
  DEFAULTS = {
    sample_rate: 48000,
    bitrate: 32000,
    ssl_cert_opts: {
      cert_dir: File.expand_path("./"),
      country_code: "US",
      organization: "github.com",
      organization_unit: "Engineering"
    }
  }

  def self.configuration
    @configuration ||= Hashie::Mash.new(DEFAULTS)
  end

  def self.configure
    yield(configuration) if block_given?
  end

  Thread.abort_on_exception = true
end
