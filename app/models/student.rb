
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
 def self.search(query)
    if query == ""
      self.all
    else
      self.all.select{|s| s.name.downcase.include?(query.downcase)}
    end
  end

end
