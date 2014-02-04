class AddExperienceReferenceToNotes < ActiveRecord::Migration
  def change
    add_reference :notes, :experience, index: true
  end
end
