require 'spec_helper'

describe FavoritesController, type: :controller do

  before { @favorites = FactoryGirl.create(:favorite) }

  describe "POST create" do
    it "creates a favorite in database for @user" do
      expect {
        post :create, favorite: FactoryGirl.atributes_for(:favorite)
          }.to change(Favorite, :count).by(1)
    end
  end

  describe "DELETE destroy" do
    it "should delete favorite in database for @user" do
      expect {
        delete :destroy, favorite: FactoryGirl.attributes_for(:favorite)
      }.to change(Favorite, :count).by(1)
    end
  end
end
