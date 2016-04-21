class ModelTypesController < ApplicationController
  include PublicApiRestrictable
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  def model_types_price
    @model_type = ModelType.find_by_model_type_slug params[:model_type_slug]
    raise ActiveRecord::RecordNotFound if @model_type.nil?
    @model_type.attributes = model_type_params
    @model_type.save!
  end

  private

  def model_type_params
    params.require(:model_type).permit(:base_price)
  end

  def render_record_not_found
    render nothing: true, status: :not_found
  end

  def render_invalid
    render nothing: true, status: :bad_request
  end
end
