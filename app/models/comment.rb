class Comment < ApplicationRecord
    # comments⇒単一prototype・user
    belongs_to :prototype
    belongs_to :user

    validates :content, presence: true
end
