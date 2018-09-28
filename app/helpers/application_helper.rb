module ApplicationHelper

  def score_tag(score)
    link_to score.titleize,
            venerations_path(score: score),
            class: "tag is-link score #{score}"
  end
end
