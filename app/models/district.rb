class District < ApplicationRecord
  belongs_to :state
  default_scope { order(district_id: :asc) }
end
