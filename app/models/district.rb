class District < ApplicationRecord
  belongs_to :state
  default_scope { order(district_identifier: :asc) }
end
