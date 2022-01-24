view: d_customer {
  sql_table_name: "DATA_MART"."D_CUSTOMER"
    ;;

  dimension: c_address {
    label: "Customer's Address"
    type: string
    sql: ${TABLE}."C_ADDRESS" ;;
  }

  dimension: c_custkey {
    label: "Customer Key"
    description: "Unique ID for the Customer"
    type: number
    primary_key: yes
    sql: ${TABLE}."C_CUSTKEY" ;;
  }

  dimension: c_mktsegment {
    label: "Market Segment"
    type: number
    sql: ${TABLE}."C_MKTSEGMENT" ;;
  }

  dimension: c_name {
    label: "Customer Name"
    type: string
    sql: ${TABLE}."C_NAME" ;;
  }

  dimension: c_nation {
    label: "Nation"
    type: string
    sql: ${TABLE}."C_NATION" ;;
  }

  dimension: c_phone {
    label: "Phone Number"
    type: string
    sql: ${TABLE}."C_PHONE" ;;
  }

  dimension: c_region {
    label: "Region"
    type: string
    sql: ${TABLE}."C_REGION" ;;
  }

  measure: count {
    type: count
    drill_fields: [c_name]
  }
}
