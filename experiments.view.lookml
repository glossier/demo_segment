- view: experiments
#   sql: |
#     select anonymous_id, variation_name, variation_id, received_at, experiment_name, 
#     experiment_id from glossier_production.experiment_viewed
    
  fields:

  - dimension: anonymous_id
    type: string
    sql: ${TABLE}.anonymous_id

  - dimension: experiment_id
    type: string
    sql: ${TABLE}.experiment_id

  - dimension: experiment_name
    type: string
    sql: ${TABLE}.experiment_name

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension: variation_id
    type: string
    sql: ${TABLE}.variation_id

  - dimension: variation_name
    type: string
    sql: ${TABLE}.variation_name

  - measure: count
    type: count
    drill_fields: detail*