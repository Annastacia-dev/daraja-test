# frozen_string_literal: true

module Mpesas
  # Makes a request for a time bound access token to call allowed APIs
  class AccessRequest
    private

    def generate_access_token_request
      RestClient::Request.execute(
        url: @auth_url,
        method: :get,
        headers: {
          Authorization: "Bearer #{@userpass}"
        }
      )
    end

    def access_token
      res = send_access_token_request
      raise MpesaError, 'Unable to generate access token' if res.code != 200

      body = JSON.parse(res.body, symbolize_names: true)
      token = body[:access_token]

      store_access_token(token)

      token
    end

    def send_access_token_request
      res = generate_access_token_request
      res.code == 200 ? res : generate_access_token_request
    end

    def store_access_token(token)
      AccessToken.destroy_all
      AccessToken.create!(token)
    end
  end
end
