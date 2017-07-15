module A
  def self.a
    return 1, self
  end
end

x = A.a[0]
print "     " << '10'