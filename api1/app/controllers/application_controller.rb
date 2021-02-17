class ApplicationController < ActionController::API
	rescue_from ActiveRecord::RecordNotDestroyed,with: :not_destroyed

	private
	def not_destroyed(er)
		render json: {"errors":er.record.errors},status: :unprocessable_entity
	end
end
