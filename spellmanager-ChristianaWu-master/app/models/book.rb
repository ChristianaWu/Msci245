class Book < ApplicationRecord
    has_and_belongs_to_many :spells
    
    validates_presence_of :name
    validates_length_of :name, maximum: 70
    validates_uniqueness_of :name, :case_sensitive => true
    
    def num_spells
        return self.spells.count
    end
    
    def spell_in_book? id
        if self.spells.pluck(:id).include? id 
            return true 
        else 
            return false 
        end
    end
end
