class Review < ApplicationRecord
  # Validations
  validates :city, :country, :content, :rating, :user_name, presence: true
  validates :rating, numericality: { only_integer: true, less_than: 6, greater_than: 0}

  # Scopes
  scope :city, -> (city_name) { where("city ilike ?", "%#{city_name}%") }

  scope :country, -> (country_name) {  where("country ilike ?", "%#{country_name}%") }

  scope :search, -> (city_name, country_name) { where("city ilike ? AND country ilike ?", "%#{city_name}%", "%#{country_name}%") }

  # Callback
  before_save(:titleize)

  private
    def titleize
      self.city = self.city.titleize
      self.country = self.country.titleize
    end
end