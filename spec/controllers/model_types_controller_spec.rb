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

  describe "Token based authentication" do
    it { should use_before_action(:restrict_public_api_access) }
  end

  describe "POST #model_types_price" do
    let!(:model_type) { build :model_type }
    let!(:params) { 
      { model_slug: model.model_slug, 
        model_type_slug: model_type.model_type_slug, 
        format: :json }
    }
    
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

    context "when model type does exist" do
      before { 
        model_type.save! 
        params[:model_type] = { base_price: model_type.base_price + 1 }
      }

      it { should permit(:base_price)
              .for(:model_types_price, params: params, verb: :post)
              .on(:model_type) }

      context "when invalid base price" do
        it "should respond with status 400" do
          params[:model_type][:base_price] = "a"
          put :model_types_price, params 
          expect(response.status).to eq(400)
        end
      end

      context "when valid base price" do
        let!(:new_base_price) { params[:model_type][:base_price] }
        before { put :model_types_price, params }

        it { is_expected.to respond_with(200) }

        it "should update the base price" do
          expect(model_type.reload.base_price).to eq(new_base_price)
        end

        it "should return the model_type json" do
          model_type_json = JSON.parse(response.body)
          expect(model_type_json["name"]).to eq(model_type.name)
          expect(model_type_json["base_price"]).to eq(new_base_price)
        end
      end
    end
  end
end
