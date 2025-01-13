defmodule SuperCoolGame do
  # We import Exray.Core.Window, like we did in IEX.
  import Exray.Core.Window
  # But, we also import Exray.Core.Drawing, to have access to begin_draw() and end_draw() calls.
  # This is to poll for window_should_close?() events, as without end_draw() no inputs will be polled at all.
  import Exray.Core.Drawing
  # We also need to import Exray.Core.Timing in order to set our FPS. This is VERY important.
  import Exray.Core.Timing
  alias Exray.Shapes.Basic
  # alias Exray.Core.Input.Keyboard
  alias Exray.Textures.Texture.Drawing
  alias Exray.Core.Input.Mouse
  alias Exray.Text.Drawing, as: T
  alias Exray.Shapes.Spline

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
    # Stay out of update and draw unless our window is ready to update and draw.
    unless window_is_ready?(), do: main_loop(texture)

    # If at any point we press Raylib's default "Quit Application" key, (ESCAPE), stop looping and exit.
    unless window_should_close?() do
      update()
      draw(texture)
      main_loop(texture)
    end
  end

  defp update() do
    # Nothing yet!
  end

  defp draw(texture) do
    # https://hexdocs.pm/exray/readme.html

    # Before drawing, we'll clear the background with the Exray.Utils.Colors.black function result- Which is %Exray.Structs.Color{r: 0, g: 0, b: 0, a: 255}.
    clear_background(Exray.Utils.Colors.black())
    begin_drawing()

    text = "test"
    font_size = 20

    centerX = 100
    centerY = 100
    radius = 100.0
    center = Exray.Structs.Vector2.new(100.0, 100.0)
    points = Exray.Structs.Vector2.new(100.0, 100.0)
    color = Exray.Utils.Colors.lime()
    color1 = Exray.Utils.Colors.lime()
    color2 = Exray.Utils.Colors.yellow()
    tint = Exray.Utils.Colors.white()
    pos_x = 100
    pos_y = 100
    thick = 0.1
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

    # ピクセルを描く
    # Basic.draw_pixel(pos_x, pos_y, color)

    # 押された文字（Unicode）を取得し、キューに入れられた文字に対して複数回呼び出し、キューが空の場合は 0 を返します
    # Keyboard.get_char_pressed()
    # |> IO.inspect()

    # Drawing.draw_texture(texture, pos_x, pos_y, tint)
    # Mouse.get_mouse_y()
    # |> IO.inspect()

    # フォント一覧コマンド
    # $ fc-list

    # 動作しなかった
    # f_file_name = "/usr/share/fonts/truetype/droid/DroidSansFallbackFull.ttf"
    # font = Exray.Text.Loading.load_font(f_file_name)
    # position = Exray.Structs.Vector2.new(100.0, 100.0)
    # spacing = 1.0
    # T.draw_text_ex(font, text, position, font_size, spacing, tint)

    # 動作しなかった
    # inner_radius = 1.0
    # outer_radius = 1.5
    # start_angle = 1.0
    # end_angle = 1.5
    # segments = 1
    # Basic.draw_ring(center, inner_radius, outer_radius, start_angle, end_angle, segments, color)

    # 動作しなかった
    #Spline.draw_spline_basis(points, thick, color)

    # min = 10
    # max = 20
    # Exray.Core.Random.get_random_value(min, max)
    # |> IO.inspect()

    # 垂直グラデーションの四角形を描く
    #width = 100
    #height = 100
    #Basic.draw_rectangle_gradient_v(pos_x, pos_y, width, height, color1, color2)

    sides = 5
    rotation = 1.0

    # 正多角形を描く（ベクター版）
    Basic.draw_poly(center, sides, radius, rotation, color)

    end_drawing()
  end
end
