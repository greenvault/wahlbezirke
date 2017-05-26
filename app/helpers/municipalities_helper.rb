module MunicipalitiesHelper

  def display_score score
    number_with_precision(score, precision: 2)
  end
end
