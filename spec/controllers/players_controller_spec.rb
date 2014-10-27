require 'spec_helper'

describe PlayersController, type: :controller do
  describe "GET index" do
    it "renders index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end

