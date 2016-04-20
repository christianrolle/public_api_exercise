require 'rails_helper'

RSpec.describe ModelTypesController, type: :controller do

  describe "routing" do
    it { should route(:post, "/models/serie_3/model_types_price/330i")
            .to(action: :model_types_price, 
                  model_slug: "serie_3", model_type_slug: "330i") }
  end

end
