- view: tracks
  sql_table_name: glossier_production.tracks
  fields:

  - dimension: event_id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: anonymous_id
    hidden: true
    type: string
    sql: ${TABLE}.anonymous_id

  - dimension: context_campaign_amp_utm_campaign
    hidden: true
    type: string
    sql: ${TABLE}.context_campaign_amp_utm_campaign

  - dimension: context_campaign_amp_utm_content
    hidden: true
    type: string
    sql: ${TABLE}.context_campaign_amp_utm_content

  - dimension: context_campaign_amp_utm_medium
    hidden: true
    type: string
    sql: ${TABLE}.context_campaign_amp_utm_medium

  - dimension: context_campaign_amp_utm_source
    type: string
    sql: ${TABLE}.context_campaign_amp_utm_source

  - dimension: context_campaign_amp_utm_term
    hidden: true
    type: string
    sql: ${TABLE}.context_campaign_amp_utm_term

  - dimension: context_campaign_camosspaign
    hidden: true
    type: string
    sql: ${TABLE}.context_campaign_camosspaign

  - dimension: context_campaign_content
    type: string
    sql: ${TABLE}.context_campaign_content

  - dimension: context_campaign_creampaign
    hidden: true
    type: string
    sql: ${TABLE}.context_campaign_creampaign

  - dimension: context_campaign_dailymailcampaign
    hidden: true
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
    hidden: true
    type: string
    sql: ${TABLE}.context_campaign_utm_campaign

  - dimension: context_campaign_utm_content
    hidden: true
    type: string
    sql: ${TABLE}.context_campaign_utm_content

  - dimension: context_campaign_utm_medium
    hidden: true
    type: string
    sql: ${TABLE}.context_campaign_utm_medium

  - dimension: context_campaign_utm_source
    type: string
    sql: ${TABLE}.context_campaign_utm_source

  - dimension: context_campaign_utm_term
    hidden: true
    type: string
    sql: ${TABLE}.context_campaign_utm_term

  - dimension: context_integration_name
    type: string
    sql: ${TABLE}.context_integration_name

  - dimension: context_integration_version
    type: string
    sql: ${TABLE}.context_integration_version

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
    hidden: true
    type: string
    sql: ${TABLE}.context_traits_email

  - dimension: context_traits_name
    hidden: true
    type: string
    sql: ${TABLE}.context_traits_name

  - dimension: context_traits_newsletter_glossier
    hidden: true
    type: yesno
    sql: ${TABLE}.context_traits_newsletter_glossier

  - dimension: context_traits_placement
    hidden: true
    type: string
    sql: ${TABLE}.context_traits_placement

  - dimension: context_traits_source
    type: string
    sql: ${TABLE}.context_traits_source

  - dimension: context_user_agent
    hidden: true
    type: string
    sql: ${TABLE}.context_user_agent

  - dimension: event
    type: string
    sql: ${TABLE}.event

  - dimension: event_text
    type: string
    sql: ${TABLE}.event_text

  - dimension_group: original_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.original_timestamp

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension_group: sent
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.sent_at

  - dimension_group: timestamp
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.timestamp

  - dimension: user_id
    type: string
    # hidden: true
    sql: ${TABLE}.user_id

  - dimension: uuid
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid

  - dimension_group: uuid_ts
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.uuid_ts

  - measure: count
    type: count
    drill_fields: detail*
    
  ## Advanced Fields (require joins to other views) 

#   - dimension_group: weeks_since_first_visit
#     type: number
#     sql: FLOOR(DATEDIFF(day,${user_session_facts.first_date}, ${sent_date})/7)
# 
#   - dimension: is_new_user
#     sql:  |
#         CASE 
#         WHEN ${sent_date} = ${user_session_facts.first_date} THEN 'New User'
#         ELSE 'Returning User' END
#   
#   - measure: count_percent_of_total
#     type: percent_of_total
#     sql: ${count}
#     value_format_name: decimal_1
  
    
## Advanced -- Session Count Funnel Meausures
  
