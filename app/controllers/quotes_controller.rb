class QuotesController < ApplicationController
    @@list_of_quotes = Quote.all

   def index
    @user = User.find(current_user.id)
    @quotes = @@list_of_quotes.to_a
   end

   def query
    @quote = Quote.find(params[:quote_id])
    @quote.word_query = params[:word_query]
    redirect_to define_path(@quote.id)
   end

   def define
    @quote = Quote.find(params[:id])
    api_key = ''
    url = 'https://www.dictionaryapi.com/api/v3/references/collegiate/json/'
    endpoint = url + @quote.word_query.split(/\W/) + "?key=" + api_key
    response = JSON.parse(RestClient.get(endpoint))
    @quote.word_definition = response
   end

   #TODO: make view for #define
   #TODO: add routes for post query and get define


end