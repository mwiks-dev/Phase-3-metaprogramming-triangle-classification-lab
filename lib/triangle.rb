class Triangle
  # write code here
  attr_accessor :s1,:s2, :s3
  def initialize(s1,s2,s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
  end

  def kind
    validate_triangle
    if s1 == s2 && s2 == s3
      :equilateral
    elsif s1 == s2 || s2 == s3 || s1 == s3
      :isosceles
    elsif s1 != s2 || s2 != s3 || s1 != s3
      :scalene
    end
  end

  def positive_sides_not_zero
    [s1,s2,s3].all?(&:positive?)
  end

  def triangle_inequality
    s1 + s2 > s3 && s1 + s3 > s2 && s2 + s3 > s1
  end

  class TriangleError < StandardError
  end

  def validate_triangle
    raise TriangleError unless positive_sides_not_zero && triangle_inequality
  end
end
