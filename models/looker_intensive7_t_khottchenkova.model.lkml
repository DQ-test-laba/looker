connection: "tpchlooker"

# include all the views
include: "/views/**/*.view"

datagroup: looker_intensive7_t_khottchenkova_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: looker_intensive7_t_khottchenkova_default_datagroup


explore: f_lineitems {
  label: "Line Items"
  view_label: "Line Items"
  join:  d_supplier{
    view_label: "Suppliers"
    type:left_outer
    sql_on: ${f_lineitems.l_suppkey} = ${d_supplier.s_suppkey};;
    relationship: many_to_one
}
  join:  d_part{
    view_label: "Parts"
    type: left_outer
    sql_on: ${f_lineitems.l_partkey} =${d_part.p_partkey} ;;
    relationship: many_to_one
  }
  join: commit_date {
    from:  d_dates
    view_label: "Commit Dates"
    type: left_outer
    sql_on: ${commit_date.datekey} = ${f_lineitems.l_commitdatekey} ;;
    relationship: many_to_one
  }

  join: order_date {
    from:  d_dates
    view_label: "Order Dates"
    type: left_outer
    sql_on: ${order_date.datekey} = ${f_lineitems.l_orderdatekey} ;;
    relationship: many_to_one
  }

  join: receipt_date {
    from:  d_dates
    view_label: "Receipt Dates"
    type: left_outer
    sql_on: ${receipt_date.datekey} = ${f_lineitems.l_receiptdatekey} ;;
    relationship: many_to_one
  }

  join: ship_date {
    view_label: "Shipping Dates"
    from:  d_dates
    type: left_outer
    sql_on: ${ship_date.datekey} = ${f_lineitems.l_shipdatekey} ;;
    relationship: many_to_one
  }
  join: d_customer {
    view_label: "Customers"
    type: left_outer
    sql_on: ${f_lineitems.l_custkey} =${d_customer.c_custkey} ;;
    relationship: many_to_one
  }
}
