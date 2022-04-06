class Spell < ApplicationRecord
    has_and_belongs_to_many :books
    has_and_belongs_to_many :spellclasses
    
    validates_presence_of :name
    validates_uniqueness_of :name, :case_sensitive => true
    validates_length_of :name, maximum: 70
    validates_presence_of :level, :presence => true
    validates_numericality_of :level, only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9  
    validates_presence_of :school, :presence => true
    validates_presence_of :concentration, inclusion: { in: ["No", "Yes"] }
    #validates_presence_of :spellclasses, acceptance: true
    validate :atleast_one_is_checked
    
    def spellcalss_array 
        return self.spellclasses.pluck("spellclasses.class_name")
    end

    def atleast_one_is_checked
         errors.add(:base, 'A spell must have one or more class') if self.spellclass_ids.empty? 
    end
end
