# depends on your 
require 'enzi_stab'

class MQTT::Client
  # Hostname of the remote server
  attr_accessor :host

  # Port number of the remote server
  attr_accessor :port

  # The version number of the MQTT protocol to use (default 3.1.0)
  attr_accessor :version

  # Set to true to enable SSL/TLS encrypted communication
  #
  # Set to a symbol to use a specific variant of SSL/TLS.
  # Allowed values include:
  #
  # @example Using TLS 1.0
  #    client = Client.new('mqtt.example.com', :ssl => :TLSv1)
  # @see OpenSSL::SSL::SSLContext::METHODS
  attr_accessor :ssl

  # Time (in seconds) between pings to remote server (default is 15 seconds)
  attr_accessor :keep_alive

  # Set the 'Clean Session' flag when connecting? (default is true)
  attr_accessor :clean_session

  # Client Identifier
  attr_accessor :client_id

  # Number of seconds to wait for acknowledgement packets (default is 5 seconds)
  attr_accessor :ack_timeout

  # Username to authenticate to the server with
  attr_accessor :username

  # Password to authenticate to the server with
  attr_accessor :password

  # The topic that the Will message is published to
  attr_accessor :will_topic

  # Contents of message that is sent by server when client disconnect
  attr_accessor :will_payload

  # The QoS level of the will message sent by the server
  attr_accessor :will_qos

  # If the Will message should be retain by the server after it is sent
  attr_accessor :will_retain

  #Last ping response time
  attr_reader :last_ping_response


  # Timeout between select polls (in seconds)
  SELECT_TIMEOUT = 0.5

  # Default attribute values
  ATTR_DEFAULTS = {
    :host => nil,
    :port => nil,
    :version => '3',
    :clean_session => true,
    :client_id => nil,
    :ack_timeout => 5,
    :username => nil,
    :password => nil,
    :will_topic => nil,
    :will_payload => nil,
    :will_qos => 0,
    :will_retain => false,
    :ssl => false
  }

  # Create and connect a new MQTT Client
  #
  # Accepts the same arguments as creating a new client.
  # If a block is given, then it will be executed before disconnecting again.
  #
  # Example:
  #  MQTT::Client.connect('myserver.example.com') do |client|
  #    # do stuff here
  #  end
  #
  def self.connect(*args, &block)
    client = MQTT::Client.new(*args)
    client.connect(&block)
    return client
  end
  
  
end
