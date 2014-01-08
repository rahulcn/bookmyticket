class EventsController < ApplicationController
	before_action :authenticate_user!, except: [:home]
	before_action :set_event, only: [:destroy, :edit, :update, :show]


	def home

	end

	# GET /events
	# GET /events.json
	def index
		@events = Event.all.order('created_at desc')

		respond_to do |format|
			format.html
			format.json { render :json => @events }
		end
	end

	# GET /events/1
	# GET /events/1.json
	def show
	end

	# GET /events/new
	def new
		@event = Event.new
	end

	# GET /events/1/edit
	def edit
	end

	# POST /events
	# POST /events.json
	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:notice] = 'Event has been successfully created'
			redirect_to action: :index
		else
			flash[:alert] = @event.errors.full_messages
			render action: :edit
		end
	end

	# PATCH/PUT /events/1
	# PATCH/PUT /events/1.json
	def update
		if @event.update_attributes(event_params)
			flash[:notice] = 'Event has been successfully updated'
			redirect_to action: :index
		else
			flash[:alert] = @event.errors.full_messages
			render action: :edit
		end
	end

	# DELETE /events/1
	# DELETE /events/1.json
	def destroy
		@event.destroy
		redirect_to action: :index
	end

	def attend
		@event = Event.find params[:event_id]
		unless current_user.tickets.find_by(event_id: @event.id)
			@event.tickets.create!(ticket_num: "R#{SecureRandom.hex(4)}", user: current_user)
			@user = current_user
		end
		respond_to do |format|
			format.js
		end
	end

	def unattend
		@event = Event.find params[:event_id]
		ticket = current_user.tickets.find_by(event_id: @event.id)
		if ticket
			ticket.delete
			@user = current_user
		end
		respond_to do |format|
			format.js
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_event
		@event ||= Event.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def event_params
		params.require(:event).permit(:title, :desc, :place, :price, :starts_at, :ends_at)
	end

end