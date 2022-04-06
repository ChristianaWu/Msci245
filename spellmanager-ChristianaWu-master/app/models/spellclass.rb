class Spellclass < ApplicationRecord
    has_and_belongs_to_many :spells
    
    validates_presence_of :class_name
    validates_length_of :class_name, maximum: 50
end
