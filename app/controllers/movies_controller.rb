class MoviesController < ApplicationController
  
  def index
#@movies = Movie.all
#@movies = Movie.find(:all, :order => params[:sort])
    @title_header, @release_header = nil
    if params[:sort] == "title ASC"
      @title_header = "hilite"
    elsif params[:sort] == "release_date ASC"
      @release_date_header = "hilite"
    end
    @allratings = Movie.getratings
    if @selected_ratings == nil
      @selected_ratings = @allratings
    end

#    if params[:ratings] != nil && params[:sort] == nil
#      @movies = nil
#      @selected_ratings = params[:ratings].keys
#      params[:ratings].keys.each do |rate|
#        mov = Movie.find(:all, :conditions => {:rating => rate} )
#        if @movies == nil
#          @movies = mov
#        else
#          @movies += mov
#        end
#      end
#   end

#    if params[:ratings] != nil
#      @movies = Movie.find_all_by_rating(params[:ratings].keys, :order => params[:sort])
#      @selected_ratings = params[:ratings].keys
##    end
#    else
#      @movies = Movie.find_all_by_rating(@selected_ratings, :order => params[:sort])
#    end
    
    @selected_ratings = @allratings
    if params[:ratings] != nil
      session[:ratings] = params[:ratings].keys
    end
    @selected_ratings = session[:ratings] if session[:rating] != nil
    
    @order = params[:sort]
    session[:ord] = params[:sort] if session[:ord] != nil
    @order = session[:ord] if session[:ord] != nil
    
    
    @movies = Movie.find_all_by_rating(@selected_ratings, :order => @order)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movies = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

#def index
#    @movies = Movie.all
#  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
