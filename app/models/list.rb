class List
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  field :name, type: String
  enum :color, [:red, :green, :blue, :gray, :orange]

  belongs_to :account
  has_many :transactions

  validates :name, presence: true
end
