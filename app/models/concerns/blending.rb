module Blending

  def self.included(base)
    base.class_eval do
      after_save :make_juice if self.to_s == 'Apple'
    end
  end

  def make_juice
    p '----------------------------------------------------------'
    p 'Do coding after save call back for Apple model only'
    p '----------------------------------------------------------'
  end
end