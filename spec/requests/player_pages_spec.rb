require 'spec_helper'

describe "player_pages" do

  subject { page }

  describe "player page" do
    # Visit the home page
    before { visit players_path }
    # See that page has title "CollegePros | Home"
    it { should have_title("CPros | Follow") }
    # see that it has a the words "Welcome to CollegePros"
    it { should have_selector('h1', text: "Follow Players") }
  end
end
