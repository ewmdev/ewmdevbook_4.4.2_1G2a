class ZCL_IM_ERP_MAPIN definition
  public
  final
  create public .

public section.

  interfaces /SCWM/IF_EX_MAPIN_OD_SAVEREPL .
  interfaces IF_BADI_INTERFACE .
protected section.
private section.

  constants C_FIELDNAME type NAME_FELD value 'ZZFIELD1'.
ENDCLASS.



CLASS ZCL_IM_ERP_MAPIN IMPLEMENTATION.


  METHOD /scwm/if_ex_mapin_od_saverepl~mapin.

    BREAK-POINT ID zewmdevbook_1g2a.

    LOOP AT ct_dlv_request
    ASSIGNING FIELD-SYMBOL(<fs_dlv_req>).
      LOOP AT <fs_dlv_req>-t_item
      ASSIGNING FIELD-SYMBOL(<fs_item>).
        DATA(ls_keymap) = VALUE #( <fs_item>-t_keymap_item[ 1 ] ).
        CHECK sy-subrc IS INITIAL.
        DATA(lv_vbeln) = ls_keymap-docno.
        DATA(lv_posnr) = ls_keymap-itemno.
        TRY.
            DATA(ls_bapiext) = VALUE #( it_bapi_extension2[ param = lv_vbeln
                                                            row   = lv_posnr
                                                            field = c_fieldname ] ).
          CATCH cx_sy_itab_line_not_found.
            CONTINUE.
        ENDTRY.
        MOVE ls_bapiext-value TO <fs_item>-s_eew-zzfield1.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
