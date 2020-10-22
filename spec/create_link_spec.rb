require 'rails_helper'

module Mutations
	module Links
		RSpec.describe CreateLink, type: :request do
			describe '.resolve' do
				it 'creates a link' do
					link = create(:link)


					expect do
						post '/graphql', params: { query: query(link_id: link.id) }
					end.to change{ Link.count }.by(1)
				end

				it 'returns a link' do

					link = create(:link)

					post '/graphql', params: { query: query(link_id: link.id) }
					json = JSON.parse(response.body)
					data = json['data']['createLink']

					expect(data).to include(
						'id'		=> be_present
					)
				end

			end

			def query(link_id:)
				<<~GQL
				mutation {
					createLink(
						url: "https://www.pokemon.com/us/"
						description: "This was the description"
					){
						id
						url
						description
					}
				}
				GQL
			end
		end
	end
end