require 'spec_helper'

describe User do
  #let(:user) { create :user }
  #subject { :user }
  it { should have_attached_file(:avatar) }
  it { should validate_attachment_presence(:avatar) }
  it { should validate_attachment_content_type(:avatar).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }
  it { should validate_attachment_size(:avatar).
                less_than(2.megabytes) }
end
