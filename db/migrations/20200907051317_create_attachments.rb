Hanami::Model.migration do
  change do
    create_table :attachments do
      primary_key :id
      String :file_data, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end