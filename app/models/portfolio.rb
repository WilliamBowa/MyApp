class Portfolio < ApplicationRecord
    #validate entries into database
    validates_presence_of :title, :body
end