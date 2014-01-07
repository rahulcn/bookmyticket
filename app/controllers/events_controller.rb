class EventsController < ApplicationController
	before_action :authenticate_user!, except: [:home]
	before_action :set_event, except: [:index, :home]


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
		render 'admin/events/new', layout: 'admin'
	end

	# GET /events/1/edit
	def edit
		render 'admin/events/edit', layout: 'admin'
	end

	# POST /events
	# POST /events.json
	def create
		@event = Event.new(event_params)

		respond_to do |format|
			if @event.save
				format.html { redirect_to "/#{Event.to_s.underscore.pluralize}", notice: "#{Event.to_s} was successfully created." }
				format.json { render action: 'show', status: :created, location: @event }
			else
				format.html { render action: 'admin/events/new' }
				format.json { render json: @event.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /events/1
	# PATCH/PUT /events/1.json
	def update
		respond_to do |format|
			if @event.update(event_params)
				format.html { redirect_to "/#{Event.to_s.underscore.pluralize}", notice: "Your changes are successfully updated" }
				format.json { head :no_content }
			else
				flash[:alert] = @event.errors.full_messages
				format.html { render 'admin/events/edit', layout: 'admin'  }
				format.json { render json: @event.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /events/1
	# DELETE /events/1.json
	def destroy
		@event.destroy
		respond_to do |format|
			format.html { redirect_to "/#{Event.to_s.underscore.pluralize}" }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_event
		@event ||= Event.find(params[:event_id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def event_params
		params.require(:event).permit(:title, :desc, :starts_at, :ends_at)
	end

end