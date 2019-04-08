module Colorize
  refine String do
    def rouge
      couleur_dynamique(__method__, self)
    end

    def vert
      couleur_dynamique(__method__, self)
    end

    def bleu
      couleur_dynamique(__method__, self)
    end

    def couleur_dynamique(couleur, contenu)
      COLORIZE[couleur.to_s] % contenu
    end
  end
end
