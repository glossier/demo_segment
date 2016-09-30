- view: pages
  sql_table_name: glossier_production.pages
  fields:

  - dimension: event_id
    primary_key: true
    type: string
    sql: ${TABLE}.id
    
  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at
  
  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - dimension: user_id
    type: string
    # hidden: true
    sql: ${TABLE}.user_id

  - dimension: uuid
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid

  - dimension: anonymous_id
    type: string
    sql: ${TABLE}.anonymous_id

  - dimension: context_campaign_amp_utm_campaign
    type: string
    sql: ${TABLE}.context_campaign_amp_utm_campaign

  - dimension: context_campaign_amp_utm_content
    type: string
    sql: ${TABLE}.context_campaign_amp_utm_content

  - dimension: context_campaign_amp_utm_medium
    type: string
    sql: ${TABLE}.context_campaign_amp_utm_medium

  - dimension: context_campaign_amp_utm_source
    type: string
    sql: ${TABLE}.context_campaign_amp_utm_source

  - dimension: context_campaign_amp_utm_term
    type: string
    sql: ${TABLE}.context_campaign_amp_utm_term

  - dimension: context_campaign_camfpaign
    type: string
    sql: ${TABLE}.context_campaign_camfpaign

  - dimension: context_campaign_camosspaign
    type: string
    sql: ${TABLE}.context_campaign_camosspaign

  - dimension: context_campaign_con_e2_80_8ctent
    type: string
    sql: ${TABLE}.context_campaign_con_e2_80_8ctent

  - dimension: context_campaign_content
    type: string
    sql: ${TABLE}.context_campaign_content

  - dimension: context_campaign_creampaign
    type: string
    sql: ${TABLE}.context_campaign_creampaign

  - dimension: context_campaign_dailymailcampaign
    type: string
    sql: ${TABLE}.context_campaign_dailymailcampaign

  - dimension: context_campaign_medium
    type: string
    sql: ${TABLE}.context_campaign_medium

  - dimension: context_campaign_name
    type: string
    sql: ${TABLE}.context_campaign_name

  - dimension: context_campaign_source
    type: string
    sql: ${TABLE}.context_campaign_source

  - dimension: context_campaign_term
    type: string
    sql: ${TABLE}.context_campaign_term

  - dimension: context_campaign_utm_campaign
    type: string
    sql: ${TABLE}.context_campaign_utm_campaign

  - dimension: context_campaign_utm_content
    type: string
    sql: ${TABLE}.context_campaign_utm_content

  - dimension: context_campaign_utm_medium
    type: string
    sql: ${TABLE}.context_campaign_utm_medium

  - dimension: context_campaign_utm_source
    type: string
    sql: ${TABLE}.context_campaign_utm_source

  - dimension: context_campaign_utm_term
    type: string
    sql: ${TABLE}.context_campaign_utm_term

  - dimension: context_ip
    type: string
    sql: ${TABLE}.context_ip

  - dimension: context_library_name
    type: string
    sql: ${TABLE}.context_library_name

  - dimension: context_library_version
    type: string
    sql: ${TABLE}.context_library_version

  - dimension: context_page_path
    type: string
    sql: ${TABLE}.context_page_path

  - dimension: context_page_referrer
    type: string
    sql: ${TABLE}.context_page_referrer

  - dimension: context_page_search
    type: string
    sql: ${TABLE}.context_page_search

  - dimension: context_page_title
    type: string
    sql: ${TABLE}.context_page_title

  - dimension: context_page_url
    type: string
    sql: ${TABLE}.context_page_url

  - dimension: context_traits_email
    type: string
    sql: ${TABLE}.context_traits_email

  - dimension: context_traits_name
    type: string
    sql: ${TABLE}.context_traits_name

  - dimension: context_traits_newsletter_glossier
    type: yesno
    sql: ${TABLE}.context_traits_newsletter_glossier

  - dimension: context_traits_placement
    type: string
    sql: ${TABLE}.context_traits_placement

  - dimension: context_traits_source
    type: string
    sql: ${TABLE}.context_traits_source

  - dimension: context_user_agent
    type: string
    sql: ${TABLE}.context_user_agent

  - dimension_group: original_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.original_timestamp

  - dimension: path
    type: string
    sql: ${TABLE}.path

  - dimension: referrer
    type: string
    sql: ${TABLE}.referrer

  - dimension: search
    type: string
    sql: ${TABLE}.search

  - dimension_group: sent
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.sent_at

  - dimension_group: timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.timestamp

  - dimension_group: uuid_ts
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.uuid_ts

  - measure: count
    type: count
    drill_fields: detail*
    
  
# Refer to Joined in Table definitions   
#   - measure: count_visitors
#     type: count_distinct 
#     sql: ${page_facts.glossier_visitor_id}
# 
#   - measure: count_pageviews
#     type: count
#     drill_fields: [context_library_name]
# 
#   - measure: avg_page_view_duration_minutes
#     type: average
#     value_format_name: decimal_1
#     sql: ${page_facts.duration_page_view_seconds}/60.0
#   
#   - measure: count_distinct_pageviews
#     type: number
#     sql: COUNT(DISTINCT CONCAT(${page_facts.glossier_visitor_id}, ${url}))



  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - context_campaign_name
    - context_library_name
    - context_traits_name
    - users.id
    - users.name
    - users.context_campaign_name
    - users.context_library_name
    - users.context_traits_name

