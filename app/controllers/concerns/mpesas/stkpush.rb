# frozen_string_literal: true

module Mpesas
  # Merchant initiated request (C2B), send a payment prompt on the customer's phone (Popularly known as STK Push Prompt)
  class Stkpush
    extend ActiveSupport::Concern

    def stkpush
      phone_number = params[:phone_number]
      amount = params[:amount]

      payload = generate_payload(phone_number, amount)
      headers = generate_headers

      response = send_request(payload, headers)
      render json: response
    end

    private

    def generate_payload(phone_number, amount)
      {
        'BusinessShortCode': @short_code,    'Password': @password,
        'Timestamp': @timestamp,             'TransactionType': 'CustomerPayBillOnline',
        'Amount': amount,                    'PartyA': phone_number,
        'PartyB': @short_code,               'PhoneNumber': phone_number,
        'CallBackURL': "#{@callback_url}/callback_url",
        'AccountReference': 'Ruby Daraja',
        'TransactionDesc': 'Ruby Daraja Api Stk push test'
      }.to_json
    end

    def generate_headers
      {
        Content_type: 'application/json',
        Authorization: "Basic #{access_token}"
      }
    end

    def send_request(payload, headers)
      RestClient::Request.new(
        method: :post,
        url: @stkpush_url,
        payload:,
        headers:
      ).execute do |response, _request|
        handle_response(response)
      end
    end

    def handle_response(response)
      case response.code
      when 200
        [:success, JSON.parse(response.to_str)]
      when 400, 500
        [:error, JSON.parse(response.to_str)]
      else
        raise "Invalid response #{response.to_str} received."
      end
    end
  end
end
