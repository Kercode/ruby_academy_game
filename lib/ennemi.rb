class Ennemi < Personne
  MIN_DEGATS  = 0
  MAX_DEGATS  = 15

  def degats
    rand(MIN_DEGATS..MAX_DEGATS)
  end
end
