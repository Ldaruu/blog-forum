class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  layout "portfolio"
  access all: [:show, :index, :react], user: {except: [:destroy, :new, :create, :edit, :update, :sort]}, site_admin: :all

  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render json: nil, status: :ok
  end

  def react
    @react_portfoli_item = Portfolio.react
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully created.' }
        format.json { render :index, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end
  
    def edit 
    end

    def update
      respond_to do |format|
        if  @portfolio_item.update(portfolio_params)
          format.html { redirect_to portfolios_path, notice: 'Portfolio record was successfully updated.' }
          format.json { render :show, status: :ok, location:  @portfolio_item }
        else
          format.html { render :edit }
          format.json { render json:  @portfolio_item.errors, status: :unprocessable_entity }
        end
      end
    end

    def show
    end

    def destroy
      @portfolio_item.destroy
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: 'Portfolio record was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

  
  private
  
    def set_portfolio
      @portfolio_item = Portfolio.find(params[:id])
    end

    def portfolio_params
      params.require(:portfolio).permit(:title, 
                                        :subtitle, 
                                        :body,
                                        :main_image,
                                        :thumb_image,
                                        technologies_attributes:[:name]
                                        )
    end
  
end
