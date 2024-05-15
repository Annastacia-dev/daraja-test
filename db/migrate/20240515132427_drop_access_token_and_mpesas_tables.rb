# frozen_string_literal: true

class DropAccessTokenAndMpesasTables < ActiveRecord::Migration[7.1]
  def change
    drop_table :mpesas
    drop_table :access_tokens
  end
end
