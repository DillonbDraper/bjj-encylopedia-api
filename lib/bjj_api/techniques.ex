defmodule BJJ.Techniques do
  @moduledoc """
  The Techniques context.
  """

  import Ecto.Query, warn: false
  alias BJJ.Repo

  alias BJJ.Techniques.Technique

  @doc """
  Returns the list of techniques.

  ## Examples

      iex> list_techniques()
      [%Technique{}, ...]

  """
  def list_techniques do
    Repo.all(Technique)
  end

  def list_techniques_with_params(params) do
    Technique
    |> position_filter(params)
    |> subposition_filter(params)
    |> orientation_filter(params)
    |> Repo.all()

  end

    defp position_filter(query, opts) do
    case Map.fetch(opts, :position) do
      {:ok, position} ->
        position_int = String.to_integer(position)
        where(query, [t], t.position_id == ^position_int)
      :error ->
        query
     end
  end

  defp subposition_filter(query, opts) do
    case Map.fetch(opts, :subposition) do
      {:ok, subposition} ->
        subposition_int = String.to_integer(subposition)

        where(query, [t], t.subposition_id == ^subposition_int)
      :error ->
        query
     end
  end

  defp orientation_filter(query, opts) do
    case Map.fetch(opts, :orientation) do
      {:ok, orientation} ->
        orientation_int = String.to_integer(orientation)
        where(query, [t], t.orientation_id == ^orientation_int)
      :error ->
        query
     end
  end



  @doc """
  Gets a single technique.

  Raises `Ecto.NoResultsError` if the Technique does not exist.

  ## Examples

      iex> get_technique!(123)
      %Technique{}

      iex> get_technique!(456)
      ** (Ecto.NoResultsError)

  """
  def get_technique!(id), do: Repo.get!(Technique, id)

  @doc """
  Creates a technique.

  ## Examples

      iex> create_technique(%{field: value})
      {:ok, %Technique{}}

      iex> create_technique(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_technique(attrs \\ %{}) do
    %Technique{}
    |> Technique.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a technique.

  ## Examples

      iex> update_technique(technique, %{field: new_value})
      {:ok, %Technique{}}

      iex> update_technique(technique, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_technique(%Technique{} = technique, attrs) do
    technique
    |> Technique.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a technique.

  ## Examples

      iex> delete_technique(technique)
      {:ok, %Technique{}}

      iex> delete_technique(technique)
      {:error, %Ecto.Changeset{}}

  """
  def delete_technique(%Technique{} = technique) do
    Repo.delete(technique)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking technique changes.

  ## Examples

      iex> change_technique(technique)
      %Ecto.Changeset{data: %Technique{}}

  """
  def change_technique(%Technique{} = technique, attrs \\ %{}) do
    Technique.changeset(technique, attrs)
  end
end
