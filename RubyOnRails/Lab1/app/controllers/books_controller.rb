class BooksController < ApplicationController

  http_basic_authenticate_with name: "Mariam", password: "Mariam", except: [:index, :show]

  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.admin_id =  Admin.find_by(name: authenticated_username).id
    @book.image=save_image_locally(params[:book][:image], @book.id)
    if @book.save
      redirect_to @book

    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    
    # Remove old image if present
    remove_old_image(@book)
    
    # Update book attributes
    @book.assign_attributes(book_params)
    
    # Save new image if provided
    if params[:book][:image].present?
      @book.image = save_image_locally(params[:book][:image], @book.id)
    end
    
    if @book.save
      redirect_to @book
    else
      render :edit, status: :unprocessable_entity
    end
  end
  

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def save_image_locally(uploaded_image, book_id)
    image_name = "#{book_id}_#{uploaded_image.original_filename}"
    image_path = Rails.root.join('public', 'uploads', image_name)
    Rails.logger.info(image_path)
    File.open(image_path, 'wb') do |file|
      file.write(uploaded_image.read)
    end
    image_name
  end

  private
  def remove_old_image(book)
    old_image_path = Rails.root.join('public', 'uploads', book.image)
    File.delete(old_image_path) if File.exist?(old_image_path)
  end
  
  private
  def book_params
    params.require(:book).permit(:name, :price, :description, :image)
  end

  private
  def authenticated_username
    username, _password = ActionController::HttpAuthentication::Basic::user_name_and_password(request)
    username
  end
end
