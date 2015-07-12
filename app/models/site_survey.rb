class SiteSurvey < ActiveRecord::Base
  belongs_to :user
  belongs_to :organzation_site
end
