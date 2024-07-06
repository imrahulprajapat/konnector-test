class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true

  scope :json_search, ->(list_names) { select{|user| (user.campaigns_list.pluck('campaign_name') & list_names).any? } }

  def self.filter(list_names)
    list_names = ["cam1", "cam2"]

    self.find_by_sql(raw_query(list_names))
  end

  private

  def self.raw_query(list_names)
    base_query = 'Select * from users where'
    list_names.each_with_index.inject(base_query) do |query, (name, index)|
      campaigns_list_search = {"campaign_name": name}.deep_stringify_keys.to_s
      json_search = "JSON_CONTAINS(campaigns_list, #{campaigns_list_search})"
      if index == 0
        query = query + ' ' + json_search
      else
        query = query + ' OR ' + json_search
      end
      query
    end
  end

end


# User.where('campaigns_list @> ?', { campaign_name: ['cam4', 'cam6'] }.to_json)

# select * from deals where JSON_CONTAINS(status, '{"campaign_name" => "cam4"}') OR JSON_CONTAINS(status, '{"campaign_name": "cam6"}')