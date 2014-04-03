class Post < ActiveRecord::Base
  #validates_presence_of :title, :content

  validates :title, :presence => true, :length => { :minimum => 4 }
  validates :content, :desc, :presence => true

end
