Hanami::Model.migration do
  change do
    create_table :issues do
      primary_key :id
      String :title, null: false
      String :description, null: true
      String :type, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
