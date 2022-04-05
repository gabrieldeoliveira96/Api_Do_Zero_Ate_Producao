program GosComponents_Servico;

uses
  Vcl.SvcMgr,
  Main.Service in 'src\Main.Service.pas' {GosComponents_Service: TService},
  controller.jwt in '..\src\controller\controller.jwt.pas',
  controller.login in '..\src\controller\controller.login.pas',
  controller.usuario in '..\src\controller\controller.usuario.pas',
  model.con in '..\src\model\model.con.pas' {dmCon: TDataModule},
  model.login in '..\src\model\model.login.pas' {dmLogin: TDataModule},
  model.usuario in '..\src\model\model.usuario.pas' {dmUsuario: TDataModule};

{$R *.RES}

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  Application.CreateForm(TGosComponents_Service, GosComponents_Service);
  Application.Run;
end.
