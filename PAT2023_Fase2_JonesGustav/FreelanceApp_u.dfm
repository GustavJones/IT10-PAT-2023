object frmFreelanceApp: TfrmFreelanceApp
  AlignWithMargins = True
  Left = 0
  Top = 0
  Caption = 'Freelance Application'
  ClientHeight = 762
  ClientWidth = 988
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
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
    Width = 958
    Height = 37
    Align = alTop
    Alignment = taCenter
    Caption = 'Freelance Application'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 278
  end
  object pgcPages: TPageControl
    AlignWithMargins = True
    Left = 18
    Top = 45
    Width = 952
    Height = 664
    ActivePage = tsHome
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 948
    ExplicitHeight = 663
    object tsHome: TTabSheet
      Caption = 'Home'
      ImageIndex = 2
      object imgHomeImage: TImage
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 938
        Height = 628
        Align = alClient
        ExplicitLeft = 488
        ExplicitTop = 360
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
      object bmbSignUp: TBitBtn
        Left = 180
        Top = 583
        Width = 584
        Height = 41
        Margins.Left = 180
        Margins.Top = 0
        Margins.Right = 180
        Margins.Bottom = 10
        Align = alCustom
        Caption = 'Sign Up'
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
      end
      object bmbLogin: TBitBtn
        Left = 180
        Top = 532
        Width = 584
        Height = 41
        Margins.Left = 180
        Margins.Top = 0
        Margins.Right = 180
        Margins.Bottom = 10
        Align = alCustom
        Caption = 'Log In'
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object tsApply: TTabSheet
      Caption = 'Apply'
      object lblApplyTitle: TLabel
        Left = 0
        Top = 0
        Width = 944
        Height = 25
        Align = alTop
        Alignment = taCenter
        Caption = 'Enter Information to Apply:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitWidth = 227
      end
      object pnlApplyBottom: TPanel
        AlignWithMargins = True
        Left = 3
        Top = 588
        Width = 938
        Height = 43
        Align = alBottom
        TabOrder = 0
        object btnApplyNext: TButton
          AlignWithMargins = True
          Left = 787
          Top = 6
          Width = 143
          Height = 31
          Margins.Left = 0
          Margins.Top = 5
          Margins.Right = 7
          Margins.Bottom = 5
          Align = alRight
          Caption = 'Next Page'
          TabOrder = 0
        end
      end
      object edtDescription: TEdit
        AlignWithMargins = True
        Left = 25
        Top = 63
        Width = 894
        Height = 29
        Margins.Left = 25
        Margins.Right = 25
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TextHint = 'Description'
      end
      object edtTaskName: TEdit
        AlignWithMargins = True
        Left = 25
        Top = 28
        Width = 894
        Height = 29
        Margins.Left = 25
        Margins.Right = 25
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        TextHint = 'Application Name:'
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
    Top = 715
    Width = 952
    Height = 41
    Align = alBottom
    Padding.Top = 6
    Padding.Right = 14
    Padding.Bottom = 6
    TabOrder = 1
    ExplicitTop = 714
    ExplicitWidth = 948
    object bmbClose: TBitBtn
      AlignWithMargins = True
      Left = 856
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
      ExplicitLeft = 852
    end
    object bmbHelp: TBitBtn
      AlignWithMargins = True
      Left = 745
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
      ExplicitLeft = 741
    end
  end
end
