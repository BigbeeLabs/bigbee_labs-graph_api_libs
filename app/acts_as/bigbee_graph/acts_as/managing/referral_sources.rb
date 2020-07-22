#------------------------------------------------------------------------------------------------
# Use like: 
#   include BigbeeGraph::ActsAs::Managing::ReferralSources
#------------------------------------------------------------------------------------------------
module BigbeeGraph
  module ActsAs
    module Managing
      module ReferralSources

        def referral_sources_ary
          graph_referral_source.all.map do |source|
            source.attributes.with_indifferent_access.except(:created_at, :updated_at)
          end
        end

        def graph_referral_source
          @graph_referral_source ||= BigbeeGraph::ReferralSource.new(credential: {api_key: api_key})
        end

        def graph_referral_source_using_api_key
          graph_referral_source.using_credential(api_key: api_key)
        end

      end
    end
  end
end