class Account
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  field :name, type: String
  enum :account_type, [:income, :expense, :asset, :liability]

  validates :name, :account_type, presence: true

  belongs_to :project

  def total
    BigDecimal.new("0.00")  # TODO
  end
end