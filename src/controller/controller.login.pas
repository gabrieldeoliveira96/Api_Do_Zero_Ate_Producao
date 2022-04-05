unit controller.login;

interface

uses Horse, model.login, System.SysUtils, System.JSON, Horse.Jhonson,
Horse.JWT, JOSE.Core.JWT, JOSE.Core.Builder, System.DateUtils, controller.jwt;

procedure login;
procedure Get(Req: THorseRequest; Res: THorseResponse);

function CriarToken(AIdUsuario:integer):string;

implementation


procedure login;
begin
  THorse.Get('/login', Get);
end;

procedure Get(Req: THorseRequest; Res: THorseResponse);
var
  LDmLogin: TdmLogin;
  LJson:TJSONObject;
begin
  try
    LDmLogin := TdmLogin.create(nil);
    try
      LJson:= LDmLogin.login(TJSONObject.ParseJSONValue(Req.Body) as TJSONObject);

      LJson.AddPair('jwt',CriarToken(LJson.GetValue<integer>('id')));

      res.Send<TJSONObject>(LJson);

    finally
      Res.Status(200);
      FreeAndNil(LDmLogin);
    end;
  except
    on e: exception do
    begin
      Res.Send(e.Message).Status(400);
      FreeAndNil(LDmLogin);
    end;

  end;
end;

function CriarToken(AIdUsuario:integer):string;
var
 LJWT: TJWT;
 LToken: String;
 LClaims: TMyClaims;
begin
  LJWT := TJWT.Create(TMyClaims);
  try
    LClaims := TMyClaims(LJWT.Claims);

    // Enter the payload data
    LClaims.Expiration := IncHour(Now, 1);
    LClaims.Id:= AIdUsuario.ToString;

    // Generating the token
    LToken := TJOSE.SHA256CompactToken(controller.jwt.JwtPassword, LJWT);
  finally
    FreeAndNil(LJWT);
  end;

  Result:= LToken;

end;


end.
