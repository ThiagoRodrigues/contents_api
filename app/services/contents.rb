# frozen_string_literal: true

class Contents
  def initialize(content_type)
    @content_type = content_type
  end

  def self.call(content_type)
    new(content_type).call
  end

  def call
    query = base_query

    if tv_show?
      query = query.includes(seasons: :episodes)
    end

    query.ordered
  end

  private

  attr_reader :content_type

  def base_query
    if content_type.present?
      Content.where(type: content_type.classify)
    else
      Content.all
    end
  end

  def tv_show?
    content_type == 'tv_show'
  end
end
