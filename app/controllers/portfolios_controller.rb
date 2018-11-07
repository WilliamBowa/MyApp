class PortfoliosController < ApplicationController
    before_action :set_portfolio, only: [:edit, :update, :show, :destroy]

    def index
        @portfolio_items = Portfolio.all
    end

    def angular
        @portfolio_items = Portfolio.angular
    end

    #both new and create actions are needed in order to create a new item
    #Create action to create a new instance of class portfolio make availlable to form
    def new
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build  }
    end

    #Create action connect the form new record into the database
    def create
        @portfolio_item = Portfolio.new(portfolio_params)
        
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
            format.json { render :show, status: :created, location: @portfolio_item }
          else
            format.html { render :new }
          end
        end 
    end

    #edit action has to have a id of the post to edit
    def edit
        #set portfolio_item to be equal to whatever portfolio item is brought back with its id
    end

    def update
        respond_to do |format|
          if @portfolio_item.update(portfolio_params)
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
            format.json { render :show, status: :created, location: @portfolio_item }
          else
            format.html { render :edit }
          end
        end
    end

    def show
    end

    def destroy
        # Peform the lookup

        #Destroy/delete the record
        @portfolio_item.destroy

        # Redirect
        respond_to do |format|
            format.html { redirect_to portfolios_url, notice: 'Item was successfully destroyed.' }
        end
    end

    private
    
    def portfolio_params
        params.require(:portfolio).permit(:title,
                                          :subtitle, 
                                          :body,
                                          technologies_attributes: [:name]
                                        )
    end

    def set_portfolio
        @portfolio_item = Portfolio.find(params[:id])
    end
end
