object frmApplicationInformation: TfrmApplicationInformation
  Left = 715
  Top = 415
  BorderStyle = bsDialog
  Caption = 'Application Information'
  ClientHeight = 351
  ClientWidth = 216
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 25
  object lblStatusHeading: TLabel
    Left = 8
    Top = 24
    Width = 54
    Height = 25
    Caption = 'Status:'
  end
  object lblLinesOfCode: TLabel
    Left = 8
    Top = 72
    Width = 121
    Height = 25
    Caption = 'Lines Of Code:'
  end
  object lblComments: TLabel
    Left = 8
    Top = 120
    Width = 94
    Height = 25
    Caption = 'Comments:'
  end
  object lblStatus: TLabel
    Left = 91
    Top = 24
    Width = 94
    Height = 25
    Caption = 'In Progress'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object redComments: TRichEdit
    Left = 8
    Top = 160
    Width = 200
    Height = 139
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object bmbClose: TBitBtn
    Left = 62
    Top = 318
    Width = 83
    Height = 25
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 1
  end
end
