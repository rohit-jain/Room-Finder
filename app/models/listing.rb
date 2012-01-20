class Listing < ActiveRecord::Base
  has_many :tips
  has_many :pens
acts_as_gmappable :msg => "Sorry, not even Google could figure out where that is"

def gmaps4rails_address
  address
end

def gmaps4rails_infowindow
  "<h3>Address : #{address} </h3>   <h3>Rent : #{rent}</h3> <h3> Rooms: #{rooms} </h3>  <h3> Interested Users: #{intcount} </h3> <br /> <a href='/listings/apply/#{id}'>Apply</a> <br /><h3><a href='/users/#{user_id}/all' >Contact Owner</a> "
end

  def gmaps4rails_marker_picture
    {
   "picture" => "/images/home.png",
   "width" => "32",
   "height" => "32"
   
    } 
  end
end
