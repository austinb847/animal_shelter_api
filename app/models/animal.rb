class Animal < ApplicationRecord
  validates :species, :breed, :age, :name, :gender, presence: true

  scope :random_animal, -> {(
    select("*")
    .from("animals")
    .order(Arel.sql("RANDOM()"))
    .limit(1)
  )}

  scope :search_by_species, -> (species) { where("LOWER(species) like ?", "%#{species}%")}
  scope :search_by_breed, -> (breed) { where("LOWER(breed) like ?", "%#{breed}%")}
  scope :search_by_gender, -> (gender) { where("LOWER(gender) like ?", "#{gender}%")}
end