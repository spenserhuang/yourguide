class Comment
  include Mongoid::Document

  belongs_to :author, polymorphic: true
  belongs_to :tour

  field :title
  field :content
  field :created_at, type: Date, default: DateTime.now

  attr_readonly :created_at
end
