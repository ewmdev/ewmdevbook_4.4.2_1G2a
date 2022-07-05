class ZCL_IM_ERP_MAPIN definition
  public
  final
  create public .

public section.

  interfaces /SCWM/IF_EX_MAPIN_OD_SAVEREPL .
  interfaces IF_BADI_INTERFACE .
protected section.
private section.

  constants C_FIELDNAME type NAME_FELD value 'ZZFIELD1'. ##NO_TEXT.
ENDCLASS.



CLASS ZCL_IM_ERP_MAPIN IMPLEMENTATION.


  METHOD /scwm/if_ex_mapin_od_saverepl~mapin.

    BREAK-POINT ID zewmdevbook_442.
    LOOP AT ct_dlv_request
    ASSIGNING FIELD-SYMBOL(<fs_dlv_req>).
      LOOP AT <fs_dlv_req>-t_item
      ASSIGNING FIELD-SYMBOL(<fs_item>).
        DATA(ls_keymap) = VALUE #( <fs_item>-t_keymap_item[ 1 ] ).
        CHECK sy-subrc IS INITIAL.
        DATA(lv_vbeln) = ls_keymap-docno.
        DATA(lv_posnr) = ls_keymap-itemno.
        READ TABLE it_bapi_extension2
        ASSIGNING FIELD-SYMBOL(<fs_bapiext>)
        WITH KEY param = lv_vbeln
        row = lv_posnr
        field = c_fieldname.
        CHECK sy-subrc IS INITIAL.
        MOVE <fs_bapiext>-value TO <fs_item>-s_eew-zzfield1.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
