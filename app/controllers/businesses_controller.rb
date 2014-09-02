class BusinessesController < ApplicationController

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to business_path(@business)
    else
      render 'new'
    end
  end

  def show
    @business = Business.find(params[:id])
  end

  def edit
    @business = Business.find(params[:id])
  end

def update
  @business = Business.find(params[:id])
    if @business.update_attributes(business_params)
      redirect_to business_path, success: "The person has been updated"
    else
      render 'edit'
    end
  end

  def index
    @businesses = Business.all
  end

  private 
  def business_params
    params.require(:business).permit(:name)
  end
end
