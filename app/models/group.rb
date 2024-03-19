class Group < ApplicationRecord
    belongs_to :leader, optional: true

    validates :name, :group_type, :size, :description, presence: true
    validates_numericality_of :size, less_tha_or_equal_to: 10

    def leader_name
        leader ? leader.full_name : 'No leader for this group'
    end
end
