# frozen_string_literal: true

module Mpesa
  # Check the status of a Lipa Na M-Pesa Online Payment.
  module Stkquery
    extend ActiveSupport::Concern

    def stkquery
      checkout_request_id = params[:checkout_request_id]

      payload = generate_query_payload(checkout_request_id)

      headers = generate_headers

      response = send_query_request(payload, headers)
      render json: response
    end

    private

    def generate_query_payload(checkout_request_id)
      {
        BusinessShortCode: @short_code,
        Password: @password,
        Timestamp: @timestamp,
        CheckoutRequestID: checkout_request_id
      }.to_json
    end

    def send_query_request(payload, headers)
      RestClient::Request.new(
        {
          method: :post,
          url: @stk_query_url,
          payload:,
          headers:
        }
      ).execute do |response, _request|
        handle_response(response)
      end
    end
  end
end
