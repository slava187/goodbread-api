require './lib/json_web_token'

class AuthController < ApplicationController
   before_action :authorize_request, except: :login

   def login
      @user = User.find_by(username: params[:user][:username])

      if @user&.authenticate(params[:user][:password])
         token = JsonWebToken.encode(user_id: @user.id)
         time = Time.now + 24.hours.to_i
         time_milli = time.to_f * 1000
         render json: UserSerializer.new(@user).serialized_json({token: token, exp: time_milli})
      else
         render json: { error: 'unauthorized'}, status: :unauthorized
      end
   end

   private

   def login_params
      params.require(:user).permit(:username, :password)
   end
 end