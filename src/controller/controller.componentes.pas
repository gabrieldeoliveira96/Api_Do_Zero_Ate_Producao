unit controller.componentes;

interface

uses Horse, model.componentes, Horse.JWT, controller.jwt, System.json,
System.SysUtils;

procedure componentes;

implementation


procedure Get(Req: THorseRequest; Res: THorseResponse);
var
  LdmComponentes: TdmComponentes;
begin
  try
    LdmComponentes := TdmComponentes.create(nil);
    try

      res.Send<TJSONObject>(LdmComponentes.Get(strtointDef(req.Params.Items['id'],-1)));

    finally
      Res.Status(200);
      FreeAndNil(LdmComponentes);
    end;
  except
    on e: exception do
    begin
      Res.Send(e.Message).Status(400);
      FreeAndNil(LdmComponentes);
    end;

  end;
end;


procedure componentes;
begin
  THorse
    .AddCallback(HorseJWT(controller.jwt.JwtPassword))
    .Get('/componentes/:id', Get);
  THorse
    .AddCallback(HorseJWT(controller.jwt.JwtPassword))
    .Post('/componentes', Post);
end;


end.
