# frozen_string_literal: true

module Mpesas
  # Makes a request for a time bound access token to call allowed APIs
  module AccessRequest
    private

    def generate_access_token_request
      RestClient::Request.execute(
        url: @auth_url,
        method: :get,
        headers: {
          Authorization: "Basic #{@userpass}"
        }
      )
    end

    def retrieve_access_token
      res = send_access_token_request
      raise MpesaError, 'Unable to generate access token' if res.code != 200

      body = JSON.parse(res, { symbolize_names: true })
      body[:access_token]
    end

    def send_access_token_request
      res = generate_access_token_request
      res.code == 200 ? res : generate_access_token_request
    end
  end
end
