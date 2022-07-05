class ZCL_IM_EI_ODLV_EXTEND definition
  public
  final
  create public .

public section.

  interfaces IF_EX_SMOD_V50B0001 .
protected section.
private section.

  constants C_FIELDNAME type NAME_FELD value 'ZZFIELD1' ##NO_TEXT.
  constants C_FIELDVALUE type CHAR255 value 'A' ##NO_TEXT.
ENDCLASS.



CLASS ZCL_IM_EI_ODLV_EXTEND IMPLEMENTATION.


  method IF_EX_SMOD_V50B0001~EXIT_SAPLV50I_001.
  endmethod.


  method IF_EX_SMOD_V50B0001~EXIT_SAPLV50I_002.
  endmethod.


  METHOD if_ex_smod_v50b0001~exit_saplv50i_003.

    BREAK bpinst.

  ENDMETHOD.


  method IF_EX_SMOD_V50B0001~EXIT_SAPLV50I_004.
  endmethod.


  method IF_EX_SMOD_V50B0001~EXIT_SAPLV50I_009.
  endmethod.


  method IF_EX_SMOD_V50B0001~EXIT_SAPLV50I_010.
  endmethod.


  method IF_EX_SMOD_V50B0001~EXIT_SAPLV50K_005.
  endmethod.


  method IF_EX_SMOD_V50B0001~EXIT_SAPLV50K_006.
  endmethod.


  METHOD if_ex_smod_v50b0001~exit_saplv50k_007.

* Fill extension structure
* Simple example with one field per item only
    BREAK bpinst.

    LOOP AT it_lips ASSIGNING FIELD-SYMBOL(<fs_lips>).
      DATA(ls_bapiext) = VALUE bapiext( param = <fs_lips>-vbeln
                                        row   = <fs_lips>-posnr
                                        field = c_fieldname
                                        value = c_fieldvalue ).
      APPEND ls_bapiext TO et_extension2.
      CLEAR ls_bapiext.
    ENDLOOP.

  ENDMETHOD.


  method IF_EX_SMOD_V50B0001~EXIT_SAPLV50K_008.
  endmethod.


  METHOD if_ex_smod_v50b0001~exit_saplv50k_011.
  ENDMETHOD.


  method IF_EX_SMOD_V50B0001~EXIT_SAPLV50K_012.
  endmethod.


  method IF_EX_SMOD_V50B0001~EXIT_SAPLV50K_013.
  endmethod.
ENDCLASS.
