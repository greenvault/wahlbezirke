module MunicipalitiesHelper

  def display_score score
    score.class == BigDecimal ?  score.round(2).to_f : score
  end
end
