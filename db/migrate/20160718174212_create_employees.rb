class CreateEmployees < ActiveRecord::Migration
  def change
    create_table(:employees) do |t|
      t.column(:name, :varchar)
      t.column(:division_id, :int)

      t.timestamps()
    end
  end
end
