# gallery.rb
class Gallery < ActiveRecord::Base
  attr_accessible :name
  has_many :paintings, :order => 'created_at'
end
