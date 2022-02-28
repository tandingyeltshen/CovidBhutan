class Announcement < ApplicationRecord
    has_one_attached :avatar

    validates_presence_of :avatar, :announcement
end
