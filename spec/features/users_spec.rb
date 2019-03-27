require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  include LogInHelper

  describe 'when not authorization' do
    context 'when links' do
      it 'login in' do
        visit log_in_path
        expect(page).to have_content('Log In')
      end

      it 'sign up' do
        visit sign_up_path
        expect(page).to have_content('New user')
      end
    end
  end

  describe 'create' do
    before do
      visit sign_up_path
    end

    it 'when successfully' do
      within('form') do
        fill_in 'Name', with: 'Jon'
        fill_in 'Email', with: 'jo@ya.ru'
        fill_in 'Password', with: '12345'
        fill_in 'Password confirmation', with: '12345'
      end

      click_button 'Create User'
      expect(page).to have_content('Welcome!')
    end
  end

  describe 'validates' do
    let(:user) { build(:user) }

    before do
      visit sign_up_path
    end

    context 'when fails' do
      it 'name blank' do
        user.name = nil
        click_button 'Create User'
        expect(page).to have_content('Namecan\'t be blank')
      end
      it 'name short' do
        user.name = 'sa'
        click_button 'Create User'
        expect(page).to have_content('Namecan\'t be blank')
      end

      it 'email blank' do
        user.email = nil
        click_button 'Create User'
        expect(page).to have_content('Emailcan\'t be blank')
      end

      it 'email don\'t contains @ and .' do
        user.email = 'dafeerue'
        click_button 'Create User'
        expect(page).to have_content('Emailcan\'t be blank')
      end

      it 'password blank' do
        user.password = nil
        click_button 'Create User'
        expect(page).to have_content('Password confirmationcan\'t be blank')
      end

      it 'password short' do
        user.password = '12345'
        click_button 'Create User'
        expect(page).to have_content('Password confirmationcan\'t be blank')
      end

      it 'password_confirmation blank' do
        within('form') do
          fill_in 'Password', with: nil
        end
        click_button 'Create User'
        expect(page).to have_content('Password confirmationcan\'t be blank')
      end

      it 'password not equal password_confirmation' do
        within('form') do
          fill_in 'Password', with: 12_345
          fill_in 'Password confirmation', with: 1234
        end
        click_button 'Create User'
        expect(page).to have_content('Password confirmationdoesn\'t match Password')
      end
    end
  end

  describe 'user update' do
    let(:user) { create(:user) }

    before do
      log_in(user.email, 'secret', 'Log In')
    end

    context 'when successful' do
      it 'update name and return text message' do
        visit edit_user_path(user)
        within('form') do
          fill_in 'Name', with: 'ivan2'
        end
        click_button 'Update User'
        expect(page).to have_content('User was successfully updated.')
      end

      it 'update email and return text message' do
        visit edit_user_path(user)
        within('form') do
          fill_in 'Email', with: 'ivan@mail.ru'
        end
        click_button 'Update User'
        expect(page).to have_content('User was successfully updated.')
      end
    end

    context 'when false' do
      it 'name is blank' do
        visit edit_user_path(user)
        within('form') do
          fill_in 'Name', with: ''
        end
        click_button 'Update User'
        expect(page).to have_content('Namecan\'t be blank')
      end
    end
  end

  describe 'user exit' do
    let(:user) { create(:user) }

    before do
      log_in(user.email, 'secret', 'Log In')
    end

    it 'session destroy' do
      click_link 'Log Out'
      expect(page).to have_content('See you!')
    end
  end
end
