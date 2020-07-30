class CommentBroadcastJob < ApplicationJob
  queue_as :default 

  def preform(comment)
    ActionCable.server.broadcast "blogs_#{comment.blog.is}_channel", comment: render_comment(contet)
  end

  private

  def render_comment(comment)
    CommentsController.render partial: 'comments/comment', locals: {comment: comment}
  end
  
  
end