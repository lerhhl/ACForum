class Topic < ApplicationRecord

  belongs_to :user

  attr_accessor :tagstring

  def set_tag_id(tagstring)
    tagstring.downcase!
    tag_arr = tagstring.split("#")
    
    tag_arr.each do |tag|
      if !Tag.exists?(:name => tag)
        cur_tag = Tag.create(:name => tag)
      else
        cur_tag = Tag.find_by(:name => tag)
      end
      TopicTag.create(:topic_id => self.id, :tag_id => cur_tag.id)
    end
  end

end
