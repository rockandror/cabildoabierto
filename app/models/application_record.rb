class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include Auditable
  include HumanName
  include SkipValidation

  def self.sample(count = 1)
    if count == 1
      reorder(Arel.sql("RANDOM()")).first
    else
      reorder(Arel.sql("RANDOM()")).limit(count)
    end
  end
end
