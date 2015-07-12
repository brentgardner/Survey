class Organization < ActiveRecord::Base
  validates :name, presence: true,
                   length: { maximum: 75 },
                   uniqueness: { case_sensitive: false }

  validates :address1, presence: true,
                       length: { maximum: 125 }

  validates :city, presence: true,
                   length: { maximum: 75 }

  validates :state, presence: true,
                    length: { maximum: 2 }

  validates :zip, presence: true,
                  length: { maximum: 5 }

  validates :phone, presence: true,
                    length: { maximum: 12 }

  validates :url, length: { maximum: 255 },
                  format: { with: /\A#{URI::regexp(['http', 'https'])}\z/ },
                  uniqueness: { case_sensitive: false }
end
