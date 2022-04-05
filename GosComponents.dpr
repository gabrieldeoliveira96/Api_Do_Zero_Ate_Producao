program GosComponents;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson,
  controller.login in 'src\controller\controller.login.pas',
  model.con in 'src\model\model.con.pas' {dmCon: TDataModule},
  model.login in 'src\model\model.login.pas' {dmLogin: TDataModule},
  controller.jwt in 'src\controller\controller.jwt.pas',
  controller.usuario in 'src\controller\controller.usuario.pas',
  model.usuario in 'src\model\model.usuario.pas' {dmUsuario: TDataModule},
  controller.componentes in 'src\controller\controller.componentes.pas',
  model.componentes in 'src\model\model.componentes.pas' {dmComponentes: TDataModule};

begin
  THorse.Use(Jhonson());

  controller.login.Login;
  controller.usuario.usuairo;

  THorse.Listen(9000);

end.
