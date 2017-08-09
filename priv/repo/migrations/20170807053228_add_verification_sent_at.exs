defmodule Hexpm.Repo.Migrations.AddVerificationSentAt do
  use Ecto.Migration

  def up do
    alter table(:emails) do
      add :verification_sent_at, :naive_datetime, usec: true
    end
  end

  def down do
    alter table(:emails) do
      drop :verification_sent_at
    end
  end
end
