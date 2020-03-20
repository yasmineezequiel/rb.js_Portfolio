class PortfoliosController < ApplicationController

  def index
      @portfolio_items = Portfolio.all
  end

  def react
    @react_portfolio_items = Portfolio.react
  end

  def new
      @portfolio_item = Portfolio.new
      2.times { @portfolio_item.technologies.build}
  end

  def create
      @portfolio = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name]))
  
      respond_to do |format|
        if @portfolio.save
          format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
          format.json { render :show, status: :created, location: @portfolio }
        else
          format.html { render :new }
          format.json { render json: @portfolio.errors, status: :unprocessable_entity }
        end
      end
    end

  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
        if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
          format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
          format.json { render :show, status: :ok, location: @portfolio }
        else
          format.html { render :edit }
          format.json { render json: @portfolio.errors, status: :unprocessable_entity }
        end
      end
    end 

  def show 
    @portfolio_item = Portfolio.find(params[:id])
  end  
  
  def destroy
    @portfolio_item = Portfolio.find(params[:id])
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was deleted.' }
    end
  end
end