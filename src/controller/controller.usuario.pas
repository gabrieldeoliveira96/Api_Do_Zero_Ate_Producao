unit controller.usuario;

interface

uses Horse, system.JSON, model.usuario, System.SysUtils, Horse.JWT,
controller.jwt;

procedure usuairo;
procedure Post(Req: THorseRequest; Res: THorseResponse);
procedure Get(Req: THorseRequest; Res: THorseResponse);

implementation

procedure Post(Req: THorseRequest; Res: THorseResponse);
var
  LdmUsuario: TdmUsuario;
begin
  try
    LdmUsuario := TdmUsuario.create(nil);
    try

      res.Send<TJSONObject>(LdmUsuario.Post(TJSONObject.ParseJSONValue(req.Body) as TJSONObject));

    finally
      Res.Status(200);
      FreeAndNil(LdmUsuario);
    end;
  except
    on e: exception do
    begin
      Res.Send(e.Message).Status(400);
      FreeAndNil(LdmUsuario);
    end;

  end;
end;

procedure Get(Req: THorseRequest; Res: THorseResponse);
var
  LdmUsuario: TdmUsuario;
begin
  try
    LdmUsuario := TdmUsuario.create(nil);
    try

      res.Send<TJSONObject>(LdmUsuario.Get(strtointDef(req.Params.Items['id'],-1)));

    finally
      Res.Status(200);
      FreeAndNil(LdmUsuario);
    end;
  except
    on e: exception do
    begin
      Res.Send(e.Message).Status(400);
      FreeAndNil(LdmUsuario);
    end;

  end;
end;



procedure usuairo;
begin
  THorse
    .AddCallback(HorseJWT(controller.jwt.JwtPassword))
    .Get('/usuario/:id', Get);
  THorse
    .AddCallback(HorseJWT(controller.jwt.JwtPassword))
    .Post('/usuario', Post);
end;


end.
