class BooksController < ApplicationController
  def index
      @books = Book.all
  end
  def new
      @book = Book.new
  end

  def show
      @book = Book.find(params[:id])
  end

  def add_spell
      @book = Book.find(params[:id])
  end

  def destroy
      @book = Book.find(params[:id])  
    if @book.destroy
        flash[:notice] = "Successfully deleted #{@book.name}"        
    else
        flash[:notice] = "Unable to delete #{@book.name}."
    end
    redirect_to books_url  
  end

  def create
      @book = Book.new(book_params)

    if @book.save
      flash[:notice] = "Successfully added #{@book.name} to All Books "
      redirect_to books_path
    else
      render :new
    end
  end
  
  #Need to work on this 
  def remove_spell
      @book = Book.find(params[:id])
      spell_id = params[:removed_spell_id]
    if @book.spells.delete (Spell.find(spell_id))
        flash[:notice] = 'Spell was successfully removed.'        
    else
        flash[:notice] = 'Unable to remove spell.'
    end
    render :show        
  end

  def add
      @book = Book.find(params[:id])
      spell_id = params[:added_spell_id]
      @book.spells << Spell.find(spell_id)
        flash[:notice] = "Successfully added #{Spell.find(spell_id).name} to #{@book.name}"
        redirect_to book_path(@book)
  end
    
  private
    # Only allow a trusted parameter "white list" through.
    def book_params
      # params is a hashtable.  It should have in it a key of :author.
      # The value for the :author key is another hash.
      # If params does not contain the key :author, an exception is raised.  
      # Only the "author" hash is returned and only with the permitted key(s).
      params.require(:book).permit(:name)
    end

end
