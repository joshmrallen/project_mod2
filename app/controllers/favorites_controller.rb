class FavoritesController < ApplicationController

    def destroy
        @favorite = Favorite.find(params[:id])
        @user = @favorite.user
        @favorite.destroy
        redirect_to favorite_quotes_path(@user)
    end

    def show
    end

    def index
    end

    
end
