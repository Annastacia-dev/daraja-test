# frozen_string_literal: true

# Check the status of a Lipa Na M-Pesa Online Payment.

module Mpesas::Stkquery
  extend ActiveSupport::Concern

  def stkquery
    payload = {
    'BusinessShortCode': @short_code,
    'Password': @password,
    'Timestamp': @timestamp,
    'CheckoutRequestID': params[:checkoutRequestID]
    }.to_json

    headers = {
    Content_type: 'application/json',
    Authorization: "Bearer #{ access_token }"
    }

    response = RestClient::Request.new({
    method: :post,
    url: @stk_query_url,
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