class User < ApplicationRecord
  validates :api_key, :email, :name, presence: true
  validates :api_key, :email, uniqueness: true

  before_create :generate_api_key

  private

  def generate_api_key
    loop do
      token = SecureRandom.base64.tr('+/=', 'Qrt')
      break token unless User.exists?(api_key: token)
    end
  end
end
