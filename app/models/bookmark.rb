class Bookmark < ApplicationRecord
    validates :comment,length: { minimum: 6 }
    validates :movie_id, presence: true
    validates :list_id, presence: true
    validates_uniqueness_of :movie_id, scope: [:list_id]
    
    belongs_to :movie
    belongs_to :list
end
