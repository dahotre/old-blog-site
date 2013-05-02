class CitationValidator < ActiveModel::Validator
  def validate(record)
    if record.rambling_id == nil && record.programming_id == nil
      record.errors[:base] << "Both node ids are nil"
    elsif record.rambling_id != nil && record.programming_id != nil
      record.errors[:base] << "At least 1 node id shd be nil"
    end
  end
end