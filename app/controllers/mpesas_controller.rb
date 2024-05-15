class MpesasController < ApplicationController

    before_action :load_variables

    include Mpesas::Stkpush
    include Mpesas::Stkquery
    include Mpesas::AccessRequest

    private

    def load_variables
      @consumer_key = ENV.fetch('MPESA_CONSUMER_KEY')
      @consumer_secret = ENV.fetch('MPESA_CONSUMER_SECRET')
      @short_code = ENV.fetch("MPESA_SHORTCODE")
      @passkey = ENV.fetch("MPESA_PASSKEY")
      @auth_url =  ENV.fetch('AUTH_URL')
      @stkpush_url = ENV.fetch('STKPUSH_URL')
      @callback_url = ENV.fetch('CALLBACK_URL')
      @stk_query = ENV.fetch('STKQUERY_URL')
      @timestamp = "#{Time.now.strftime "%Y%m%d%H%M%S"}"
      @password = Base64.strict_encode64("#{@short_code}#{@passkey}#{@timestamp}")
      @userpass = Base64::strict_encode64("#{@consumer_key}:#{@consumer_secret}")
    end
end
