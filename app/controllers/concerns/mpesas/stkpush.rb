# frozen_string_literal: true

module Mpesas
  # Merchant initiated request (C2B), send a payment prompt on the customer's phone (Popularly known as STK Push Prompt)
  module Stkpush
    def stkpush
      phone_number = params[:phone_number]
      amount = params[:amount]

      payload = generate_stkpush_payload(phone_number, amount)
      headers = generate_headers

      response = send_stkpush_request(payload, headers)
      render json: response
    end

    private

    # rubocop:disable Metrics/MethodLength
    def generate_stkpush_payload(phone_number, amount)
      {
        BusinessShortCode: @short_code,
        Password: @password,
        Timestamp: @timestamp,
        TransactionType: 'CustomerPayBillOnline',
        Amount: amount,
        PartyA: phone_number,
        PartyB: @short_code,
        PhoneNumber: phone_number,
        CallBackURL: "#{@callback_url}/callback_url",
        AccountReference: 'Rails Daraja',
        TransactionDesc: 'Integration of Daraja API in Rails'
      }.to_json
    end
    # rubocop:enable Metrics/MethodLength

    def send_stkpush_request(payload, headers)
      RestClient::Request.new(
        {
          method: :post,
          url: @stkpush_url,
          payload:,
          headers:
        }
      ).execute do |response, _request|
        handle_response(response)
      end
    end
  end
end
