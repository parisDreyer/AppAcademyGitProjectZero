class Person < ApplicationRecord
  validates :name, presence: true
  belongs_to :house,
    class_name: 'House',
    primary_key: :id,
    foreign_key: :home_id,
    optional: true

end