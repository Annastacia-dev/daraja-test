module Mpesas::AccessRequest
  extend ActiveSupport::Concern

  private

  def generate_access_token_request
    headers = {
        Authorization: "Bearer #{@userpass}"
    }
    res = RestClient::Request.execute( url: @auth_url, method: :get, headers: {
        Authorization: "Basic #{@userpass}"
    })
    res
end

def get_access_token
    res = generate_access_token_request()
    if res.code != 200
    r = generate_access_token_request()
    if res.code != 200
    raise MpesaError('Unable to generate access token')
    end
    end
    body = JSON.parse(res, { symbolize_names: true })
    token = body[:access_token]
    AccessToken.destroy_all()
    AccessToken.create!(token: token)
    token
end


end