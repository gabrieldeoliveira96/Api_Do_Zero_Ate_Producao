unit Main.Service;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, Horse,
  controller.login, controller.usuario, Horse.Jhonson;

type
  TGosComponents_Service = class(TService)
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  GosComponents_Service: TGosComponents_Service;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  GosComponents_Service.Controller(CtrlCode);
end;

function TGosComponents_Service.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TGosComponents_Service.ServiceCreate(Sender: TObject);
begin
  THorse.Use(Jhonson());

  Login;
  usuairo;

end;

procedure TGosComponents_Service.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  THorse.Listen(9000);
  Started := True;

end;

procedure TGosComponents_Service.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  THorse.StopListen;
  Stopped := True;

end;

end.
