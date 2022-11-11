# frozen_string_literal: true

class LineItemDate < ApplicationRecord
  scope :ordered, -> { order(date: :asc) }

  belongs_to :quote

  validates :date, presence: true, uniqueness: { scope: :quote_id }

  def previous_date
    quote.line_item_dates.ordered.where("date < ?", date).last
  end
end
