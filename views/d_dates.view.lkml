view: d_dates {
  sql_table_name: "DATA_MART"."D_DATES"
    ;;

  dimension_group: date_val {
    label: "Date"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_VAL" ;;
  }

  dimension: datekey {
    label: "Date Key"
    primary_key: yes
    type: number
    sql: ${TABLE}."DATEKEY" ;;
  }

  dimension: day_of_week {
    label: "Day of Week"
    type: number
    sql: ${TABLE}."DAY_OF_WEEK" ;;
  }

  dimension: dayname_of_week {
    label: "Day Name"
    type: string
    sql: ${TABLE}."DAYNAME_OF_WEEK" ;;
  }

  dimension: month_name {
    label:"Month Name"
    type: string
    sql: ${TABLE}."MONTH_NAME" ;;
  }

  dimension: month_num {
    label: "Month Number"
    type: number
    sql: ${TABLE}."MONTH_NUM" ;;
  }

  dimension: quarter {
    label: "Quarter"
    type: number
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: year {
    label: "Year"
    type: number
    sql: ${TABLE}."YEAR" ;;
  }

  measure: count {
    type: count
    drill_fields: [month_name]
  }
}
