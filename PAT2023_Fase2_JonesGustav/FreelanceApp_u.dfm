object frmFreelanceApp: TfrmFreelanceApp
  AlignWithMargins = True
  Left = 0
  Top = 0
  Caption = 'Freelance Application'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Padding.Left = 15
  Padding.Top = 5
  Padding.Right = 15
  Padding.Bottom = 3
  TextHeight = 15
  object lblTitle: TLabel
    Left = 15
    Top = 5
    Width = 594
    Height = 32
    Align = alTop
    Alignment = taCenter
    Caption = 'Freelance Application'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 247
  end
  object pgcPages: TPageControl
    AlignWithMargins = True
    Left = 18
    Top = 40
    Width = 588
    Height = 348
    ActivePage = tsApply
    Align = alClient
    TabOrder = 0
    object tsApply: TTabSheet
      Caption = 'Apply'
      object lblApplyTitle: TLabel
        Left = 0
        Top = 0
        Width = 580
        Height = 21
        Align = alTop
        Alignment = taCenter
        Caption = 'Enter Information to Apply:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 187
      end
      object Edit1: TEdit
        Left = 0
        Top = 21
        Width = 580
        Height = 297
        Align = alClient
        TabOrder = 0
        Text = 'Edit1'
        ExplicitLeft = 24
        ExplicitTop = 40
        ExplicitWidth = 121
        ExplicitHeight = 23
      end
    end
    object tsCheckout: TTabSheet
      Caption = 'Checkout'
      ImageIndex = 1
    end
  end
  object pnlBottom: TPanel
    AlignWithMargins = True
    Left = 18
    Top = 394
    Width = 588
    Height = 41
    Align = alBottom
    Padding.Top = 6
    Padding.Right = 14
    Padding.Bottom = 6
    TabOrder = 1
    object bmbClose: TBitBtn
      AlignWithMargins = True
      Left = 492
      Top = 7
      Width = 81
      Height = 27
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 0
    end
    object bmbHelp: TBitBtn
      AlignWithMargins = True
      Left = 381
      Top = 7
      Width = 81
      Height = 27
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 30
      Margins.Bottom = 0
      Align = alRight
      Kind = bkHelp
      NumGlyphs = 2
      TabOrder = 1
    end
    object bmbLogin: TBitBtn
      AlignWithMargins = True
      Left = 16
      Top = 7
      Width = 81
      Height = 27
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Login'
      Kind = bkYes
      NumGlyphs = 2
      TabOrder = 2
      ExplicitLeft = 208
    end
    object bmbSignUp: TBitBtn
      AlignWithMargins = True
      Left = 112
      Top = 7
      Width = 81
      Height = 27
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Sign Up'
      Kind = bkAll
      NumGlyphs = 2
      TabOrder = 3
      ExplicitLeft = 208
    end
  end
end
