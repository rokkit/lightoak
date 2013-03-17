require 'spec_helper'

describe Post do
  let(:user) { create :user }
  it { should belong_to(:user) }
  describe "when user is deleted then post will be removed" do
  	before do
  		let(:post) { create :post }
  	end
  end
end
