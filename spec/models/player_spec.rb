require 'spec_helper'

describe Player do
  let(:user) { FactoryGirl.create(:user) }

  it { should respond_to(:name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:first_name) }
  it { should respond_to(:team) }
  it { should respond_to(:position) }
  it { should respond_to(:school) }
  it { should respond_to(:nerd_id) }
  it { should be_valid }
end
