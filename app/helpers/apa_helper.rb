# frozen_string_literal: true

module ApaHelper
  def apa_citation(article)
    title = article.title.capitalize_turkish

    "#{authors_in_apa_format(article)}. (#{article.year}). #{title}. #{article.journal}, \
    #{article.volume}(#{article.issue}), #{article.first_page}-#{article.last_page}"
  end

  def authors_in_apa_format(article)
    article.authors.split(',').map do |author|
      names = author.split
      last_name = names.shift.capitalize_turkish
      first_name = names.map(&:first).join('. ')
      "#{last_name}, #{first_name}"
    end.join(' & ')
  end

  def user_projects(project)
    concat "#{project.type} - #{project.duty} - \
            #{l project.start_date, format: '%Y / %m'} - \
            #{project.end_date ? l(project.end_date, format: '%Y') : ''} | \
            #{t('.status')} : #{enum_t(project, :status)}"
    concat tag.br
    project.subject
  end

  def user_certifications(certificate)
    "#{certificate.name} - #{enum_t(certificate, :scope)}, #{enum_t(certificate, :type)} - \
    #{certificate.city_and_country} - (#{l(certificate.start_date, format: '%Y')})"
  end

  # rubocop:disable Metrics/AbcSize
  def user_academic_credentials(credential)
    concat content_tag(:b, credential.title)
    concat tag.br
    concat Unit.find_by(yoksis_id: credential.university_id)&.name
    concat tag.br
    content_tag(:small, "#{credential.start_year} - #{credential.end_year || 'devam ediyor'}")
  end
  # rubocop:enable Metrics/AbcSize
end
