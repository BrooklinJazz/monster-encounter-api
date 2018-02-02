class Api::V1::TokensController < Api::ApplicationController
  # Users make requests to this action with
  # their login information to receive a token (JWT).
  def create
    # 1. Find the user by their email
    user = User.find_by(email: params[:email])

    # 2. Verify the user's password
    if user&.authenticate(params[:password])
      # Authentication succeeds
      render json: {
        jwt: encode_token({
          id: user.id,
          first_name: user.first_name,
          last_name: user.last_name,
          full_name: user.full_name,
          email: user.email
        })
      }
    else
      # Authentication fails
      # Fool attackers by always responding with a 404
      # in case the user is not found or the password is invalid.
      head :not_found
    end
  end

  private
  def encode_token(payload = {}, exp = 24.hours.from_now)
    # JWT once issued cannot be revoked therefore it's best
    # practice to implement an expiration date. The `exp` key
    # of our payload will act as that saving a date as a timestamp.
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
