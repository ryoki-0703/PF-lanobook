class LanobesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def new
    @lanobe = Lanobe.new
    @categories = Category.all
  end

  def create
    @lanobe = Lanobe.new(lanobe_params)
    @lanobe.user_id = current_user.id
    if @lanobe.save
      redirect_to lanobes_path
    else
      @categories = Category.all
      render :new
    end
  end

  def index
    category_id = params[:category_id]
    sort = params[:sort]
    page = params[:page]

    if sort.blank?
      @sort = "recent"
    else
      @sort = sort
    end

    if category_id.present?
      @category = Category.find(category_id)
      @lanobes = Lanobe.where(category_id: category_id).page(page).reverse_order
      if sort == "recent" || sort.blank?
        @lanobes = @lanobes.order(created_at: "DESC") # 新着順
      elsif sort == "favorites" # いいね順
        sort_by_favorite_with(category_id)
      elsif sort == "post_comments" # コメント順
        sort_by_post_comment_with(category_id)
      else
        @lanobes = @lanobes.page(page).reverse_order
      end
      lanobes2_count = 0
      if !@lanobes2.nil?
        lanobes2_count = @lanobes2.count
      end
      @lanobe_count = @lanobes.count + lanobes2_count
    else
      @lanobes = Lanobe.page(page).reverse_order
      if sort == "recent" || sort.blank?
        @lanobes = @lanobes.order(created_at: "DESC") # 新着順
      elsif sort == "favorites" # いいね順
        sort_by_favorite
      elsif sort == "post_comments" # コメント順
        sort_by_post_comment
      else
        @lanobes = @lanobes.page(page).reverse_order
      end
      lanobes2_count = 0
      if @lanobes2.present?
        lanobes2_count = @lanobes2.count
      end
      @lanobe_count = @lanobes.count + lanobes2_count
    end
  end

  def show
    @lanobe = Lanobe.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @lanobe = Lanobe.find(params[:id])
  end

  def update
    @lanobe = Lanobe.find(params[:id])
    if @lanobe.update(lanobe_params)
      redirect_to lanobe_path(@lanobe)
    else
      render :edit
    end
  end

  def destroy
    @lanobe = Lanobe.find(params[:id])
    @lanobe.destroy
    redirect_to user_path(current_user)
  end

  private

  def sort_by_favorite_with(category_id)
    lanobe_ids = Lanobe.where(category_id: category_id).pluck(:id)
    favorite_lanobe_ids = Favorite.where(lanobe_id: lanobe_ids).group(:lanobe_id).order('count(lanobe_id) desc').pluck(:lanobe_id)
    no_favorite_lanobe_ids = lanobe_ids - favorite_lanobe_ids # いいねが無い
    @lanobes = Lanobe.find(favorite_lanobe_ids)
    @lanobes2 = Lanobe.find(no_favorite_lanobe_ids)
  end

  def sort_by_post_comment_with(category_id)
    lanobe_ids = Lanobe.where(category_id: category_id).pluck(:id)
    comment_lanobe_ids = PostComment.where(lanobe_id: lanobe_ids).group(:lanobe_id).order('count(lanobe_id) desc').pluck(:lanobe_id)
    no_comment_lanobe_ids = lanobe_ids - comment_lanobe_ids # コメントが無い
    @lanobes = Lanobe.find(comment_lanobe_ids)
    @lanobes2 = Lanobe.find(no_comment_lanobe_ids)
  end

  def sort_by_favorite
    lanobe_ids = Lanobe.all.pluck(:id)
    favorite_lanobe_ids = Favorite.where(lanobe_id: lanobe_ids).group(:lanobe_id).order('count(lanobe_id) desc').pluck(:lanobe_id)
    no_favorite_lanobe_ids = lanobe_ids - favorite_lanobe_ids
    @lanobes = Lanobe.find(favorite_lanobe_ids)
    @lanobes2 = Lanobe.find(no_favorite_lanobe_ids) # いいねが無い
  end

  def sort_by_post_comment
    lanobe_ids = Lanobe.all.pluck(:id)
    comment_lanobe_ids = PostComment.where(lanobe_id: lanobe_ids).group(:lanobe_id).order('count(lanobe_id) desc').pluck(:lanobe_id)
    no_comment_lanobe_ids = lanobe_ids - comment_lanobe_ids
    @lanobes = Lanobe.find(comment_lanobe_ids)
    @lanobes2 = Lanobe.find(no_comment_lanobe_ids)
  end

  def lanobe_params
    params.require(:lanobe).permit(:title, :image, :introduction, :category_id)
  end
end
