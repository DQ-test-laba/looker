- dashboard: vc_dasboard_tkh
  title: TKh VC Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Number of Items Returned by Regions
    name: Number of Items Returned by Regions
    model: looker_intensive7_t_khottchenkova
    explore: f_lineitems
    type: looker_column
    fields: [d_customer.c_region, f_lineitems.number_returned]
    filters:
      order_date.date_val_year: '1994'
      d_customer.c_region: "-NULL"
    sorts: [f_lineitems.number_returned desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: f_lineitems.number_returned,
            id: f_lineitems.number_returned, name: Number of Items Returned}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Top-10 Brands by Returns
    name: Top-10 Brands by Returns
    model: looker_intensive7_t_khottchenkova
    explore: f_lineitems
    type: looker_column
    fields: [d_part.p_brand, f_lineitems.number_returned]
    filters:
      order_date.date_val_year: '1994'
    sorts: [f_lineitems.number_returned desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: f_lineitems.number_returned,
            id: f_lineitems.number_returned, name: Number of Items Returned}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    defaults_version: 1
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Returns in compare with Sales
    name: Returns in compare with Sales
    model: looker_intensive7_t_khottchenkova
    explore: f_lineitems
    type: looker_line
    fields: [f_lineitems.number_returned, order_date.date_val_year, f_lineitems.number_sold]
    fill_fields: [order_date.date_val_year]
    sorts: [order_date.date_val_year]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 1bc1f1d8-7461-4bfd-8c3b-424b924287b5
      palette_id: dd87bc4e-d86f-47b1-b0fd-44110dc0b469
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: f_lineitems.number_returned,
            id: f_lineitems.number_returned, name: Number of Items Returned}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    row: 0
    col: 16
    width: 8
    height: 6
  - name: add_a_unique_name_1644754991
    title: Untitled Visualization
    model: looker_intensive7_t_khottchenkova
    explore: f_lineitems
    type: table
    fields: [f_lineitems.l_clerk, f_lineitems.number_returned]
    filters:
      order_date.date_val_year: '1994'
    sorts: [f_lineitems.number_returned desc]
    limit: 10
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
