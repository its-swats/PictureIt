class Photo < ActiveRecord::Base
    mount_uploader :image, ImageUploader

    def is_protected?
    	vote_tally = Vote.where(vote: true).count - Vote.where(vote: false).count
    	vote_tally > uploads_against
    end

end
