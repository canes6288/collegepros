require 'spec_helper'

describe SessionsController, type: :controller do
  describe "GET new" do
    it "renders :new" do
    end
  end

  describe "POST create" do
    before do
      User.destroy_all
    end

    let(:user) { FactoryGirl.create(:user) }

    context "valid information" do
      it "signs in user" do
        post :create, session: { email: user.email, password: user.password }
        controller.should be_signed_in
      end

      it "redirects to players#dashboard" do
        post :create, session: { email: user.email, password: user.password }
        expect(response).to redirect_to(dashboard_path(user.id))
      end
    end
  end
end





# require 'spec_helper'

# describe SessionsController, type: :controller do
#   describe "GET new" do
#     it "renders :new" do
#     end
#   end

#   describe "POST create" do
#     before do
#       User.destroy_all
#       user = FactoryGirl.create(:user)
#     end

#     let(:user) { FactoryGirl.create(:user) }

#     context "valid information" do
#       it "signs in user" do
#         post :create, session: { email: user.email, password: user.password }
#         controller.should be_signed_in
#       end

#       it "redirects to users#show" do
#         post :create, session: { email: user.email, password: user.password }
#         expect(response).to redirect_to(user_path(user.id))
#       end
#     end
