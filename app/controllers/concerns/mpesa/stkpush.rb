# frozen_string_literal: true

module Mpesa
  # Merchant initiated request (C2B), send a payment prompt on the customer's phone (Popularly known as STK Push Prompt)
  module Stkpush
    def stkpush
      phone_number = params[:phone_number]
      amount = params[:amount]

      respond_to do |format|
        if phone_number.blank? || amount.blank?
          format.html { redirect_to mpesa_express_path, alert: 'Phone number or amount is blank' }
          format.json { render json: { message: 'Error: Phone number or amount is blank '} }
        else
          regex = /\A2547\d{8}\z/
          if regex.match?(phone_number)
            payload = generate_stkpush_payload(phone_number, amount)
            headers = generate_headers
            response = send_stkpush_request(payload, headers)
            format.html { redirect_to mpesa_express_path, notice: 'Request in progress'}
            format.json { render json: response }
          else
            format.html { redirect_to mpesa_express_path, alert: 'Phone number format is invalid should be in the format 2547xxxxxxx' }
            format.json { render json: { message: 'Error: Phone number format is invalid should be in the format 2547xxxxxxx '} }
          end
        end
      end
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
