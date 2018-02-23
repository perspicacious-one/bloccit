class FavoriteMailer < ApplicationMailer
  default from: "nelsondcraig@gmail.com"

  def new_comment(user, post, comment)
    headers["Message-ID"] = "<comments/#{comment.id}@nameless-cliffs-55444.com>"
    headers["In-Reply-To"] = "<post/#{post.id}@nameless-cliffs-55444.com>"
    headers["References"] = "<post/#{post.id}@nameless-cliffs-55444.com>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

  def new_post(user, post)
    headers["In-Reply-To"] = "<post/#{post.id}@nameless-cliffs-55444.com>"
    headers["References"] = "<post/#{post.id}@nameless-cliffs-55444.com>"

    @user = user
    @post = post

    mail(to: user.email, subject: "You have created a new post!")
  end
end
