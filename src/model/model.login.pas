unit model.login;

interface

uses
  System.SysUtils, System.Classes, model.con, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, System.JSON, DataSet.Serialize;

type
  TdmLogin = class(TdmCon)
    qLogin: TFDQuery;
    qLoginID: TFDAutoIncField;
    qLoginNOME: TStringField;
    qLoginCPF: TStringField;
    qLoginDTNASC: TDateTimeField;
    qLoginLOGIN: TStringField;
    qLoginSENHA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    function Login(ABody:TJSONObject):TJSONObject;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmLogin }

function TdmLogin.Login(ABody: TJSONObject): TJSONObject;
begin

  qLogin.ParamByName('login').AsString:= ABody.GetValue<string>('login');
  qLogin.ParamByName('senha').AsString:= ABody.GetValue<string>('senha');
  qLogin.Open();

  Result:= qLogin.ToJSONObject;

end;

end.
