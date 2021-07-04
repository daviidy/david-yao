class Project < ApplicationRecord
    has_many :project_skillings, foreign_key: :project_id, inverse_of: :project
    has_many :skills, through: :project_skillings
    belongs_to :position

    validates_presence_of :title
    validates_length_of :title, minimum: 4
    validates_presence_of :company
    validates_presence_of :start_year
    validates_presence_of :end_year
    validates_presence_of :short_desc
    validates_presence_of :long_desc
    validates_presence_of :github
    validates_presence_of :demo
    validates_presence_of :image
end
