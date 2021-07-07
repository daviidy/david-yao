class Skill < ApplicationRecord
    has_many :project_skillings, foreign_key: "skill_id"
    has_many :projects, through: :project_skillings

    validates_presence_of :title
    validates_length_of :title, minimum: 4
    validates_presence_of :skill_type
    validates_presence_of :image

    scope :languages, -> { where('skill_type = ?', 'languages') }
    scope :frameworks, -> { where('skill_type = ?', 'frameworks') }
    scope :skills, -> { where('skill_type = ?', 'skills') }
    scope :databases, -> { where('skill_type = ?', 'databases') }
    
end
