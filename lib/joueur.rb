class Joueur < Personne
  attr_accessor :degats_bonus

  MIN_DEGATS  = 0
  MAX_DEGATS  = 30
  MIN_SOIN    = 15
  MAX_SOIN    = 35
  MIN_BONUS   = 0
  MAX_BONUS   = 8

  def initialize(nom)
    @degats_bonus = 0
    super(nom)
  end

  # @return [Integer] valeur totale de dégats
  # avec prise en compte des dégats bonus
  def degats
    degat         = rand(MIN_DEGATS..MAX_DEGATS)
    total_degats  = degat + degats_bonus
    afficher_degats(total_degats, degats_bonus)

    total_degats
  end

  def soin
    gain = rand(MIN_SOIN..MAX_SOIN)
    decrire_soin(points_de_vie, gain)

    if regeneration_totale?(points_de_vie, gain)
      self.points_de_vie = VIE_MAX
    else
      self.points_de_vie += gain
    end
  end

  def ameliorer_degats
    augmentation = rand(MIN_BONUS..MAX_BONUS)
    self.degats_bonus += augmentation

    puts CONTENU_JOUEUR['bonus'] % degats_bonus
  end

  private

  def afficher_degats(total_degats, degats_bonus)
    params = { total_degats: total_degats, degats_bonus: degats_bonus }
    puts CONTENU_JOUEUR['degats'] % params
  end

  # Decrit comment s'est produit l'attaque, si celle-ci
  # est mortelle ou rate...
  def decrire_soin(points_de_vie, gain)
    type, contenu_dynamique =
      if regeneration_totale?(points_de_vie, gain)
        ['deuxieme_vie', nom]
      else
        ['soin_plaisant', { nom: nom, gain: gain }]
      end

    puts CONTENU_JOUEUR[type] % contenu_dynamique
  end

  def regeneration_totale?(points_de_vie, gain)
    (points_de_vie + gain) > VIE_MAX
  end
end
