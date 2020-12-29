# gallery.rb
class Gallery < ApplicationRecord
  # attr_accessible :name,
  #                 :painting_ids
  has_many :paintings

  def painting_ids=(ids)
    unless (ids = ids.map(&:to_i).select{|i|i>0}) == (current_ids = paintings.map(&:id))
      (current_ids - ids).each {|id| paintings.detect{|p|p.id == id}.mark_for_destruction}
      self.paintings = ids.each_with_index.map do |id, index|
        painting = Painting.find(id)
        painting.position = (index + 1)
        painting.save!
        painting
      end
      reload
      painting_ids
    end
  end
end
