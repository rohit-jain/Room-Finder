class Pen < ActiveRecord::Base
  belongs_to :listing
  
  acts_as_gmappable
  def gmaps4rails_address
   "#{name}, #{vicinity}"
  end
  def gmaps4rails_infowindow
  "<h3>Name:#{name}</h3> <h3>Vicinity: #{vicinity} </h3> <a href='#{url}'>View More info</a>"
  end
  def gmaps4rails_marker_picture
    {
   "picture" => "/images/marker.png",
   "width" => "60",
   "height" => "60"
    }
  end
  
end
