class Workspace < ApplicationRecord
    has_many :items, dependent: :destroy

    def next
        self.class.where("position > ?", position).order(:position).first
    end

    def previous
        self.class.where("position < ?", position).order(:position).last
    end

    acts_as_list
end