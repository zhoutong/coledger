class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :amount, :created_at, :updated_at, :list_id

end
