class Search
  include ActiveModel::Conversion
  attr_reader :term

  def initialize(options = {})
    @term = options[:term] || ""
  end

  def users
    User.where("lower(name) LIKE ?", "%#{@term.downcase}%")
  end

end