#   - filter: event1
#     suggestions: [added_item, app_became_active, app_entered_background, 
#                   app_entered_foreground, app_launched, app_resigned_active,
#                   asked_for_sizes, completed_order, failed_auth_validation, logged_in,
#                   made_purchase, payment_available, payment_failed, payment_form_shown,
#                   payment_form_submitted, removed_item, saved_sizes, shipping_available,
#                   shipping_form_failed, shipping_form_shown, shipping_form_submitted,
#                   signed_up, submitted_order, switched_auth_forms, tapped_shipit,
#                   view_buy_page, viewed_auth_page]
# 
#   - measure: event1_session_count
#     type: number
#     sql: | 
#       COUNT(
#         DISTINCT(
#           CASE 
#             WHEN 
#             {% condition event1 %} ${event} {% endcondition %} 
#               THEN ${track_facts.session_id}
#             ELSE NULL END 
#         )
#       )
# 
#   - filter: event2
#     suggestions: [added_item, app_became_active, app_entered_background, 
#                   app_entered_foreground, app_launched, app_resigned_active,
#                   asked_for_sizes, completed_order, failed_auth_validation, logged_in,
#                   made_purchase, payment_available, payment_failed, payment_form_shown,
#                   payment_form_submitted, removed_item, saved_sizes, shipping_available,
#                   shipping_form_failed, shipping_form_shown, shipping_form_submitted,
#                   signed_up, submitted_order, switched_auth_forms, tapped_shipit,
#                   view_buy_page, viewed_auth_page]
# 
#   - measure: event2_session_count
#     type: number
#     sql: | 
#       COUNT(
#         DISTINCT(
#           CASE 
#             WHEN 
#             {% condition event2 %} ${event} {% endcondition %} 
#               THEN ${track_facts.session_id}
#             ELSE NULL END 
#         )
#       )
#       
#   - filter: event3
#     suggestions: [added_item, app_became_active, app_entered_background, 
#                   app_entered_foreground, app_launched, app_resigned_active,
#                   asked_for_sizes, completed_order, failed_auth_validation, logged_in,
#                   made_purchase, payment_available, payment_failed, payment_form_shown,
#                   payment_form_submitted, removed_item, saved_sizes, shipping_available,
#                   shipping_form_failed, shipping_form_shown, shipping_form_submitted,
#                   signed_up, submitted_order, switched_auth_forms, tapped_shipit,
#                   view_buy_page, viewed_auth_page]
# 
#   - measure: event3_session_count
#     type: number
#     sql: | 
#       COUNT(
#         DISTINCT(
#           CASE 
#             WHEN 
#             {% condition event3 %} ${event} {% endcondition %} 
#               THEN ${track_facts.session_id}
#             ELSE NULL END 
#         )
#       )
#       
#   - filter: event4
#     suggestions: [added_item, app_became_active, app_entered_background, 
#                   app_entered_foreground, app_launched, app_resigned_active,
#                   asked_for_sizes, completed_order, failed_auth_validation, logged_in,
#                   made_purchase, payment_available, payment_failed, payment_form_shown,
#                   payment_form_submitted, removed_item, saved_sizes, shipping_available,
#                   shipping_form_failed, shipping_form_shown, shipping_form_submitted,
#                   signed_up, submitted_order, switched_auth_forms, tapped_shipit,
#                   view_buy_page, viewed_auth_page]
# 
#   - measure: event4_session_count
#     type: number
#     sql: | 
#       COUNT(
#         DISTINCT(
#           CASE 
#             WHEN 
#             {% condition event4 %} ${event} {% endcondition %} 
#               THEN ${track_facts.session_id}
#             ELSE NULL END 
#         )
#       )
#       


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - context_campaign_name
    - context_library_name
    - context_integration_name
    - context_traits_name
    - users.id
    - users.name
    - users.context_campaign_name
    - users.context_library_name
    - users.context_traits_name

