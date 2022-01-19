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
  join: d_dates {
    view_label: "Dates"
    type: left_outer
    sql_on: ${f_lineitems.l_orderdatekey}=${d_dates.datekey} ;;
    relationship: many_to_one
  }
  join: d_customer {
    view_label: "Customers"
    type: left_outer
    sql_on: ${f_lineitems.l_custkey} =${d_customer.c_custkey} ;;
    relationship: many_to_one
  }
}
