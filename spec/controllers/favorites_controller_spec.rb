require 'spec_helper'

describe FavoritesController, type: :controller do
  describe "GET index" do
    it "renders index/dashboard page" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
