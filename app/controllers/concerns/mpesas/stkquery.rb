module Mpesas::Stkquery
  extend ActiveSupport::Concern

  def stkquery
    url = "https://sandbox.safaricom.co.ke/mpesa/stkpushquery/v1/query"
    payload = {
    'BusinessShortCode': @short_code,
    'Password': @password,
    'Timestamp': @timestamp,
    'CheckoutRequestID': params[:checkoutRequestID]
    }.to_json

    headers = {
    Content_type: 'application/json',
    Authorization: "Bearer #{ get_access_token }"
    }

    response = RestClient::Request.new({
    method: :post,
    url: url,
    payload: payload,
    headers: headers
    }).execute do |response, request|
    case response.code
    when 500
    [ :error, JSON.parse(response.to_str) ]
    when 400
    [ :error, JSON.parse(response.to_str) ]
    when 200
    [ :success, JSON.parse(response.to_str) ]
    else
    fail "Invalid response #{response.to_str} received."
    end
    end
    render json: response
end
end