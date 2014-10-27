require 'spec_helper'

describe UsersController, type: :controller do
  describe "GET new" do
    it "renders new page" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns new User to @user" do
      get :new
      assigns(:user).should be_a_new(User) #confirm that @user = User.new
    end
  end

#   describe "GET Show" do
#     let(:user) { FactoryGirl.create(:user) }

#     it "assigns requested user to @user" do
#       get :show, id: user.id
#       assigns(:user).should eq(user)
#     end

#     it "renders :show" do
#       get :show, id: user.id
#       expect(response).to render_template(:show)
#     end
#   end

  describe "POST create" do
    context "with valid attributes" do
      # adds new user to the users database
      # When I post to the create action, change user.count by 1, aka add 1 to the users db
      it "create user in database" do
        expect{
          post :create, user:  FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end
    end

    context "with invalid attributes" do
      before { User.destroy_all }
      it "does not save task to database" do
        expect{
          post :create, user:  FactoryGirl.attributes_for(:user, email: " ")
          }.to_not change(User, :count)
      end

      it "re-renders home/login page" do
        post :create, user:  FactoryGirl.attributes_for(:user, email: " ")
        expect(response).to render_template(:home)
      end
    end
  end
end
