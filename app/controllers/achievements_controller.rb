class AchievementsController < ApplicationController

  def index
    @achievements = Achievement.includes(:achievement_cases).order(sort: :asc)
    @highlights = AchievementCase.where(is_highlight: true).order(sort: :asc)
    add_breadcrumb t('frontend.breadcrumbs.achievements'), :achievements_path
  end

  def show
    @achievements = Achievement.includes(:achievement_cases).order(sort: :asc)
    @achievement = Achievement.find_by(permalink: params[:id])
    add_breadcrumb t('frontend.breadcrumbs.achievements'), :achievements_path
    add_breadcrumb @achievement.title, achievement_path(@achievement.permalink)
  end

end
