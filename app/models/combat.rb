class Combat < ApplicationRecord
  belongs_to :user
  serialize :fight, JSON
end
