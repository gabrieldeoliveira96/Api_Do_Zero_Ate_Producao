inherited dmLogin: TdmLogin
  PixelsPerInch = 96
  inherited DB: TFDConnection
    Connected = True
  end
  object qLogin: TFDQuery
    Connection = DB
    SQL.Strings = (
      'select * from usuario'
      'where LOGIN = :login'
      'and SENHA = :senha')
    Left = 256
    Top = 96
    ParamData = <
      item
        Name = 'LOGIN'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qLoginID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qLoginNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
    object qLoginCPF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 100
    end
    object qLoginDTNASC: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'DTNASC'
      Origin = 'DTNASC'
    end
    object qLoginLOGIN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LOGIN'
      Origin = 'LOGIN'
      Size = 50
    end
    object qLoginSENHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 255
    end
  end
end
