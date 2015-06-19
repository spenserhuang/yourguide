class Trailer
  include Mongoid::Document
  embedded_in :tour

  field :description
  field :photo_url
end
