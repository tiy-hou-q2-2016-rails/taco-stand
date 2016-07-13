class Menu < ActiveRecord::Base

  validates :name, presence: true
  validates :pdf_file, presence: true

  attachment :pdf_file, extension: "pdf"
end
