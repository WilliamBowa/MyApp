class Portfolio < ApplicationRecord
    has_many :technologies

    accepts_nested_attributes_for :technologies, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true

    #validate entries into database
    validates_presence_of :title, :body

    #action refering to the model - to use in its controller to query portfolio item where subtitle is angular
    def self.angular 
        where(subtitle: "Angular")
    end

    # Custom scope to call from the controller 
    scope :ruby_on_rails_portfolio_items, -> { where(subtitle: "Ruby on Rails")}

    #set default main_image Portfolio is initialized
    after_initialize :set_defaults

    #set default image if record only if it's nill so it won't override the existing images
    def set_defaults
        self.main_image ||= "https://placeholdit.co//i/300x200"
    end
end