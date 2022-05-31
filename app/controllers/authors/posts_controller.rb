module Authors
  class PostsController < AuthorsController
    before_action :set_post, only: %i[edit update destroy ]

    # GET /posts or /posts.json
    def index
      @posts = current_author.posts
    end

    # GET /posts/1 or /posts/1.json
    # def show
    # end

    # GET /posts/new
    def new
      @post = current_author.posts.build
    end

    # GET /posts/1/edit
    def edit
      @element = @post.elements.build
    end

    # POST /posts or /posts.json
    def create
      @post = current_author.posts.build(post_params)

        if @post.save

          format.html { redirect_to edit_post_path(@post), notice: "Post was successfully created." }
          format.json { render :edit, status: :created, location: @post }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @post.errors, status: :unprocessable_entity }

        end
    end

    # PATCH/PUT /posts/1 or /posts/1.json
    def update

        if @post.update(post_params)
            redirect_to edit_post_path(@post)
          format.html { redirect_to edit_post_path(@post), notice: "Post was successfully updated." }
          format.json { render :edit, status: :ok, location: @post }

        else
          render :edit
        end
    end

    # DELETE /posts/1 or /posts/1.json
    def destroy
      @post.destroy

      respond_to do |format|
        format.html { redirect_to back, notice: "Post was successfully destroyed." }
        format.json { head :no_content }
      end
    end


    def publish
      post = Post.find(element.dataset[:post_id])
      post.update(published: true, published_at: Time.now)
    end

    def unpublish
      post = Post.find(element.dataset[:post_id])
      post.update(published: false, published_at: nil)
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = current_author.posts.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :description, :header_image)
      end
  end
end
