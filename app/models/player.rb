class Player < ApplicationRecord
  belongs_to :user
  serialize :stats, JSON
end
