defmodule BJJWeb.VideoController do
  use BJJWeb, :controller

  alias BJJ.Videos
  alias BJJ.Videos.Video

  action_fallback BJJWeb.FallbackController

  def index(conn, _params) do
    IO.inspect(conn)
    query_params = conn.query_params

    if query_params == %{} do

    videos = Videos.list_videos()
    render(conn, "index.json", videos: videos)

    else
      final_params = Map.new(query_params, fn {k, v} -> {String.to_atom(k), v} end)

      videos = Videos.list_videos_by_techniques(final_params)
      render(conn, "index.json", videos: videos)
    end
  end

  def create(conn, %{"video" => video_params}) do
    with {:ok, %Video{} = video} <- Videos.create_video(video_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.video_path(conn, :show, video))
      |> render("show.json", video: video)
    end
  end

  def show(conn, %{"id" => id}) do
    video = Videos.get_video!(id)
    render(conn, "show.json", video: video)
  end

  def update(conn, %{"id" => id, "video" => video_params}) do
    video = Videos.get_video!(id)

    with {:ok, %Video{} = video} <- Videos.update_video(video, video_params) do
      render(conn, "show.json", video: video)
    end
  end

  def delete(conn, %{"id" => id}) do
    video = Videos.get_video!(id)

    with {:ok, %Video{}} <- Videos.delete_video(video) do
      send_resp(conn, :no_content, "")
    end
  end
end
