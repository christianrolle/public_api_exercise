require 'rails_helper'

RSpec.describe ModelTypesController, type: :controller do
  include PublicApiRestrictableHelper

  let!(:model) { build :model }
  before { apply_valid_token }

  describe "routing" do
    it { should route(:post, "/models/serie_3/model_types_price/330i")
            .to(action: :model_types_price, 
                  model_slug: "serie_3", model_type_slug: "330i") }
  end

  describe "POST #model_types_price" do
    let!(:model_type) { build :model_type }
    let!(:params) { 
      { model_slug: model.model_slug, 
        model_type_slug: model_type.model_type_slug, 
        format: :json }
    }
    
    it { should use_before_action(:restrict_public_api_access) }
    
    context "when invalid authentication token" do
      it "should respond with status 401" do
        clear_token
        put :model_types_price, params 
        expect(response.status).to eq(401)
      end
    end

    context "when model type does not exist" do
      it "should respond with status 404" do
        put :model_types_price, params
        expect(response.status).to eq(404)
      end
    end
  end
end
