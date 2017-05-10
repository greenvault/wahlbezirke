class Municipality < ApplicationRecord
  belongs_to :district
  default_scope { order(name: :asc) }
end
