class User
  include Mongoid::Document
  include BCrypt

  has_many :tours, dependent: :destroy

  field :username
  field :password_hash
  field :first_name
  field :middle_initial
  field :last_name
  field :email
  field :phone_numbers, type: Array
  field :city
  field :state
  field :zip, type: Integer
  field :created_at, type: Date, default: DateTime.now

  attr_readonly :created_at

  validates_presence_of :username, :first_name, :last_name, :email
  validates_uniqueness_of :username, :email
  # validates_length_of :password, minimum: 8, maximum: 20

  index({ username: 1, first_name: 1, last_name: 1 }, { unique: true, background: true, name: "user_info_index" })

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
