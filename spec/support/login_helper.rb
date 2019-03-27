module LogInHelper
  def log_in(email, password, action)
    visit log_in_path(locale: :en)
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button action
  end
end
