module StatsHelper
  def mean
    (self.sum/self.length).round(3)
  end

  def sample_variance
    m = self.mean
    sum = self.inject(0){|accum, i| accum +(i-m)**2 }
    sum/(self.length - 1)
  end

  def standard_deviation
    (Math.sqrt(self.sample_variance)).round(3)
  end

  def median
    sorted = self.sort
    len = sorted.length
    (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
  end
end
