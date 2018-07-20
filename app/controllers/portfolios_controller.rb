class PortfoliosController < ApplicationController
    def index
        @portfolio_items = Portfolio.all
    end

    #Create action to create a new instance of class portfolio make availlable to form
    def new
        @portfolio_item = Portfolio.new
    end

    #Create action connect the form new record into the database
    def create
        @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
            format.json { render :show, status: :created, location: @portfolio_item }
          else
            format.html { render :new }
          end
        end
    end
end
