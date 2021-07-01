class Skill < ApplicationRecord
    has_many :project_skillings, foreign_key: "skill_id"
    has_many :projects, through: :project_skillings

    validates_presence_of :title
    validates_length_of :title, minimum: 4
    validates_presence_of :skill_type
    validates_presence_of :image
end
