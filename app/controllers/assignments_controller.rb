class AssignmentsController < ApplicationController

  def new
    @person = Person.find(params[:person_id])
    @assignment = Assignment.new
  end

  def create
    @person = Person.find(params[:person_id]) || Person.find(params[:id])
    @assignment = Assignment.create(role: params[:assignment][:role],
                                    location_id: params[:assignment][:location_id],
                                    person_id: params[:person_id])
    if @assignment.save
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  def edit
    @person = Person.find(params[:person_id])
    @assignment = Assignment.find(params[:id])
  end

  def update
    @person = Person.find(params[:person_id]) || Person.find(params[:id])
    @assignment = Assignment.find(params[:id])
    @assignment.update(role: params[:assignment][:role],
                       location_id: params[:assignment][:location_id],
                       person_id: params[:person_id])
    if @assignment.save
      redirect_to person_path(@person)
    else
      render :edit
    end
  end

  def destroy
    @person = Person.find(params[:person_id]) || Person.find(params[:id])
    @assignment = Assignment.find(params[:id])
    @assignment.delete
    redirect_to(person_path(@person))
  end
end