class Shipment < ApplicationRecord
  validate :volume_limits

  def volume
    height * width * depth
  end

  def density
    weight / volume
  end

  private

  def volume_limits
    if volume > 4000
      errors.add(:volume, "cannot be above 400 cubic inches")
    elsif volume < 20
      errors.add(:volume, "cannot be below 20 cubic inches")
    end
  end
end
