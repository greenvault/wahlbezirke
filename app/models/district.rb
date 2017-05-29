class District < ApplicationRecord
  belongs_to :state
  default_scope { order(district_identifier: :asc) }

  def municipalities
    Municipality.where(district: self)
  end
end
