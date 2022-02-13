view: d_dates {
  sql_table_name: "DATA_MART"."D_DATES"
    ;;

  dimension_group: date_val {
    label: ""
    type: time
    timeframes: [
      date,
      day_of_week,
      day_of_month,
      month_num,
      month_name,
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
    hidden: yes
    type: number
    sql: ${TABLE}."DATEKEY" ;;
  }

  dimension: day_of_week {
    label: "Day of Week"
    hidden: yes
    type: number
    sql: ${TABLE}."DAY_OF_WEEK" ;;
  }

  dimension: dayname_of_week {
    label: "Day Name"
    hidden: yes
    type: string
    sql: ${TABLE}."DAYNAME_OF_WEEK" ;;
  }

  dimension: month_name {
    label:"Month Name"
    hidden: yes
    type: string
    sql: ${TABLE}."MONTH_NAME" ;;
    order_by_field: year_month
  }

  dimension: month_num {
    label: "Month Number"
    hidden: yes
    type: number
    sql: ${TABLE}."MONTH_NUM" ;;
  }

  dimension: quarter {
    label: "Quarter"
    hidden: yes
    type: number
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: year {
    label: "Year"
    hidden: yes
    type: number
    sql: ${TABLE}."YEAR" ;;
  }
  dimension: year_month {
    hidden: yes
    type: number
    sql: ${year}+${month_num};;
   }

  measure: count {
    type: count
    drill_fields: [month_name]
  }
}
