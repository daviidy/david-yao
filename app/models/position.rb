class Position < ApplicationRecord
    has_many :position_projecting, foreign_key: "position_id"
    has_many :projects, through: :position_projecting

    validates_presence_of :title
    validates_length_of :title, minimum: 4
end
