class Top50Machine < ApplicationRecord

  self.primary_key = "id"
  belongs_to :top50_object, foreign_key: "id"
  belongs_to :top50_machine_type, foreign_key: "type_id"
  belongs_to :top50_contact, foreign_key: "contact_id"
  belongs_to :top50_organization, foreign_key: "org_id"
  belongs_to :top50_vendor, foreign_key: "vendor_id"
  has_many :top50_benchmark_results, foreign_key: "machine_id"

  before_save do
    if self.new_record? 
      m_typeid = Top50ObjectType.where(name_eng: "Machine").first.id
      obj = Top50Object.new
      obj[:type_id] = m_typeid
      obj[:is_valid] = self.is_valid
      obj[:comment] = format('New machine (%s)', self.comment)
      obj.save!
      self.id = obj.id
    end
    if self.is_valid != self.top50_object.is_valid
      self.top50_object.update(is_valid: self.is_valid)
    end
    # if self.vendor_id.present?
    #  self.vendor_ids = ([self.vendor_id] + self.vendor_ids).uniq
    # end
  end

  before_destroy do
    Top50BenchmarkResult.where(machine_id: self.id).destroy_all
    obj = Top50Object.find(self.id)
    obj.destroy!
  end

  def vendors
    res = []
    if self.vendor_ids.present?
      vendor_ids.each do |vid|
        res.append(Top50Vendor.find(vid))
      end
      return res
    end
  end

  def confirm
    if self.is_valid != 1
      self.is_valid = 1
      self.save
    end
    self.top50_benchmark_results.each do |r|
      r.confirm
    end
    if self.top50_contact.present?
      self.top50_contact.confirm
    end
    self.top50_object.confirm
  end

  # validates :cond, acceptance: { message: 'Для подачи заявки необходимо подтвердить согласие на обработку данных.' }
end
