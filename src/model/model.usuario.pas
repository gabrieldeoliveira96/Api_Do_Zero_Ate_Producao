unit model.usuario;

interface

uses
  System.SysUtils, System.Classes, model.con, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.ConsoleUI.Wait, Data.DB,
  FireDAC.Comp.Client, System.JSON, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  DataSet.Serialize;

type
  TdmUsuario = class(TdmCon)
    qUsuario: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function Post(ABody:TJSONObject):TJSONObject;
    function Get(AIdUsuario:integer):TJSONObject;
  end;


implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmUsuario }

function TdmUsuario.Get(AIdUsuario: integer): TJSONObject;
begin
  qUsuario.SQL.Add(' where id = :id');
  qUsuario.ParamByName('id').AsInteger:= AIdUsuario;
  qUsuario.Open;
  Result:= qUsuario.ToJSONObject;
end;

function TdmUsuario.Post(ABody: TJSONObject): TJSONObject;
begin
  qUsuario.Open;
  qUsuario.LoadFromJSON(ABody);
  qUsuario.Last;
  Result:= qUsuario.ToJSONObject;

end;

end.
