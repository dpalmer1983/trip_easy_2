class TripsController < ApplicationController
  def index
    @trips = Trip.all
    @current_user = current_user
    @trips_participating_in = []
    Participant.where(:user_id => current_user.id).each do |participation|
      the_trip = participation.trip
      if the_trip.user_id == current_user.id
        # do nothing
      else
        @trips_participating_in.push(the_trip)
      end
    end


    render("trips/index.html.erb")
  end

  def show
    @trip = Trip.find(params[:id])
    @participant = Participant.all
    @trip.start_date = Chronic.parse(params[:start_date])
    @trip.end_date = Chronic.parse(params[:end_date])

    render("trips/show.html.erb")
  end

  def new
    @trip = Trip.new

    render("trips/new.html.erb")
  end

  def create
    @trip = Trip.new

    @trip.name = params[:name]
    @trip.destination = params[:destination]
    @trip.start_date = Chronic.parse(params[:start_date])
    @trip.end_date = Chronic.parse(params[:end_date])
    @trip.description = params[:description]
    @trip.user_id = params[:user_id]


    save_status = @trip.save

    if save_status == true
      redirect_to("/trips/#{@trip.id}", :notice => "Trip created successfully.")
    else
      render("trips/new.html.erb")
    end
  end

  def edit
    @trip = Trip.find(params[:id])

    render("trips/edit.html.erb")
  end

  def update
    @trip = Trip.find(params[:id])

    @trip.name = params[:name]
    @trip.destination = params[:destination]
    @trip.description = params[:description]
    @trip.user_id = params[:user_id]
    @trip.start_date = Chronic.parse(params[:start_date])
    @trip.end_date = Chronic.parse(params[:end_date])

    save_status = @trip.save

    if save_status == true
      redirect_to("/trips/#{@trip.id}", :notice => "Trip updated successfully.")
    else
      render("trips/edit.html.erb")
    end
  end

  def destroy
    @trip = Trip.find(params[:id])

    @trip.destroy

    if URI(request.referer).path == "/trips/#{@trip.id}"
      redirect_to("/", :notice => "Trip deleted.")
    else
      redirect_to(:back, :notice => "Trip deleted.")
    end
  end
end
