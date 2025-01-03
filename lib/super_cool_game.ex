defmodule SuperCoolGame do

  # We import Exray.Core.Window, like we did in IEX.
  import Exray.Core.Window
  # But, we also import Exray.Core.Drawing, to have access to begin_draw() and end_draw() calls.
  # This is to poll for window_should_close?() events, as without end_draw() no inputs will be polled at all.
  import Exray.Core.Drawing
  # We also need to import Exray.Core.Timing in order to set our FPS. This is VERY important.
  import Exray.Core.Timing
  alias Exray.Shapes.Basic

  def run(width \\ 800, height \\ 800, title \\ "Hello World!") do
    init_window(width, height, title)
    set_target_fps(60) # <-- SUPER important! Call this just after you init_window, or segfaults are gonna happen a lot.
    main_loop()

    # As another layer of safety, if for some reason our window *didn't* close, we can do it here in this check.
    if window_should_close?() do
      close_window()
    end

    :ok # :ok, because we're :ok :)
  end

  defp main_loop() do

    # Stay out of update and draw unless our window is ready to update and draw.
    unless window_is_ready?(), do: main_loop()

    # If at any point we press Raylib's default "Quit Application" key, (ESCAPE), stop looping and exit.
    unless window_should_close?() do
      update()
      draw()
      main_loop()
    end
  end

  defp update() do
    # Nothing yet!
  end

  defp draw() do
    # Before drawing, we'll clear the background with the Exray.Utils.Colors.black function result- Which is %Exray.Structs.Color{r: 0, g: 0, b: 0, a: 255}.
    clear_background(Exray.Utils.Colors.black())
    begin_drawing()

    # 色を塗った円を描く
    centerX = 100
    centerY = 100
    radius = 100.0
    color1 = Exray.Utils.Colors.lime()
    color2 = Exray.Utils.Colors.yellow()
    # Basic.draw_circle(100, 100, 100.0, Exray.Utils.Colors.lime)

    # グラデーションで塗りつぶされた円を描く
    Basic.draw_circle_gradient(centerX, centerY, radius, color1, color2)

    end_drawing()
  end

end
