require 'spec_helper'

describe "users" do

  subject { page }

  describe "dashboard page GET /dashboard" do
    before { visit dashboard_path }

    it { should have_title("CPros | Dashboard") }
    it { should have_selector('h1', text: "Dashboard") }
  end

  describe "signup page GET /signup" do
    before { visit signup_path }

    it { should have_title("CPros | Sign Up") }
    it { should have_selector('h1', text: "Sign Up") }
    it { should have_field("Confirmation") }
    it { should have_field("Name") }
    it { should have_field("Password") }

    describe "signup POST /users" do
      let(:submit) { "Done" }

      context "valid information" do
        before do
          User.destroy_all
          fill_in "Name",                  with: "Gerry"
          fill_in "Email",                 with: "rgpass@gmail.com"
          fill_in "Password",              with: "foobar"
          fill_in "Confirmation",          with: "foobar"
          fill_in "Phone Number",          with: "9999999999"
        end

        it "creates user" do
          expect { click_button submit }.to change(User, :count).by(1)
        end

        describe "after submission" do
          before { click_button submit }

          it { should have_title("CPros | Players") }
        end
      end
    end
  end
end


#         describe "after submission" do
#           before { click_button submit }

#           it { should have_title('Todo | Sign Up') } # re-renders users#new w/errors
#           it { should have_content('error') }
#         end
#       end
#     end
#   end


