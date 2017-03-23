- view: completed_order
  sql_table_name: glossier_production.completed_order
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: anonymous_id
    type: string
    sql: ${TABLE}.anonymous_id

  - dimension: context_campaign_content
    type: string
    sql: ${TABLE}.context_campaign_content

  - dimension: context_campaign_medium
    label: 'Medium'
    type: string
    sql: ${TABLE}.context_campaign_medium

  - dimension: context_campaign_name
    label: 'Campaign'
    type: string
    sql: ${TABLE}.context_campaign_name

  - dimension: context_campaign_source
    label: 'Source'
    type: string
    sql: ${TABLE}.context_campaign_source

  - dimension: context_campaign_term
    hidden: true
    type: string
    sql: ${TABLE}.context_campaign_term

  - dimension: context_ip
    hidden: true
    type: string
    sql: ${TABLE}.context_ip

  - dimension: context_library_name
    hidden: true
    type: string
    sql: ${TABLE}.context_library_name

  - dimension: context_library_version
    hidden: true
    type: string
    sql: ${TABLE}.context_library_version

  - dimension: context_page_path
    type: string
    sql: ${TABLE}.context_page_path

  - dimension: context_page_referrer
    type: string
    sql: ${TABLE}.context_page_referrer

  - dimension: context_page_search
    hidden: true
    type: string
    sql: ${TABLE}.context_page_search

  - dimension: context_page_title
    type: string
    sql: ${TABLE}.context_page_title

  - dimension: context_page_url
    hidden: true
    type: string
    sql: ${TABLE}.context_page_url

  - dimension: context_traits_email
    hidden: true
    type: string
    sql: ${TABLE}.context_traits_email

  - dimension: context_user_agent
    hidden: true
    type: string
    sql: ${TABLE}.context_user_agent

  - dimension: coupon
    type: string
    sql: ${TABLE}.coupon

  - dimension: currency
    type: string
    sql: ${TABLE}.currency

  - dimension: discount
    type: string
    sql: ${TABLE}.discount

  - dimension: event
    type: string
    sql: ${TABLE}.event

  - dimension: event_text
    type: string
    sql: ${TABLE}.event_text

  - dimension: order_id
    type: string
    sql: ${TABLE}.order_id

  - dimension_group: original_timestamp
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.original_timestamp

  - dimension: products
    hidden: true
    type: string
    sql: ${TABLE}.products

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension: repeat
    type: yesno
    sql: ${TABLE}.repeat

  - dimension: revenue
    type: string
    sql: ${TABLE}.revenue
    value_format: '$#,##0.00'

  - dimension_group: sent
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.sent_at

  - dimension: shipping
    type: string
    sql: ${TABLE}.shipping

  - dimension: tax
    type: string
    sql: ${TABLE}.tax

  - dimension_group: timestamp
    hidden: true
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.timestamp

  - dimension: total
    type: string
    sql: ${TABLE}.total

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


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - context_campaign_name
    - context_library_name
    - users.id
    - users.name
    - users.context_campaign_name
    - users.context_library_name
    - users.context_traits_name

