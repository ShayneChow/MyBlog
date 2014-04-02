class Post < ActiveRecord::Base
  #validates_presence_of :title, :content

  validates :title, :presence => true, :length => { :minimum => 5 }
  validates :content, :desc, :presence => true

end
