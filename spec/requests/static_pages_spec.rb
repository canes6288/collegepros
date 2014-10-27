require 'spec_helper'

describe "static_pages" do

  subject { page }

  describe "home page" do
    # Visit the home page
    before { visit home_path }
    # See that page has title "CollegePros | Home"
    it { should have_title("CPros | Home") }
    # see that it has a the words "Welcome to CollegePros"
    it { should have_selector('h1', text: "Welcome to CollegePros") }
    it { should have_selector('h2', text: "Sign In") }
    it { should have_link('Sign Up', href: signup_path) }
  end
end
