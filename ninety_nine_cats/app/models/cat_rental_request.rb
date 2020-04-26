# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#
class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: { in: %W(PENDING APPROVED DENIED) }
  validate(:does_not_overlap_approved_request)

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors[:request] << "There is an overlapping approved request"
    end
  end

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    CatRentalRequest
      .joins(:cats)
      .where('cats.id = ?', self.cat_id)
      .where.not('cat_rental_requests.start_date > ?', self.end_date)
      .where.not('cat_rental_requests.end_date < ?', self.start_date)
      .where.not('cat_rental_requests.id = ?', self.id)
  end

  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end

  def overlapping_pending_requests
    overlapping_requests.where("status = 'PENDING'")
  end

  def approve!
    self.status = "APPROVED"
    self.save!

    self.deny!
  end

  def deny!
    overlapping_pending_requests.transaction do
      overlapping_pending_requests.each do |request|
        request.status = "DENIED"
        request.save!
      end
    end
  end
end
