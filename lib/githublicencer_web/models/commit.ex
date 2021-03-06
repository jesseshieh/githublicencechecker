defmodule GithublicencerWeb.Commit do
  use GithublicencerWeb, :model

  schema "commits" do
    field :sha, :string

    timestamps()

		belongs_to :commiter, GithublicencerWeb.Commiter
		belongs_to :github_repo, GithublicencerWeb.GithubRepo
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:sha, :commiter_id, :github_repo_id])
	  |> validate_required([:sha, :commiter_id])
		|> unique_constraint(:sha)
  end

end
