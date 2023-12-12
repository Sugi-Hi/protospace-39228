class Prototype < ApplicationRecord
    # 値化
    validates :title      , presence: true
    validates :catch_copy , presence: true
    validates :concept    , presence: true
    validates :image      , presence: true

    # prototypes⇒単一user・複数comments
    # 画像カラム化：image
    belongs_to  :user
    has_many    :comments ,dependent: :destroy
    has_one_attached  :image
end