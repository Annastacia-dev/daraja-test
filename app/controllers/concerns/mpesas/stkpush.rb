module Mpesas::Stkpush
  extend ActiveSupport::Concern

  def stkpush
    phoneNumber = params[:phoneNumber]
    amount = params[:amount]
    payload = {
    'BusinessShortCode': @short_code,
    'Password': @password,
    'Timestamp': @timestamp,
    'TransactionType': "CustomerPayBillOnline",
    'Amount': amount,
    'PartyA': phoneNumber,
    'PartyB': @short_code,
    'PhoneNumber': phoneNumber,
    'CallBackURL': "#{@callback_url}/callback_url",
    'AccountReference': 'Codearn',
    'TransactionDesc': "Payment for Codearn premium"
    }.to_json

    headers = {
    Content_type: 'application/json',
    Authorization: "Bearer #{get_access_token}"
    }

    response = RestClient::Request.new({
    method: :post,
    url: @stkpush_url,
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