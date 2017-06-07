class District < ApplicationRecord
  belongs_to :state
  has_many :precincts
  has_many :municipalities
  default_scope { order(district_identifier: :asc) }

  def municipalities
    Municipality.where(district: self)
  end

  def precincts
    Precinct.where(district: self)
  end
end
