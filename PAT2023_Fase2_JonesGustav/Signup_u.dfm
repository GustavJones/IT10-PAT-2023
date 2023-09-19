object frmSignup: TfrmSignup
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Sign Up'
  ClientHeight = 261
  ClientWidth = 384
  Color = clBtnFace
  Constraints.MaxHeight = 300
  Constraints.MaxWidth = 400
  Constraints.MinHeight = 300
  Constraints.MinWidth = 400
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object edtUsername: TEdit
    Left = 56
    Top = 40
    Width = 121
    Height = 23
    TabOrder = 0
    TextHint = 'Enter Username:'
  end
  object edtPassword: TEdit
    Left = 56
    Top = 96
    Width = 121
    Height = 23
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    TextHint = 'Enter Password:'
  end
end
