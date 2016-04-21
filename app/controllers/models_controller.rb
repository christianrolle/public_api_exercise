class ModelsController < ApplicationController
  include PublicApiRestrictable

  def index
    @models = Model.all
  end
end
