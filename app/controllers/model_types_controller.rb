class ModelTypesController < ApplicationController
  include PublicApiRestrictable
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

  def model_types_price
    @model_type = ModelType.find_by_model_type_slug params[:model_type_slug]
    raise ActiveRecord::RecordNotFound if @model_type.nil?
  end

  private

  def render_record_not_found
    render nothing: true, status: :not_found
  end
end
