require 'spec_helper'

describe Post do
  let(:user) { create :user }
  it { should belong_to(:user) }
end
