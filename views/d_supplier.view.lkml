view: d_supplier {
  sql_table_name: "DATA_MART"."D_SUPPLIER"
    ;;

  dimension: s_acctbal {
    label: "Acctbal"
    type: number
    sql: ${TABLE}."S_ACCTBAL" ;;
  }

  dimension: s_address {
    label: "Address"
    type: string
    sql: ${TABLE}."S_ADDRESS" ;;
  }

  dimension: s_name {
    label: "Name"
    type: string
    sql: ${TABLE}."S_NAME" ;;
  }

  dimension: s_nation {
    label: "Nation"
    type: string
    sql: ${TABLE}."S_NATION" ;;
  }

  dimension: s_phone {
    label: "Phone Number"
    type: string
    sql: ${TABLE}."S_PHONE" ;;
  }

  dimension: s_region {
    label: "Region"
    type: string
    sql: ${TABLE}."S_REGION" ;;
  }

  dimension: s_suppkey {
    label: "Supplier Key"
    primary_key: yes
    type: number
    sql: ${TABLE}."S_SUPPKEY" ;;
  }

  measure: count {
    type: count
    drill_fields: [s_name]
  }
}
