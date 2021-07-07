class Link < ApplicationRecord
    validates_presence_of :text
    validates_presence_of :path
end
