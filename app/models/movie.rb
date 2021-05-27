class Movie < ApplicationRecord
    before_destroy :ensure_no_children

    validates :title, presence: true, uniqueness: true
    validates :overview, presence: true

    has_many :bookmarks

    def ensure_no_children
        unless self.bookmarks.empty?
            raise (ActiveRecord::InvalidForeignKey)
            raise ActiveRecord::Rollback
        end
    end
end
