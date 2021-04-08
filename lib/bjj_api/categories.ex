defmodule BJJ.Categories do
  @moduledoc """
  The Categories context.
  """

  import Ecto.Query, warn: false
  alias BJJ.Repo

  alias BJJ.Categories.Position

  @doc """
  Returns the list of positions.

  ## Examples

      iex> list_positions()
      [%Position{}, ...]

  """
  def list_positions do
    Repo.all(Position)
  end

  @doc """
  Gets a single position.

  Raises `Ecto.NoResultsError` if the Position does not exist.

  ## Examples

      iex> get_position!(123)
      %Position{}

      iex> get_position!(456)
      ** (Ecto.NoResultsError)

  """
  def get_position!(id), do: Repo.get!(Position, id)

  @doc """
  Creates a position.

  ## Examples

      iex> create_position(%{field: value})
      {:ok, %Position{}}

      iex> create_position(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_position(attrs \\ %{}) do
    %Position{}
    |> Position.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a position.

  ## Examples

      iex> update_position(position, %{field: new_value})
      {:ok, %Position{}}

      iex> update_position(position, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_position(%Position{} = position, attrs) do
    position
    |> Position.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a position.

  ## Examples

      iex> delete_position(position)
      {:ok, %Position{}}

      iex> delete_position(position)
      {:error, %Ecto.Changeset{}}

  """
  def delete_position(%Position{} = position) do
    Repo.delete(position)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking position changes.

  ## Examples

      iex> change_position(position)
      %Ecto.Changeset{data: %Position{}}

  """
  def change_position(%Position{} = position, attrs \\ %{}) do
    Position.changeset(position, attrs)
  end

  alias BJJ.Categories.Subposition

  @doc """
  Returns the list of subpositions.

  ## Examples

      iex> list_subpositions()
      [%Subposition{}, ...]

  """
  def list_subpositions do
    Repo.all(Subposition)
    |> Repo.preload([:position])
  end

  @doc """
  Gets a single subposition.

  Raises `Ecto.NoResultsError` if the Subposition does not exist.

  ## Examples

      iex> get_subposition!(123)
      %Subposition{}

      iex> get_subposition!(456)
      ** (Ecto.NoResultsError)

  """
  def get_subposition!(id) do
    Repo.get!(Subposition, id)
  end
  @doc """
  Creates a subposition.

  ## Examples

      iex> create_subposition(%{field: value})
      {:ok, %Subposition{}}

      iex> create_subposition(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_subposition(attrs \\ %{}) do
    %Subposition{}
    |> Subposition.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a subposition.

  ## Examples

      iex> update_subposition(subposition, %{field: new_value})
      {:ok, %Subposition{}}

      iex> update_subposition(subposition, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_subposition(%Subposition{} = subposition, attrs) do
    subposition
    |> Subposition.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a subposition.

  ## Examples

      iex> delete_subposition(subposition)
      {:ok, %Subposition{}}

      iex> delete_subposition(subposition)
      {:error, %Ecto.Changeset{}}

  """
  def delete_subposition(%Subposition{} = subposition) do
    Repo.delete(subposition)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking subposition changes.

  ## Examples

      iex> change_subposition(subposition)
      %Ecto.Changeset{data: %Subposition{}}

  """
  def change_subposition(%Subposition{} = subposition, attrs \\ %{}) do
    Subposition.changeset(subposition, attrs)
  end
end
