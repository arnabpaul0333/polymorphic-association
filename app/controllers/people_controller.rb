class PeopleController < ApplicationController
 
  def new
    @person = Person.new
    render layout: false
  end
  
  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to person_path(@person), success: "the person is created successfully"
    else
      render 'new'
    end 
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(person_params)
      redirect_to person_path, success: "The person has been updated"
    else
      render 'edit'
    end
  end

  def index
    @people = Person.all
  end

  private 
  def person_params
    params.require(:person).permit(:first_name,:last_name)
  end
end
