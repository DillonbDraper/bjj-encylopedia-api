defmodule BJJWeb.SubpositionControllerTest do
  use BJJWeb.ConnCase

  alias BJJ.Categories
  alias BJJ.Categories.Subposition

  @create_attrs %{
    integer: "some integer",
    name: "some name",
    position_id: "some position_id"
  }
  @update_attrs %{
    integer: "some updated integer",
    name: "some updated name",
    position_id: "some updated position_id"
  }
  @invalid_attrs %{integer: nil, name: nil, position_id: nil}

  def fixture(:subposition) do
    {:ok, subposition} = Categories.create_subposition(@create_attrs)
    subposition
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all subpositions", %{conn: conn} do
      conn = get(conn, Routes.subposition_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create subposition" do
    test "renders subposition when data is valid", %{conn: conn} do
      conn = post(conn, Routes.subposition_path(conn, :create), subposition: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.subposition_path(conn, :show, id))

      assert %{
               "id" => id,
               "integer" => "some integer",
               "name" => "some name",
               "position_id" => "some position_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.subposition_path(conn, :create), subposition: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update subposition" do
    setup [:create_subposition]

    test "renders subposition when data is valid", %{conn: conn, subposition: %Subposition{id: id} = subposition} do
      conn = put(conn, Routes.subposition_path(conn, :update, subposition), subposition: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.subposition_path(conn, :show, id))

      assert %{
               "id" => id,
               "integer" => "some updated integer",
               "name" => "some updated name",
               "position_id" => "some updated position_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, subposition: subposition} do
      conn = put(conn, Routes.subposition_path(conn, :update, subposition), subposition: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete subposition" do
    setup [:create_subposition]

    test "deletes chosen subposition", %{conn: conn, subposition: subposition} do
      conn = delete(conn, Routes.subposition_path(conn, :delete, subposition))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.subposition_path(conn, :show, subposition))
      end
    end
  end

  defp create_subposition(_) do
    subposition = fixture(:subposition)
    %{subposition: subposition}
  end
end
