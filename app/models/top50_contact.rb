class Top50Contact < ApplicationRecord
  self.primary_key = "id"
  belongs_to :top50_object, foreign_key: "id"
  has_many :top50_machines, foreign_key: "contact_id"

  validates :name, :surname, presence: true

  def full_name
    "#{name} #{surname}"
  end
  def full_name_eng
    "#{name_eng} #{surname_eng}"
  end
  
  before_save do
    if self.new_record? 
      c_typeid = Top50ObjectType.where(name_eng: "Contact").first.id
      obj = Top50Object.new
      obj[:type_id] = c_typeid
      obj[:is_valid] = self.is_valid
      obj[:comment] = format('New contact (%s)', self.comment)
      obj.save!
      self.id = obj.id
    end
    if self.is_valid != self.top50_object.is_valid
      self.top50_object.update(is_valid: self.is_valid)
    end
  end

  before_destroy do
    obj = Top50Object.find(self.id)
    obj.destroy!
  end

  def confirm
    if self.is_valid != 1
      self.is_valid = 1
      self.save
    end
    self.top50_object.confirm
  end

end
