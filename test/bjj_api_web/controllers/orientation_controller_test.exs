defmodule BJJWeb.OrientationControllerTest do
  use BJJWeb.ConnCase

  alias BJJ.Categories
  alias BJJ.Categories.Orientation

  @create_attrs %{
    dominant: true
  }
  @update_attrs %{
    dominant: false
  }
  @invalid_attrs %{dominant: nil}

  def fixture(:orientation) do
    {:ok, orientation} = Categories.create_orientation(@create_attrs)
    orientation
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all orientations", %{conn: conn} do
      conn = get(conn, Routes.orientation_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create orientation" do
    test "renders orientation when data is valid", %{conn: conn} do
      conn = post(conn, Routes.orientation_path(conn, :create), orientation: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.orientation_path(conn, :show, id))

      assert %{
               "id" => id,
               "dominant" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.orientation_path(conn, :create), orientation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update orientation" do
    setup [:create_orientation]

    test "renders orientation when data is valid", %{conn: conn, orientation: %Orientation{id: id} = orientation} do
      conn = put(conn, Routes.orientation_path(conn, :update, orientation), orientation: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.orientation_path(conn, :show, id))

      assert %{
               "id" => id,
               "dominant" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, orientation: orientation} do
      conn = put(conn, Routes.orientation_path(conn, :update, orientation), orientation: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete orientation" do
    setup [:create_orientation]

    test "deletes chosen orientation", %{conn: conn, orientation: orientation} do
      conn = delete(conn, Routes.orientation_path(conn, :delete, orientation))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.orientation_path(conn, :show, orientation))
      end
    end
  end

  defp create_orientation(_) do
    orientation = fixture(:orientation)
    %{orientation: orientation}
  end
end
