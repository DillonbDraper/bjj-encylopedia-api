defmodule BJJ.CategoriesTest do
  use BJJ.DataCase

  alias BJJ.Categories

  describe "positions" do
    alias BJJ.Categories.Position

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def position_fixture(attrs \\ %{}) do
      {:ok, position} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Categories.create_position()

      position
    end

    test "list_positions/0 returns all positions" do
      position = position_fixture()
      assert Categories.list_positions() == [position]
    end

    test "get_position!/1 returns the position with given id" do
      position = position_fixture()
      assert Categories.get_position!(position.id) == position
    end

    test "create_position/1 with valid data creates a position" do
      assert {:ok, %Position{} = position} = Categories.create_position(@valid_attrs)
      assert position.name == "some name"
    end

    test "create_position/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Categories.create_position(@invalid_attrs)
    end

    test "update_position/2 with valid data updates the position" do
      position = position_fixture()
      assert {:ok, %Position{} = position} = Categories.update_position(position, @update_attrs)
      assert position.name == "some updated name"
    end

    test "update_position/2 with invalid data returns error changeset" do
      position = position_fixture()
      assert {:error, %Ecto.Changeset{}} = Categories.update_position(position, @invalid_attrs)
      assert position == Categories.get_position!(position.id)
    end

    test "delete_position/1 deletes the position" do
      position = position_fixture()
      assert {:ok, %Position{}} = Categories.delete_position(position)
      assert_raise Ecto.NoResultsError, fn -> Categories.get_position!(position.id) end
    end

    test "change_position/1 returns a position changeset" do
      position = position_fixture()
      assert %Ecto.Changeset{} = Categories.change_position(position)
    end
  end

  describe "subpositions" do
    alias BJJ.Categories.Subposition

    @valid_attrs %{integer: "some integer", name: "some name", position_id: "some position_id"}
    @update_attrs %{integer: "some updated integer", name: "some updated name", position_id: "some updated position_id"}
    @invalid_attrs %{integer: nil, name: nil, position_id: nil}

    def subposition_fixture(attrs \\ %{}) do
      {:ok, subposition} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Categories.create_subposition()

      subposition
    end

    test "list_subpositions/0 returns all subpositions" do
      subposition = subposition_fixture()
      assert Categories.list_subpositions() == [subposition]
    end

    test "get_subposition!/1 returns the subposition with given id" do
      subposition = subposition_fixture()
      assert Categories.get_subposition!(subposition.id) == subposition
    end

    test "create_subposition/1 with valid data creates a subposition" do
      assert {:ok, %Subposition{} = subposition} = Categories.create_subposition(@valid_attrs)
      assert subposition.integer == "some integer"
      assert subposition.name == "some name"
      assert subposition.position_id == "some position_id"
    end

    test "create_subposition/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Categories.create_subposition(@invalid_attrs)
    end

    test "update_subposition/2 with valid data updates the subposition" do
      subposition = subposition_fixture()
      assert {:ok, %Subposition{} = subposition} = Categories.update_subposition(subposition, @update_attrs)
      assert subposition.integer == "some updated integer"
      assert subposition.name == "some updated name"
      assert subposition.position_id == "some updated position_id"
    end

    test "update_subposition/2 with invalid data returns error changeset" do
      subposition = subposition_fixture()
      assert {:error, %Ecto.Changeset{}} = Categories.update_subposition(subposition, @invalid_attrs)
      assert subposition == Categories.get_subposition!(subposition.id)
    end

    test "delete_subposition/1 deletes the subposition" do
      subposition = subposition_fixture()
      assert {:ok, %Subposition{}} = Categories.delete_subposition(subposition)
      assert_raise Ecto.NoResultsError, fn -> Categories.get_subposition!(subposition.id) end
    end

    test "change_subposition/1 returns a subposition changeset" do
      subposition = subposition_fixture()
      assert %Ecto.Changeset{} = Categories.change_subposition(subposition)
    end
  end

  describe "orientations" do
    alias BJJ.Categories.Orientation

    @valid_attrs %{dominant: true}
    @update_attrs %{dominant: false}
    @invalid_attrs %{dominant: nil}

    def orientation_fixture(attrs \\ %{}) do
      {:ok, orientation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Categories.create_orientation()

      orientation
    end

    test "list_orientations/0 returns all orientations" do
      orientation = orientation_fixture()
      assert Categories.list_orientations() == [orientation]
    end

    test "get_orientation!/1 returns the orientation with given id" do
      orientation = orientation_fixture()
      assert Categories.get_orientation!(orientation.id) == orientation
    end

    test "create_orientation/1 with valid data creates a orientation" do
      assert {:ok, %Orientation{} = orientation} = Categories.create_orientation(@valid_attrs)
      assert orientation.dominant == true
    end

    test "create_orientation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Categories.create_orientation(@invalid_attrs)
    end

    test "update_orientation/2 with valid data updates the orientation" do
      orientation = orientation_fixture()
      assert {:ok, %Orientation{} = orientation} = Categories.update_orientation(orientation, @update_attrs)
      assert orientation.dominant == false
    end

    test "update_orientation/2 with invalid data returns error changeset" do
      orientation = orientation_fixture()
      assert {:error, %Ecto.Changeset{}} = Categories.update_orientation(orientation, @invalid_attrs)
      assert orientation == Categories.get_orientation!(orientation.id)
    end

    test "delete_orientation/1 deletes the orientation" do
      orientation = orientation_fixture()
      assert {:ok, %Orientation{}} = Categories.delete_orientation(orientation)
      assert_raise Ecto.NoResultsError, fn -> Categories.get_orientation!(orientation.id) end
    end

    test "change_orientation/1 returns a orientation changeset" do
      orientation = orientation_fixture()
      assert %Ecto.Changeset{} = Categories.change_orientation(orientation)
    end
  end
end
