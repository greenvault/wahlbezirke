class Municipality < ApplicationRecord
  belongs_to :election
  belongs_to :district
  has_many :precincts
  default_scope { order(name: :asc) }

  def state
    self.district.state
  end
end
