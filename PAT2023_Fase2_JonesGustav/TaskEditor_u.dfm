object frmTaskEditor: TfrmTaskEditor
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Task Editor'
  ClientHeight = 415
  ClientWidth = 404
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 25
  object lblProjectName: TLabel
    Left = 8
    Top = 16
    Width = 266
    Height = 25
    Caption = 'Project Name: $PROJECT NAME'
  end
  object lblDescription: TLabel
    Left = 8
    Top = 64
    Width = 169
    Height = 25
    Caption = 'Project Description: '
  end
  object lblLinesOfCode: TLabel
    Left = 8
    Top = 264
    Width = 126
    Height = 25
    Caption = 'Lines Of Code: '
  end
  object lblComments: TLabel
    Left = 8
    Top = 160
    Width = 99
    Height = 25
    Caption = 'Comments: '
  end
  object sedLinesOfCode: TSpinEdit
    Left = 153
    Top = 261
    Width = 121
    Height = 35
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 0
  end
  object redDescription: TRichEdit
    Left = 8
    Top = 95
    Width = 385
    Height = 50
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      'This will Contain the user description (ReadOnly)')
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object chkCompleted: TCheckBox
    Left = 89
    Top = 320
    Width = 185
    Height = 17
    Caption = 'Project Completed'
    TabOrder = 2
  end
  object btnSave: TButton
    Left = 265
    Top = 360
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 3
  end
  object redComments: TRichEdit
    Left = 8
    Top = 191
    Width = 385
    Height = 50
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      'This will Contain the developer comments')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object bmbReset: TBitBtn
    AlignWithMargins = True
    Left = 26
    Top = 360
    Width = 81
    Height = 25
    Margins.Left = 7
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 5
    Caption = 'Reset'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 5
  end
end