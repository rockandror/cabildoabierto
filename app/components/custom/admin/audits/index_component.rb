class Admin::Audits::IndexComponent < ApplicationComponent
  attr_reader :audits

  def initialize(audits:)
    @audits = audits
  end

  def empty_database?
    Audit.none?
  end

  def empty_search?
    audits.none? && params[:search].present?
  end
end
