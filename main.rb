require 'yaml'

require './lib/colorize'
require './lib/personne'
require './lib/ennemi'
require './lib/jeu'
require './lib/joueur'
require './lib/monde'

using Colorize

CONTENUS          = YAML.load_file('contenu.yml')
CONTENU_ETAT      = CONTENUS['etat']
CONTENU_ACTION    = CONTENUS['action']
CONTENU_JEU       = CONTENUS['jeu']
CONTENU_PERSONNE  = CONTENUS['personne']
CONTENU_JOUEUR    = CONTENUS['joueur']
COLORIZE          = CONTENUS['colorize']

tours = 0
monde = Monde.new
hero  = Joueur.new('Jean-Michel Paladin')

monde.ennemis =
  %w[Balrog Goblin Squelette].map do |ennemi|
    Ennemi.new(ennemi)
  end

puts CONTENU_ETAT['intro'] % hero.nom

loop do
  puts CONTENU_ETAT['tours'] % tours
  Jeu.actions_possibles(monde)
  puts CONTENU_ACTION['demander'].vert

  choix = gets.chomp.to_i

  if choix.zero?
    hero.soin
  elsif choix == 1
    hero.ameliorer_degats
  elsif choix == 99
    break
  else
    ennemi_a_attaquer = monde.ennemis[choix - 2]
    hero.attaque(ennemi_a_attaquer)
  end

  puts CONTENU_ACTION['ennemies']

  monde.ennemis_en_vie.each do |ennemi|
    ennemi.attaque(hero)
  end

  puts CONTENU_ETAT['hero'] % hero.info

  break if Jeu.fini?(hero, monde)

  tours += 1
end

puts CONTENU_ETAT['game_over']

message_de_fin =
  if hero.vivant?
    felicitation = CONTENU_ETAT['gagne']
    fuite        = CONTENU_ETAT['fuite']

    Jeu.fini?(hero, monde) ? felicitation.vert : fuite.bleu
  else
    CONTENU_ETAT['perdu'].rouge
  end

puts message_de_fin
