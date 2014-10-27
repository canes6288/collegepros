class Player < ActiveRecord::Base
  def self.school_names
    pluck(:school).uniq.reject(&:empty?)
  end
end
