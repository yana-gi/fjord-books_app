# frozen_string_literal: true

module Commentable
  def set_comments
    @comments = resource.comments.eager_load(:user).all
  end

  def build_comment
    @comment = resource.comments.build(user_id: current_user.id)
  end
end
