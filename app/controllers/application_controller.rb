require "#{Rails.root}/lib/JsonWebToken"

class ApplicationController < ActionController::API
    
    def authenticate
        if request.headers['Authorization']
            begin
                token = request.headers['Authorization'].split(' ')[1]
                userID = JsonWebToken.decode(token)['UserID']
                @user = User.find(userID)
            rescue => exception
                render json: {message: "Error: #{exception}"},status: 401
            end
        else
            render json: {message: 'No authorization in header'},status: 401
        end
    end
end
