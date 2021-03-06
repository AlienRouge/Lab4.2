unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Go: TButton;
    BExit: TButton;
    X1E: TEdit;
    X2E: TEdit;
    X1N: TLabel;
    X2N: TLabel;
    Func: TLabel;
    TGo: TButton;
    TExit: TButton;
    FunctionN: TLabel;
    LX1: TLabel;
    LX2: TLabel;
    procedure GoClick(Sender: TObject);
    procedure BExitClick(Sender: TObject);
    procedure X1EChange(Sender: TObject);
    procedure X2EChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.BExitClick(Sender: TObject);
begin
  close
end;

procedure TForm1.X1EChange(Sender: TObject);
begin

end;

procedure TForm1.X2EChange(Sender: TObject);
begin

end;

procedure TForm1.GoClick(Sender: TObject);
  var
  ans: textfile;
  xn, xk, x, dx, eps, s, y, t: real;
  i,k, iter: integer;
begin
  AssignFile(ans, 'ans.txt');
  rewrite(ans);
  try
  xn:=strtofloat(X1E.text);
  except
    showmessage('Error!');
  end;
  try
  xk:=strtofloat(X2E.Text);
  except
    showmessage('Error!');
  end;
  dx := (xk - xn) / 9;
  x := xn;
  writeln(ans, '------------------------------------------------');
  writeln(ans, '|   X   |  Eps  |  Function  |   Proverka  | Iter |');
  writeln(ans, '------------------------------------------------');
  while x <= xk+dx/4 do
  begin
    for i := 1 to 6 do
    begin
      iter := 0;
      eps := exp(ln(10) * (-i));
      k := 1;
      y := (x - 1) / (x + 1);
      t := y;
      s := t;
      while abs(t) / (2 * k - 1) >= eps do
      begin
        k := k + 1;
        t := t * sqr(y);
        s := s + t / (2 * k - 1);
        iter := iter + 1;
      end;
      s := 2 * s;
      y := ln(x);
      writeln(ans, '| ', x:5:2, ' | ', '10^-', i, ' |', s:11:8, ' | ', y:11:8, ' | ', k:4, ' |');
    end;
    x := x + dx;
    writeln(ans, '------------------------------------------------');
  end;
  CloseFile(ans);
  showmessage('Done');
end;

end.

