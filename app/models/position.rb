class Position < ApplicationRecord
    has_many :projects

    validates_presence_of :title
    validates_length_of :title, minimum: 4
end
