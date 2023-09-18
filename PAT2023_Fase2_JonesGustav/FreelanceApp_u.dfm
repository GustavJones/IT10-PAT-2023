object frmFreelanceApp: TfrmFreelanceApp
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
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 247
  end
  object pgcPages: TPageControl
    Left = 15
    Top = 37
    Width = 594
    Height = 360
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 32
    ExplicitWidth = 608
    ExplicitHeight = 401
  end
  object pnlBottom: TPanel
    Left = 15
    Top = 397
    Width = 594
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 344
    ExplicitTop = -8
    ExplicitWidth = 185
    object bmbClose: TBitBtn
      Left = 504
      Top = 6
      Width = 81
      Height = 25
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 0
    end
  end
end
