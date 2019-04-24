class Person < ApplicationRecord
  # -----VALIDATIONS-----
  # Presence, uniqueness, and inclusion/exclusion
  validates :first_name, :last_name, presence: true
  # validates :username, uniqueness: { case_sensitive: false }
  # validates :account, inclusion: ['free', 'premium', 'business']
  # validates :appt_day, exclusion: ['Sunday', 'Saturday']

  # Length validations
  # validates :username, length: { maximum: 15 }
  validates :first_name, length: { minimum: 1 }
  # validates :password, length: { in: 10..50 }

  # Thresholds
  # validates :age, length: { greater_than: 18 }
  # validates :commission_percentage, length: { less_than: 30 }

  # Numericality
  # validates :price, numericality: true
  # validates :year, numericality: { only_integers: true }

  # Regex validation - not a real email regex
  # validates :email, format: { with: /\w_@\w_.\w*/ }
  
  # Allow nil value
  # validates :nickname, length: { in: 4..10, allow_nil: true }
  
  # Message validation
  # validates :year, presence: { message: "Please select a year." }

  # Conditional validation
  # validates :password, length: { in: 10..20, on: :create }


  # -----CALLBACKS-----
  before_save :change_name

  def change_name
    self.first_name = 'Bob'
  end


  # -----ASSOCIATIONS-----
  has_many :orders


  # -----SEARCH-----
  def self.search(term, page = 1, per_page = 10)
    Person.offset( per_page * (page - 1)).limit(per_page).find_by_last_name term
  end
end
