class CommentsController < ApplicationController
  
  def new
    @parent_id = params.delete(:parent_id)
    @commentable = find_commentable
    @comment = Comment.new( :parent_id => @parent_id, 
                            :commentable_id => @commentable.id,
                            :commentable_type => @commentable.class.to_s)
  end
  
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.create(comment_params)
    if @comment.save!
      flash[:notice] = "Successfully created comment"
      redirect_to @commentable
    else
      flash[:error] = "Error adding comment"
      redirect_to root_path
    end
  end
 
  private
  
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.friendly.find(value)
      end
    end
    nil
  end
   
   def comment_params
     params.require(:comment).permit(:text, :commentable_id, :commentable_type, :ancestry)
   end
   
end
