view: d_supplier {
  sql_table_name: "DATA_MART"."D_SUPPLIER"
    ;;

  dimension: s_acctbal {
    label: "Account Balance"
    type: number
    sql: ${TABLE}."S_ACCTBAL" ;;
  }

  dimension: account_balance_tier {
    label: "Cohort of suppliers according to Account Balance"
    type: tier
    tiers: [0, 3000, 5000, 7000]
    style: integer
    sql: ${s_acctbal} ;;
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
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}."S_SUPPKEY" ;;
  }

  measure: count {
    type: count
    drill_fields: [s_name]
  }
}
