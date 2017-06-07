class Precinct < ApplicationRecord
  belongs_to :district
  belongs_to :municipality
end
