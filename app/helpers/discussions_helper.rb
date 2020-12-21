# frozen_string_literal: true

# helper for discussion
module DiscussionsHelper
  # checks if author. This is is used to insert into if statement
  def discussion_author(discussion)
    user_signed_in? && current_user.id == discussion.user_id
  end

  # checks if reply author. This is is used to insert into if statement
  def reply_author(reply)
    user_signed_in? && current_user.id == reply.user_id
  end
end
