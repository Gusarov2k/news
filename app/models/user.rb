class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  validates :password, length: { minimum: 5 }, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :name, presence: true, length: { minimum: 2 }, format: { with: /\A[a-zA-Z0-9]+\Z/ }

  private

  def clear_words
    self.name = name.mb_chars.downcase.strip
    self.email = email.downcase.strip
  end
end
