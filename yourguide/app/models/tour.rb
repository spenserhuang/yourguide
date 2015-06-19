class Tour
  include Mongoid::Document
  belongs_to :user, index: true
  embeds_one :trailer

  field :title
  field :city
  field :state
  field :zip, type: Integer
  field :coordinates, type: Array
  field :video_url, type: String
  field :photo_urls, type: Array
  field :content
  field :created_at, type: Date, default: DateTime.now

  attr_readonly :created_at

  validates_presence_of :title, :city, :state, :video_url

  index({ title: 1, city: 1, state: 1 }, { name: "basic_tour_index" })
end
