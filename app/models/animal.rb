class Animal < ApplicationRecord
  validates :species, :breed, :age, :name, :gender, presence: true

  scope :random_animal, -> {(
    select("*")
    .from("animals")
    .order(Arel.sql("RANDOM()"))
    .limit(1)
  )}
end