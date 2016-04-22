class ModelsController < ApplicationController
  include PublicApiRestrictable

  def index
    @models = Model.includes(:organization, :model_types).all
  end
end
