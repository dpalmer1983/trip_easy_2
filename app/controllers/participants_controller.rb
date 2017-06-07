class ParticipantsController < ApplicationController
  def index
    @participants = Participant.all

    render("participants/index.html.erb")
  end

  def show
    @participant = Participant.find(params[:id])

    render("participants/show.html.erb")
  end

  def new
    @participant = Participant.new

    render("participants/new.html.erb")
  end

  def create
    @participant = Participant.new

    @participant.user_id = params[:user_id]
    @participant.trip_id = params[:trip_id]

    save_status = @participant.save

    if save_status == true
      redirect_to("/participants/#{@participant.id}", :notice => "Participant created successfully.")
    else
      render("participants/new.html.erb")
    end
  end

  def edit
    @participant = Participant.find(params[:id])

    render("participants/edit.html.erb")
  end

  def update
    @participant = Participant.find(params[:id])

    @participant.user_id = params[:user_id]
    @participant.trip_id = params[:trip_id]

    save_status = @participant.save

    if save_status == true
      redirect_to("/participants/#{@participant.id}", :notice => "Participant updated successfully.")
    else
      render("participants/edit.html.erb")
    end
  end

  def destroy
    @participant = Participant.find(params[:id])

    @participant.destroy

    if URI(request.referer).path == "/participants/#{@participant.id}"
      redirect_to("/", :notice => "Participant deleted.")
    else
      redirect_to(:back, :notice => "Participant deleted.")
    end
  end
end
