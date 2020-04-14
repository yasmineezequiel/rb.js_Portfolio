class Blog < ApplicationRecord
    enum status: { draft: 0, published: 1 }
    extend FriendlyId
    friendly_id :title, use: :slugged

    validates_presence_of :title, :body

    def self.recent
        order("created_at DESC")
    end
end
