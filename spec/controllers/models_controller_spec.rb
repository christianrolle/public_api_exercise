require 'rails_helper'

RSpec.describe ModelsController, type: :controller do
  include PublicApiRestrictableHelper

  before { apply_valid_token }

  describe "routing" do
    it { should route(:get, "/models/serie_3/model_types")
            .to(action: :index, model_slug: "serie_3") }
  end

  it { should use_before_action(:restrict_public_api_access) }

  describe "GET #index" do
    let!(:model) { build :model, :with_model_types }
    let!(:params) { { model_slug: model.model_slug, format: :json } }

    context "when invalid authentication token" do
      it "should respond with status 401" do
        clear_token
        get :index, params 
        expect(response.status).to eq(401)
      end
    end

    context "when models collection" do
      before { get :index, params }

      it { is_expected.to respond_with(200) }

      it "should return the models collection JSON" do
        expect(response).to match_response_schema("models")
      end
    end
  end
end
