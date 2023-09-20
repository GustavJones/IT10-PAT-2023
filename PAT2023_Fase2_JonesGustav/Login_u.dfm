object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Log In'
  ClientHeight = 211
  ClientWidth = 184
  Color = clBtnFace
  Constraints.MaxHeight = 250
  Constraints.MaxWidth = 200
  Constraints.MinHeight = 250
  Constraints.MinWidth = 200
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 15
  object pnlSignUp: TPanel
    AlignWithMargins = True
    Left = 4
    Top = 4
    Width = 176
    Height = 203
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 576
    ExplicitHeight = 353
    DesignSize = (
      176
      203)
    object lblLogIn: TLabel
      Left = 32
      Top = 6
      Width = 103
      Height = 47
      Caption = 'Log In'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -36
      Font.Name = 'Sylfaen'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtUsername: TEdit
      AlignWithMargins = True
      Left = 12
      Top = 63
      Width = 152
      Height = 31
      Margins.Left = 158
      Margins.Top = 7
      Margins.Right = 158
      Margins.Bottom = 7
      Anchors = [akTop]
      AutoSize = False
      BevelKind = bkFlat
      Constraints.MaxHeight = 32
      Constraints.MaxWidth = 263
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TextHint = 'Enter Username:'
    end
    object edtPassword: TEdit
      AlignWithMargins = True
      Left = 12
      Top = 112
      Width = 152
      Height = 31
      Margins.Left = 158
      Margins.Top = 7
      Margins.Right = 158
      Margins.Bottom = 7
      Anchors = [akTop]
      AutoSize = False
      BevelKind = bkFlat
      Constraints.MaxHeight = 32
      Constraints.MaxWidth = 263
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      TextHint = 'Enter Password:'
    end
    object btnLogIn: TButton
      Left = 32
      Top = 153
      Width = 105
      Height = 32
      Caption = 'Log In!'
      Default = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Source Code Pro'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
end
