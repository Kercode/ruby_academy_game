class Personne
  VIE_MAX = 100

  attr_accessor :nom, :points_de_vie

  def initialize(nom)
    @nom            = nom
    @points_de_vie  = VIE_MAX
  end

  def vivant?
    points_de_vie > 0
  end

  def info
    if vivant?
      params = { nom: nom, points_de_vie: points_de_vie }
      CONTENU_PERSONNE['info_en_vie'] % params
    else
      CONTENU_PERSONNE['info_vaincu'] % nom
    end
  end

  def attaque(personne)
    degats_actuels = degats
    personne.subit_attaque(degats_actuels)
    decrire_attaque(degats_actuels, personne)
  end

  # Ici je considère qu'il est impossible d'avoir moins de 0pv
  # ce qui facilite le contenu de la méthode vivant?
  def subit_attaque(degats)
    degats_mortels?(degats) ? self.points_de_vie = 0 : self.points_de_vie -= degats
  end

  def degats_mortels?(degats)
    points_de_vie <= degats
  end

  private

  # Décrit le déroulement de l'attaque
  def decrire_attaque(degats, personne)
    params = { nom: nom, nom_ennemi: personne.nom }

    type, contenu_dynamique =
      if personne.degats_mortels?(degats)
        ['attaque_mortelle', params]
      elsif degats.zero?
        ['attaque_rate', nom]
      else
        params[:degats] = degats
        ['attaque_douleureuse', params]
      end

    puts CONTENU_PERSONNE[type] % contenu_dynamique
  end
end
