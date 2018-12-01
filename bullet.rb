require 'gosu'
class Bullet
  SPEED = 10.0
  attr_reader :x, :y, :radius
  def initialize(window,x,y,angle)
    @x = x
    @y = y
    @direction = angle
    @radius = 12
    @window = window
    @image = Gosu::Image.new('SPRITES/bullet.png')
  end

  def move
    @x += Gosu.offset_x(@direction.to_f,SPEED)
    @y += Gosu.offset_y(@direction.to_f,SPEED)
  end

  def draw
    @image.draw(@x- @radius , @y- @radius,1)
  end

  def onscreen?
    right = @window.width + @radius
    left = -@radius
    top = -@radius
    bottom = @window.height + @radius
    @x >left and @x<right and @y> top and @y<bottom
  end
end