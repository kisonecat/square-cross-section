# Square Cross Sections

The file [scene.pov](scene.pov) is a [POVray](http://www.povray.org/) scene which shows off a region built from

  \{ (x,y) \in R^2 : x+1 <= y <= 3-x^2 \}

with square cross sections.

Running `povray [scene.ini](scene.ini)` produces a bunch of PNGs that can be `ffmpeg`ed together into a loopable movie:

[![Animation generated from the scene.ini file](http://img.youtube.com/vi/fBSkNQty0WI/0.jpg)](http://www.youtube.com/watch?v=fBSkNQty0WI "Square cross sections")

To generate an .mp4, I used

```bash
ffmpeg -framerate 30 -i scene%03d.png -c:v libx264 -r 30 -pix_fmt yuv420p out.mp4                                                                                                                   1 ↵
```

To generate a animated .gif, I used

```bash
ffmpeg -i out.mp4 -vf fps=10,scale=320:-1:flags=lanczos,palettegen palette.png                                                                                                                      1 ↵
ffmpeg  -i out.mp4 -i palette.png -filter_complex "fps=10,scale=320:-1:flags=lanczos[x];[x][1:v]paletteuse" output.gif
```
