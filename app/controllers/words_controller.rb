class WordsController < ApplicationController
    def define
        @word = params[:word_query]
        api_key = ENV["API_KEY"]
        url = 'https://www.dictionaryapi.com/api/v3/references/collegiate/json/'
        endpoint = url + @word.split(/\W/) + "?key=" + api_key
        response = JSON.parse(RestClient.get(endpoint))
        @quote.word_definition = response

       end
end
