class CreateAssignmentsTable < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :location
      t.belongs_to :people
      t.string :role, null: false
    end
  end
end
