CLASS zcl_data_generation_0063 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES: if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DATA_GENERATION_0063 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
      DATA: lt_header TYPE STANDARD TABLE OF zheader_0063_a,
      lt_item   TYPE STANDARD TABLE OF zitem_0063_a.

DATA:
  ls_header TYPE zheader_0063_a,
  ls_item   TYPE zitem_0063_a.

DATA:
  lv_header_uuid TYPE sysuuid_x16,
  lv_item_uuid   TYPE sysuuid_x16.

DATA:
  lv_index TYPE i,
  lv_item_count TYPE i.

CONSTANTS:
  lc_client TYPE mandt VALUE '100'.

  DO 50 TIMES.

    lv_index = sy-index.

*---------------------------------------------------
* HEADER
*---------------------------------------------------

    TRY.
        lv_header_uuid = cl_system_uuid=>create_uuid_x16_static( ).
      CATCH cx_uuid_error.
        "handle exception
    ENDTRY.

    CLEAR ls_header.

    ls_header-client      = lc_client.
    ls_header-header_uuid = lv_header_uuid.
    ls_header-header_id          = |ORD{ 1000 + lv_index }|.

    CASE lv_index MOD 10.

      WHEN 0.
        ls_header-fname = 'Carlos'.
        ls_header-lname = 'Ramirez'.
        ls_header-email = 'carlos.ramirez@example.com'.
        ls_header-country = 'Mexico'.

      WHEN 1.
        ls_header-fname = 'Ana'.
        ls_header-lname = 'Lopez'.
        ls_header-email = 'ana.lopez@example.com'.
        ls_header-country = 'Spain'.

      WHEN 2.
        ls_header-fname = 'John'.
        ls_header-lname = 'Smith'.
        ls_header-email = 'john.smith@example.com'.
        ls_header-country = 'USA'.

      WHEN 3.
        ls_header-fname = 'Maria'.
        ls_header-lname = 'Gonzalez'.
        ls_header-email = 'maria.gonzalez@example.com'.
        ls_header-country = 'Argentina'.

      WHEN 4.
        ls_header-fname = 'Luis'.
        ls_header-lname = 'Fernandez'.
        ls_header-email = 'luis.fernandez@example.com'.
        ls_header-country = 'Chile'.

      WHEN 5.
        ls_header-fname = 'Sofia'.
        ls_header-lname = 'Martinez'.
        ls_header-email = 'sofia.martinez@example.com'.
        ls_header-country = 'Colombia'.

      WHEN 6.
        ls_header-fname = 'Emma'.
        ls_header-lname = 'Wilson'.
        ls_header-email = 'emma.wilson@example.com'.
        ls_header-country = 'Canada'.

      WHEN 7.
        ls_header-fname = 'Daniel'.
        ls_header-lname = 'Brown'.
        ls_header-email = 'daniel.brown@example.com'.
        ls_header-country = 'UK'.

      WHEN 8.
        ls_header-fname = 'Lucia'.
        ls_header-lname = 'Torres'.
        ls_header-email = 'lucia.torres@example.com'.
        ls_header-country = 'Peru'.

      WHEN 9.
        ls_header-fname = 'Miguel'.
        ls_header-lname = 'Herrera'.
        ls_header-email = 'miguel.herrera@example.com'.
        ls_header-country = 'Mexico'.

    ENDCASE.

    ls_header-created_on = cl_abap_context_info=>get_system_date( ) - lv_index.
    ls_header-delivery_date = cl_abap_context_info=>get_system_date( ) + 7.

    CASE lv_index MOD 3.
      WHEN 0.
        ls_header-order_status = 1.
      WHEN 1.
        ls_header-order_status = 2.
      WHEN 2.
        ls_header-order_status = 3.
    ENDCASE.

    ls_header-image_url =
      |https://picsum.photos/seed/{ lv_index }/300/300|.

    GET TIME STAMP FIELD ls_header-local_last_changed_at.
    GET TIME STAMP FIELD ls_header-last_changed_at.

    APPEND ls_header TO lt_header.

*---------------------------------------------------
* ITEMS
*---------------------------------------------------

    lv_item_count = ( lv_index MOD 4 ) + 1.

    DO lv_item_count TIMES.

      TRY.
          lv_item_uuid = cl_system_uuid=>create_uuid_x16_static( ).
        CATCH cx_uuid_error.
          "handle exception
      ENDTRY.

      CLEAR ls_item.

      ls_item-client      = lc_client.
      ls_item-item_uuid   = lv_item_uuid.
      ls_item-parent_uuid = lv_header_uuid.

      CASE sy-index.

        WHEN 1.
          ls_item-name = 'Laptop Lenovo ThinkPad'.
          ls_item-description = '14-inch business laptop'.
          ls_item-price = '1250.99'.
          ls_item-height = '2.00'.
          ls_item-width  = '32.00'.
          ls_item-depth  = '22.00'.
          ls_item-quantity = 1.
          ls_item-unit_of_measure = 'CM'.

        WHEN 2.
          ls_item-name = 'Wireless Mouse Logitech'.
          ls_item-description = 'Bluetooth ergonomic mouse'.
          ls_item-price = '45.50'.
          ls_item-height = '4.00'.
          ls_item-width  = '6.00'.
          ls_item-depth  = '10.00'.
          ls_item-quantity = 2.
          ls_item-unit_of_measure = 'CM'.

        WHEN 3.
          ls_item-name = 'Samsung Monitor 27'.
          ls_item-description = '27 inch 4K UHD monitor'.
          ls_item-price = '399.99'.
          ls_item-height = '45.00'.
          ls_item-width  = '62.00'.
          ls_item-depth  = '18.00'.
          ls_item-quantity = 1.
          ls_item-unit_of_measure = 'CM'.

        WHEN 4.
          ls_item-name = 'Mechanical Keyboard Keychron'.
          ls_item-description = 'RGB mechanical keyboard'.
          ls_item-price = '129.90'.
          ls_item-height = '4.00'.
          ls_item-width  = '44.00'.
          ls_item-depth  = '14.00'.
          ls_item-quantity = 1.
          ls_item-unit_of_measure = 'CM'.

      ENDCASE.

      ls_item-release_date = '20240101'.
      ls_item-discontinued_date = '99991231'.

      GET TIME STAMP FIELD ls_item-local_last_changed_at.
      GET TIME STAMP FIELD ls_item-last_changed_at.

      APPEND ls_item TO lt_item.

    ENDDO.

  ENDDO.

*---------------------------------------------------
* INSERT
*---------------------------------------------------
  DELETE FROM zheader_0063_a.
  DELETE FROM zitem_0063_a.

  INSERT zheader_0063_a FROM TABLE @lt_header.
  INSERT zitem_0063_a   FROM TABLE @lt_item.

  COMMIT WORK.

  out->write( 'Headers inserted:' ).
  out->write( 'Items inserted:' ).

  ENDMETHOD.
ENDCLASS.
