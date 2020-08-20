
user --< favorite >-- quote
word

Select a quote in favorites

Split that quote into strings of individual words

Iterate through each word

Make a Link_to for each word
    Link_to path will be api endpoint

Quote gets to attributes:
    * word_query
    * word_definition

Link_to posts string to quotes_controller action: query -- query_path(@quote_id)
    * :quote_id => @quote.id
    * :word_query => individual word in the quote string parse each block
    * quotes_controller post action saves the string to quote.word_query
    * redirects to get action's view: quotes/:id/define -- define_path(@quote.id)

quotes_controller get action: define
    * creates the api endpoint using quote.word_query (concatenation)
    * makes call to api
    * saves response into quote.word_definition

Workflow:
1. Click link
2. Word get sent to action which stores in quote.query attribute
3. 