class ListingsController < ApplicationController 
  # GET /listings
  # GET /listings.json
  def index
    if session[:user_id]
    @listings = Listing.all
    @json = Listing.all.to_gmaps4rails
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @listings }
    end
    else   redirect_to "/log_in", :notice => "You need to be logged in for viewing list"
  end
  end
  

   def apply
    @listing = Listing.find(params[:id])
    @listing.intcount=@listing.intcount+1
    @tip=Tip.new
    @tip.listing_id=@listing.id
     @tip.user_id= session[:user_id]
    @listing.save
      if @tip.save 
               redirect_to "/listings/", :notice => "Successfully Applied"
            else
      redirect_to "/listings/", :notice => "Sorry!!! Failed to Apply"
       end
    
   end
  # GET /listings/1
  # GET /listings/1.json
  def show
    @listing = Listing.find(params[:id])
    @user=User.all
    @tip= @listing.tips
    @vv=@listing.pens   
    @json=@vv.all.to_gmaps4rails;
  end
   
  # GET /listings/new
  # GET /listings/new.json
  def new
     if session[:user_id]
     @listing = Listing.new
     # @listing[:u_id]=session[:user_id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @listing }
    end
    else
      redirect_to "/log_in", :notice => "You need to be logged in for viewing list"
    end
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:id])
  end

  # POST /listings
  # POST /listings.json
  def create
      @listing = Listing.new(params[:listing])
      @listing.user_id= session[:user_id]
      respond_to do |format|
          if @listing.save
            @client = GooglePlaces::Client.new('AIzaSyCzlX9Hndc6BZlHpLVkk8S_xRGOsnA_cJ4')
            @arr=[@listing.latitude, @listing.longitude]
            @vv=@client.spots(@arr[0], @arr[1])
                  @vv.each do |t|
                  @pn= Pen.new
                  @pn.latitude=t.lat
                  @pn.longitude=t.lng
                  @pn.vicinity=t.vicinity
                  @pn.name=t.name
                  @pn.icon=t.icon
                  @pn.url=t.url
                  @pn.types=t.types.join(",")
                  @pn.listing_id=@listing.id
                  @pn.save
             end # for end
          redirect_to "/listings//", :notice => "New list successfully created"
        else
          format.html { render action: "new" }
          format.json { render json: @listing.errors, status: :unprocessable_entity }
        end # commond end for if {statements} else {statements}  end
    end  #respond do
  end # create

  # PUT /listings/1.json
  def update
    @listing = Listing.find(params[:id])

    respond_to do |format|
      if @listing.update_attributes(params[:listing])
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy    
    redirect_to "/log_out", :notice => "Fu"
     end

end
