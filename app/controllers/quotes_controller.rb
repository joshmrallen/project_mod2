class QuotesController < ApplicationController
    @@list_of_quotes = Quote.all

   def index
    @user = User.find(current_user.id)
    @quotes = @@list_of_quotes.to_a
   end

   # def show
   # end

   # def query
   #    @quote = Quote.find(params[:quote_id])
   #    @quote.word_query = params[:word_query]
   #  # byebug
   # #  redirect_to word_definition(@quote.id)
   #    redirect_to 'define/quotes/:quote_id/:word_query'
   # end

   def define
      @quote = Quote.find(params[:quote_id])
      @quote.word_query = params[:word_query]
      word = @quote.word_query.split(/\W/).flatten[0]
      api_key = ENV["API_KEY"]
      url = 'https://www.dictionaryapi.com/api/v3/references/collegiate/json/'
      endpoint = url + word + "?key=" + api_key
      @response = RestClient.get(endpoint)
      @quote.word_definition = JSON.parse(@response)

      if !JSON.parse(@response)[0].include?("meta")
         @header_word = "Definition not found."
      elsif JSON.parse(@response)[0].include?("cxs")
         @header_word = JSON.parse(@response)[0]["hwi"]["hw"]
         @cxs_def = JSON.parse(@response)[0]["cxs"].map{|array| array["cxl"]}
      else
         @header_word = JSON.parse(@response)[0]["hwi"]["hw"]
         if !JSON.parse(@response)[0].include?("def")
            @pronunciation = JSON.parse(@response)[0]["hwi"]["prs"][0]["mw"]
         end
         @def = JSON.parse(@response)[0]["def"][0]["sseq"]
      end
      # byebug
   end

end
