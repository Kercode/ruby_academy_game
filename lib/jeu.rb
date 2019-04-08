class Jeu
  def self.actions_possibles(monde)
    puts CONTENU_JEU['actions']
    puts CONTENU_JEU['soin']
    puts CONTENU_JEU['bonus_attaque']

    index_ennemi = 2
    monde.ennemis.each do |ennemi|
      params = { index_ennemi: index_ennemi, ennemi_info: ennemi.info }
      puts CONTENU_JEU['attaquer'] % params

      index_ennemi += 1
    end

    puts CONTENU_JEU['quitter']
  end

  def self.fini?(joueur, monde)
    return true unless joueur.vivant?
    return true if monde.ennemis_en_vie.size.zero?

    false
  end
end
