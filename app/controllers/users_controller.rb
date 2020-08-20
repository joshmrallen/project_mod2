class UsersController < ApplicationController
    
    def show
        @user = current_user
        @quote = Quote.all.sample
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