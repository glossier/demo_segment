- view: page_facts
  derived_table:
    sortkeys: [received_at]
    distkey: looker_visitor_id  
    sql_trigger_value: select count(*) from ${mapped_events.SQL_TABLE_NAME}
    sql: |
      SELECT e.event_id AS event_id
            , e.looker_visitor_id
            , e.received_at
            , CASE 
                WHEN DATEDIFF(seconds, e.received_at, LEAD(e.received_at) OVER(PARTITION BY e.looker_visitor_id ORDER BY e.received_at)) > 30*60 THEN NULL 
                ELSE DATEDIFF(seconds, e.received_at, LEAD(e.received_at) OVER(PARTITION BY e.looker_visitor_id ORDER BY e.received_at)) END AS lead_idle_time_condition
      FROM ${mapped_events.SQL_TABLE_NAME} AS e

  fields:

  - dimension: event_id
    hidden: true
    primary_key: true
    sql: ${TABLE}.event_id

  - dimension: duration_page_view_seconds
    type: number
    sql: ${TABLE}.lead_idle_time_condition
  
  - dimension: is_last_page
    type: yesno
    sql: 
      ${duration_page_view_seconds} is NULL
  
  - dimension: looker_visitor_id
    hidden: true
    type: string
    sql: ${TABLE}.looker_visitor_id
  
  - dimension: received
    hidden: true
    type: time
    datatype: timestamp
    timeframes: [raw, time,date,month,day_of_week,year]
    sql: ${TABLE}.received_at

  sets:
    detail:
      - event_id
      - lead_idle_time_condition

