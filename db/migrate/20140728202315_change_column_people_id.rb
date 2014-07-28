class ChangeColumnPeopleId < ActiveRecord::Migration
  def change
    rename_column :assignments, :people_id, :person_id
  end
end
