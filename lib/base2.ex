defmodule Base2 do
   import Exray.Core.Window

  import Exray.Core.Drawing
  import Exray.Core.Timing
  alias Exray.Shapes.Basic
  alias Exray.Textures.Texture.Drawing
  alias Exray.Text.Drawing, as: T



  def run(width \\ 800, height \\ 800, title \\ "Hello World!") do
    init_window(width, height, title)
    file_name = "test.png"
    texture = Exray.Textures.Texture.Loading.load_texture(file_name)

    # <-- SUPER important! Call this just after you init_window, or segfaults are gonna happen a lot.
    set_target_fps(60)
    main_loop(texture)

    # As another layer of safety, if for some reason our window *didn't* close, we can do it here in this check.
    if window_should_close?() do
      close_window()
    end

    # :ok, because we're :ok :)
    :ok
  end

  defp main_loop(texture) do
    unless window_is_ready?(), do: main_loop(texture)

    unless window_should_close?() do
      update()
      draw(texture)
      main_loop(texture)
    end
  end

  defp update() do

  end

  defp draw(texture) do
    clear_background(Exray.Utils.Colors.black())
    begin_drawing()

    # centerX = 100
    # centerY = 100
    # radius = 100.0
    # center = Exray.Structs.Vector2.new(100.0, 100.0)
    color = Exray.Utils.Colors.lime()
    # color1 = Exray.Utils.Colors.lime()
    # color2 = Exray.Utils.Colors.yellow()
    tint = Exray.Utils.Colors.white()
    pos_x = 100
    pos_y = 100
    text = "test"
    font_size = 20
    # start_angle = 10.0
    # end_angle = 90.0
    # segments = 0

    # 色を塗った円を描く
    # Basic.draw_circle(100, 100, 100.0, Exray.Utils.Colors.lime)

    # グラデーションで塗りつぶされた円を描く
    # Basic.draw_circle_gradient(centerX, centerY, radius, color1, color2)

    # 円の輪郭を描く
    # Basic.draw_circle_lines(centerX, centerY, radius, color)

    # 円のアウトラインを描く（ベクター版）
    # Basic.draw_circle_lines_v(center, radius, color)

    # 円の一部を描く
    # Basic.draw_circle_sector(center, radius, start_angle, end_angle, segments, color)

    # 押された文字（Unicode）を取得し、キューに入れられた文字に対して複数回呼び出し、キューが空の場合は 0 を返します
    # Keyboard.get_char_pressed()
    # |> IO.inspect()

    Drawing.draw_texture(texture, pos_x, pos_y, tint)
    # T.draw_fps(pos_x, pos_y)
    T.draw_text(text, pos_x, pos_y, font_size, color)


    end_drawing()
  end
end
