module ApplicationHelper
  def form_group_tag(errors, &block)
    css_class = 'form-group'
    css_class << ' has-error' if errors.any?
  # #5
    content_tag :div, capture(&block), class: css_class
  end

  def user_can_edit?
    current_user && (current_user.moderator? || current_user.admin?)
  end
end
