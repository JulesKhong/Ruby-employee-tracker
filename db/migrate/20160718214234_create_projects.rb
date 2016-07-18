class CreateProjects < ActiveRecord::Migration
  def change
    create_table(:projects) do |t|
      t.column(:name, :varchar)

      t.timestamps()
    end
    add_column(:employees, :project_id, :integer)
  end
end
