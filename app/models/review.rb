class Review < ApplicationRecord
  validates :city, :country, :content, :rating, :user_name, presence: true
  validates :rating, numericality: { only_integer: true, less_than: 6, greater_than: 0}

  before_save(:titleize)

  private
    def titleize
      self.city = self.city.titleize
      self.country = self.country.titleize
    end
end