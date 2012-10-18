class MoviesController < ApplicationController
  
  def index
#@movies = Movie.all
@movies = Movie.find(:all, :order => params[:sort])
    @title_header, @release_header = nil
    if params[:sort] == "title ASC"
      @title_header = "hilite"
    elsif params[:sort] == "release_date ASC"
      @release_date_header = "hilite"
    end
    @allratings = Movie.getratings
    @selected_ratings = @allratings


#session[:ratings] = params[:ratings].keys if params[:ratings] != nil
#session[:sort] = params[:sort] if params[:sort] != nil || params[:sort] != ""
#@selected_ratings = session[:ratings]
#@movies = Movie.find_all_by_rating(session[:ratings], :order => session[:sort])

#    if params[:ratings] != nil
#      @movies = Movie.find_all_by_rating(params[:ratings].keys, :order => params[:sort])
#      session[:ratings] = params[:ratings].keys
#      @selected_ratings = session[:ratings]
#      session[:sort] = params[:sort]
#    elsif
#      @movies = Movie.find_all_by_rating(session[:ratings], :order => session[:sort])
#    end
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
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
