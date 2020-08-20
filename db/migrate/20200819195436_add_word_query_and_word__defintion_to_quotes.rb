class AddWordQueryAndWordDefintionToQuotes < ActiveRecord::Migration[6.0]
  def change
    add_column :quotes, :word_query, :string, null: false, default: ""
    add_column :quotes, :word_definition, :string, null: false, default: "", array: true
  end
end
