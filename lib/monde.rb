class Monde
  attr_accessor :ennemis

  # @return [Array] contenant les ennemis en vie
  def ennemis_en_vie
    ennemis.select(&:vivant?)
  end
end
