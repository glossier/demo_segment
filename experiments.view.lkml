view: experiments {
  derived_table: {
    sql: SELECT t1.anonymous_id as anonymous_id, t1.variation_name, t1.variation_id, t1.experiment_name,
         t1.experiment_id FROM glossier_production.experiment_viewed as t1
      LEFT JOIN glossier_production.experiment_viewed t2 on t1.anonymous_id = t2.anonymous_id AND t1.received_at > t2.received_at
      where t2.anonymous_id is null
      ORDER BY 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: variation_name {
    type: string
    sql: ${TABLE}.variation_name ;;
  }

  dimension: variation_id {
    type: string
    sql: ${TABLE}.variation_id ;;
  }

  dimension: experiment_name {
    type: string
    sql: ${TABLE}.experiment_name ;;
  }

  dimension: experiment_id {
    type: string
    sql: ${TABLE}.experiment_id ;;
  }

  set: detail {
    fields: [anonymous_id, variation_name, variation_id, experiment_name, experiment_id]
  }
}
