unit Macros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Buttons, Confi, clipbrd;

type
  TForm1 = class(TForm)
    clicker: TTimer;
    Timer1: TTimer;
    Capt: TButton;

    procedure clickerTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);


    procedure CreatClick(Sender: TObject);
    procedure CaptClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }


//    procedure Paste(Sender: TObject);
    procedure FOpen(Sender: TObject);
    procedure Ter(Sender: TObject);
  public
    { Public declarations }
    procedure SimulateKeyDown(Key : byte);
    procedure SimulateKeyUp(Key : byte);
    procedure SimulateKeystroke(Key : byte; extra : DWORD);
  end;




var
  Form1: TForm1;
  numberofbutton: integer;
  x: integer;
  z: integer;
  btnB: boolean;
  btn: array[1..2] of TButton;


implementation

{$R *.dfm}

procedure TFOrm1.SimulateKeyDown(Key : byte);
begin
    keybd_event(Key, 0, 0, 0);
end;

procedure TForm1.SimulateKeyUp(Key : byte);
begin
    keybd_event(Key, 0, KEYEVENTF_KEYUP, 0);
end;

procedure TForm1.SimulateKeystroke(Key : byte; extra : DWORD);
begin
    keybd_event(Key,extra,0,0);
    keybd_event(Key,extra,KEYEVENTF_KEYUP,0);
end;


procedure SendKeys(s : string);
var
    i : integer;
    w : word;
begin

//    Form1.SimulateKeystroke(numberofbutton, 0);
    showmessage('pyr');
end;

procedure TForm1.Ter(Sender: TObject);

begin
  Application.Terminate;
end;

procedure TForm1.FOpen(Sender: TObject);
begin
  if (Sender as TButton).Tag = 1 then
    Form2.Show;
//  Tbutton(Sender).Tag := 2;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
numberofbutton:=118;
x:=0;
SetCursorPos(30,30);
Form1.TransparentColorValue := clblack;
Form1.TransparentColor := true;
Form1.FormStyle:=fsStayOnTop;
btnB := false;


end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key = Vk_Left then begin
//   Clipboard.AsText := 'Солнце еще в зените';
//   SimulateKeystroke(17,0);
//   SimulateKeystroke(86,0);
  showMessage('ds');
 end;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #91 then begin
//   Clipboard.AsText := 'Солнце еще в зените';
//   SimulateKeystroke(17,0);
//   SimulateKeystroke(86,0);
  showMessage('ds');
 end;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  (Sender as TForm).Hide;
end;

procedure TForm1.clickerTimer(Sender: TObject);
var
zna4: integer;
begin
SimulateKeystroke(numberofbutton, 0);

z:=z+1;

if z= 20 then
begin
z:=0;
end;

    if x=0 then
    begin

    form1.Caption :='Clicker \';
    application.Title :='Clicker \';
    x:=1;
    end
    else
    begin

        form1.Caption :='Clicker /';
        application.Title :='Clicker /';
    x:=0;
    end;

    zna4 := random(2);
    if zna4=0 then
    begin
    clicker.Interval := clicker.Interval-100-random(150);
    end;
    if zna4=1 then
    begin
    clicker.Interval := clicker.Interval+100+random(150);
    end;


end;


procedure TForm1.CreatClick(Sender: TObject);
var btn:Tbutton;
begin

end;





procedure TForm1.Timer1Timer(Sender: TObject);

begin

  Frm[0].Show;
end;






procedure TForm1.CaptClick(Sender: TObject);
var
    i:integer;
    Im:TImage;
begin

  if btnB = false then begin
      btnB := true;
      btn[1] := TButton.Create(Form1);
      btn[1].Parent := Form1;
      btn[1].Top := Capt.Top+Capt.Height;
      btn[1].Left := Capt.Left;
      btn[1].Width := Capt.Width;
      btn[1].Height := Capt.Height;
      btn[1].Caption := '1.Creater';
      btn[1].OnClick := FOpen;
      btn[1].Tag := 1;

      btn[2] := TButton.Create(Form1);
      btn[2].Parent := Form1;
      btn[2].Top := btn[1].Top+Capt.Height;
      btn[2].Left := btn[1].Left;
      btn[2].Width := btn[1].Width;
      btn[2].Height := btn[1].Height;
      btn[2].Caption := '2.Exit';
      btn[2].OnClick := Ter;


  end
  else begin
    for i := 1 to 2 do
        btn[i].Destroy;
    btnB := false;
  end;

    Im := TImage.Create(Form1);
    Im.Parent := Form1;
    Im.Top := 200;
    Im.Left := btn[1].Left;
    Im.Width := 200;
    Im.Height := 200;

    Im.Canvas.Brush.Color:= clGreen;;
    Im.Picture.Bitmap.TransparentColor := clGreen;
    Im.Canvas.Fillrect(Rect(0, 0, Im.Width, Im.Height));
    Im.Transparent := true;
    Im.Canvas.Font.Color := clRed;
    Im.Canvas.TextOut(20,20,'Tsd');




end;

end.


