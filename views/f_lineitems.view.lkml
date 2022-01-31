view: f_lineitems {
  sql_table_name: "DATA_MART"."F_LINEITEMS"
    ;;

  dimension: l_availqty {
    label: "Avalible Quantity"
    type: number
    sql: ${TABLE}."L_AVAILQTY" ;;
  }

  dimension: l_clerk {
    label: "Clerk"
    type: string
    sql: ${TABLE}."L_CLERK" ;;
  }

  dimension: l_commitdatekey {
    label: "Commit Date"
    hidden: yes
    type: number
    sql: ${TABLE}."L_COMMITDATEKEY" ;;
  }

  dimension: l_custkey {
    label: "Customer Key"
    hidden: yes
    type: number
    sql: ${TABLE}."L_CUSTKEY" ;;
  }

  dimension: l_discount {
    label: "Discount"
    type: number
    sql: ${TABLE}."L_DISCOUNT" ;;
    value_format_name: percent_0
  }

  dimension: l_extendedprice {
    label: "Extended Price"
    type: number
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
    value_format_name: usd
  }

  dimension: l_linenumber {
    label: "Line Number"
    type: number
    sql: ${TABLE}."L_LINENUMBER" ;;
  }

  dimension: l_orderdatekey {
    label: "Order Date Key"
    hidden: yes
    type: number
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
  }

  dimension: l_orderkey {
    label: "Order Key"
    hidden: yes
    type: number
    sql: ${TABLE}."L_ORDERKEY" ;;
  }

  dimension: l_orderpriority {
    label: "Order Priority"
    type: string
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }

  dimension: l_orderstatus {
    label: "Order Status"
    type: string
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }

  dimension: l_partkey {
    label: "Part Key"
    hidden: yes
    type: number
    sql: ${TABLE}."L_PARTKEY" ;;
  }

  dimension: l_quantity {
    label: "Quantity"
    type: number
    sql: ${TABLE}."L_QUANTITY" ;;
  }

  dimension: l_receiptdatekey {
    label: "Receipt Date Key"
    hidden: yes
    type: number
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
  }

  dimension: l_returnflag {
    label: "Return Flag"
    type: string
    sql: ${TABLE}."L_RETURNFLAG" ;;
  }

  dimension: l_shipdatekey {
    label: "Ship Date Key"
    hidden: yes
    type: number
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
  }

  dimension: l_shipinstruct {
    label: "Ship Instructures"
    type: string
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
  }

  dimension: l_shipmode {
    label: "Ship Mode"
    type: string
    sql: ${TABLE}."L_SHIPMODE" ;;
  }

  dimension: l_shippriority {
    label: "Ship Priority"
    type: number
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }

  dimension: l_suppkey {
    label: "Supplier Key"
    hidden: yes
    type: number
    sql: ${TABLE}."L_SUPPKEY" ;;
  }

  dimension: l_supplycost {
    label: "Supply Cost"
    type: number
    sql: ${TABLE}."L_SUPPLYCOST" ;;
    value_format_name: usd
  }

  dimension: l_tax {
    label: "Tax"
    type: number
    sql: ${TABLE}."L_TAX" ;;
    value_format_name: percent_0
  }

  dimension: l_totalprice {
    label: "Total Price"
    type: number
    sql: ${TABLE}."L_TOTALPRICE" ;;
    value_format_name: usd
  }

  dimension: is_shipped_by_air {
    type:  yesno
    hidden: yes
    sql: ${l_shipmode} in ('AIR', 'REG AIR') ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_sale_price {
    label: "Total Sale Price"
    description: "Total sales from items sold"
    type:  sum
    sql: ${l_totalprice} ;;
    value_format_name: usd
  }

  measure: average_sale_price {
    label: "Average Sale Price"
    description: "Average sale price of items sold"
    type: average
    sql: ${l_totalprice} ;;
    value_format_name: usd
  }

  measure: cumulative_total_sales {
    label: "Cumulative Total Sales"
    description: "Cumulative total sales from items sold (also known as a running total)"
    type: running_total
    sql: ${total_sale_price};;
    value_format_name: usd
  }
  measure: total_sales_by_air {
    label: "Total Sales Price Shipped By Air"
    description: "Total sales of items shipped by air"
    type: sum
    filters: [is_shipped_by_air: "yes"]
    sql: ${l_totalprice} ;;
    value_format_name: usd
  }

  measure: total_sales_russia {
    label: "Total Russia Sales"
    description: "Total sales by customers from Russia"
    type: sum
    filters: [d_customer.c_nation: "RUSSIA"]
    sql: ${l_totalprice} ;;
    value_format_name: usd
  }

  measure: total_gross_revenue {
    label: "Total Gross Revenue"
    description: "Total price of completed sales"
    type: sum
    filters: [l_orderstatus: "F"]
    sql: ${l_totalprice} ;;
    value_format_name: usd
  }

  measure: total_cost {
    label: "Total Cost"
    description: "Total Sypply Cost"
    type: sum
    sql: ${l_supplycost} ;;
    value_format_name: usd
  }

  measure: total_gross_margin_amount  {
    description: "Difference between Total Revenue and Total Sypply Cost"
    type:  number
    sql: ${total_gross_revenue} - ${total_cost} ;;
    value_format_name: usd
  }

  measure: gross_margin_percentage {
    description: "Total Gross Margin Amount / Total Gross Revenue"
    type: number
    sql: ${total_gross_margin_amount}/ NULLIF(${total_gross_revenue},0);;
    value_format_name: percent_2
  }

  measure: number_returned{
    label: "Number of Items Returned"
    description: "Number of items that were returned by dissatisfied customers"
    type: sum
    sql: ${l_quantity} ;;
    filters: [l_returnflag: "R"]
  }

  measure: number_sold {
    label: "Total Number of Items Sold"
    description: "Number of items that were sold"
    type: sum
    sql: ${l_quantity} ;;
  }

  measure: item_returned_rate {
    description: "Number of Items Returned / Total Number of Items Sold"
    type:  number
    sql: ${number_returned}/ NULLIF(${number_sold},0);;
    value_format_name: decimal_2
  }

  measure: total_number_customers {
    hidden:  yes
    type: count_distinct
    sql: ${l_custkey} ;;
  }

  measure: avg_cust_spend {
    label: "Average Spend per Customer"
    description: "Total Sale Price / Total Number of Customers"
    sql: ${total_sale_price} / NULLIF(${total_number_customers}, 0) ;;
    value_format_name: usd
  }
}
