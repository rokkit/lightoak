# coding: utf-8
require 'spec_helper'

describe 'Users' do
	subject { page }
	let(:user) { create :user }
	describe 'when user navigate to root path and not logged in then navigate to signin or signup' do
		before do    
	      visit root_path
    	end
		it "should redirect and have content Registration" do
			current_path.should == new_user_session_path
			should have_content 'Регистрация' 
		end

		describe 'when user fill in valid cred then redirect to main page' do
			before do
				fill_in 'user_email_login', with: user.email
				fill_in 'user_password_login', with: user.password
				click_button 'Войти'
			end
			it { should have_content user.name }
		end
	end
end