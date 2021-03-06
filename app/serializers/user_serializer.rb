class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :email, :first_name, :last_name, :email_digest

  def email_digest
    Digest::MD5.hexdigest object.email
  end

end
