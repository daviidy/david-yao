class ProjectSkilling < ApplicationRecord
    belongs_to :skill 
    belongs_to :project
    accepts_nested_attributes_for :skill

    validates_presence_of :skill
    validates_presence_of :project
end
