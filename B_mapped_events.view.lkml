view: mapped_events {
  derived_table: {
    sortkeys: ["event_id"]
    distribution: "glossier_visitor_id"
    sql_trigger_value: select current_date ;;
    sql: select *
        , datediff(minutes, lag(received_at) over(partition by glossier_visitor_id order by received_at), received_at) as idle_time_minutes
      from (
        select t.id || '-t' as event_id
          , coalesce(a2v.glossier_visitor_id,a2v.alias) as glossier_visitor_id
          , t.anonymous_id
          , t.received_at
          , t.event as event
          , NULL as referrer
          , 'tracks' as event_source
        from glossier_production.tracks as t
        inner join ${page_aliases_mapping.SQL_TABLE_NAME} as a2v
          on a2v.alias = coalesce(t.user_id, t.anonymous_id)

        union all

        select t.id || '-p' as event_id
          , coalesce(a2v.glossier_visitor_id,a2v.alias)
          , t.anonymous_id
          , t.received_at
          , t.path as event
          , t.referrer as referrer
          , 'pages' as event_source
        from glossier_production.pages as t
        inner join ${page_aliases_mapping.SQL_TABLE_NAME} as a2v
          on a2v.alias = coalesce(t.user_id, t.anonymous_id)
      ) as e
       ;;
  }

  dimension: event_id {
    sql: ${TABLE}.event_id ;;
  }

  dimension: glossier_visitor_id {
    sql: ${TABLE}.glossier_visitor_id ;;
  }

  dimension: anonymous_id {
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension_group: received_at {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at ;;
  }

  dimension: event {
    sql: ${TABLE}.event ;;
  }

  dimension: referrer {
    sql: ${TABLE}.referrer ;;
  }

  dimension: event_source {
    sql: ${TABLE}.event_source ;;
  }

  dimension: idle_time_minutes {
    type: number
    sql: ${TABLE}.idle_time_minutes ;;
  }
}
