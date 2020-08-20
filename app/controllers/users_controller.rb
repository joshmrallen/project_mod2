class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show
        if current_user
        @user = current_user
        else
            redirect_to new_user_session_path
        end 
    end

    def favorites
        @user = User.find(params[:id])
        @quotes = @user.quotes
    end 

    def add_to_user_favorites
        @user = User.find(current_user.id)
        @quote = Quote.find(params[:quote_id])
        @user.quotes << @quote
        puts "Successfully added Quote to Favorite Quotes List"
        redirect_to quotes_path
    end

end