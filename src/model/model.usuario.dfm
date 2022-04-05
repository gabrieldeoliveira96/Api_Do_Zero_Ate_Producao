inherited dmUsuario: TdmUsuario
  PixelsPerInch = 96
  inherited DB: TFDConnection
    Connected = True
    Left = 112
    Top = 64
  end
  object qUsuario: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select * from usuario')
    Left = 176
    Top = 88
  end
end
