class Question < ActiveRecord::Base
  has_many :options, :dependent => :destroy
  accepts_nested_attributes_for :options, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
