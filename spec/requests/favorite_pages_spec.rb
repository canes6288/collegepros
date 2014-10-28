require 'spec_helper'

describe "favorite_pages" do

  subject { page }

  describe "player page" do
    before { visit dashboard_path }

    it { should have_title("CPros | Dashboard") }
    it { should have_selector('h1', text: "Dashboard") }
  end
end

