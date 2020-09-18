Hanami::Model.migration do
  change do
    alter_table :attachments do
      add_foreign_key(:issue_id, :issues)
    end
  end
end
