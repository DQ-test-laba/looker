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
    tiers: [0, 3001, 5001, 7001]
    style: integer
    html: <p style="color: ##173589; font-size: 120%; fontweight: bold; text-align:center">{{value}}</p> ;;
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
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value | url_encode }}"
      icon_url: "http://google.com/favicon.ico"
      }
    html: <b><center><font size="2" color="#173589" >{{value | url_encode}}</font></center></b> ;;
    drill_fields: [items*]


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
  set: items  {
    fields: [d_part.p_brand,
      d_part.p_name
    ]
  }
}
