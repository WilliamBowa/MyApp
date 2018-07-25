class Portfolio < ApplicationRecord
    #validate entries into database
    validates_presence_of :title, :body

    #action refering to the model - to use in its controller to query portfolio item where subtitle is angular
    def self.angular 
        where(subtitle: "Angular")
    end

    # Custom scope to call from the controller 
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails")}
end