# frozen_string_literal: true

# Logic for all Mpesa related tasks
class MpesasController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_variables
  before_action :load_urls

  include Mpesas::AccessRequest
  include Mpesas::Stkpush
  include Mpesas::Stkquery

  private

  def load_variables
    @consumer_key = ENV.fetch('MPESA_CONSUMER_KEY')
    @consumer_secret = ENV.fetch('MPESA_CONSUMER_SECRET')
    @short_code = ENV.fetch('MPESA_SHORTCODE')
    @passkey = ENV.fetch('MPESA_PASSKEY')
    @timestamp = Time.now.strftime('%Y%m%d%H%M%S').to_s
    @password = Base64.strict_encode64("#{@short_code}#{@passkey}#{@timestamp}")
    @userpass = Base64.strict_encode64("#{@consumer_key}:#{@consumer_secret}")
  end

  def load_urls
    @auth_url =  ENV.fetch('AUTH_URL')
    @stkpush_url = ENV.fetch('STKPUSH_URL')
    @callback_url = ENV.fetch('CALLBACK_URL')
    @stk_query_url = ENV.fetch('STKQUERY_URL')
  end

  def generate_headers
    {
      Content_type: 'application/json',
      Authorization: "Bearer #{retrieve_access_token}"
    }
  end

  def handle_response(response)
    case response.code
    when 500, 400
      [:error, JSON.parse(response.to_str)]
    when 200
      [:success, JSON.parse(response.to_str)]
    else
      raise "Invalid response #{response.to_str} received."
    end
  end
end
