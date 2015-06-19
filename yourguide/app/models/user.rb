class User
  include Mongoid::Document
  has_many :tours, dependent: :destroy, index: true

  field :username
  field :password, type: Hash
  field :first_name
  field :middle_initial
  field :last_name
  field :email
  field :phone_numbers, type: String
  field :city
  field :state
  field :zip, type: Integer
  field :created_at, type: Date, default: Date.now

  embeds_many :phone_numbers
  attr_protected :password
  attr_readonly :created_at

  validates_presence_of :username, :password, :first_name, :last_name, :email
  validates_uniqueness_of :username, :email
  # validates_length_of :password, minimum: 8, maximum: 20

  index({ username: 1, first_name: 1, last_name: 1 }, { unique: true, background: true })
end
