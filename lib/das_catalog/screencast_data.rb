module DasCatalog
  class ScreencastData
    attr_reader :link, :watched, :downloaded

    def initialize(link)
      @link = link
    end

    def self.for_link(link)
      Store.find(link) or new(link)
    end

    alias :id :link

    def download_link
      "#{link}/download"
    end

    def downloaded
      @downloaded = true
    end

    def downloaded?
      @downloaded
    end

    def watched
      @watched = true
    end

    def unwatched
      @watched = false
    end

    def watched?
      @watched
    end

    def save
      Store.store(self)
    end
  end
end
