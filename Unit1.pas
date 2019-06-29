unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Buttons, Confi;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    clicker: TTimer;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label3: TLabel;
    Button3: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Timer1: TTimer;
    Capt: TButton;

    procedure clickerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);


    procedure CreatClick(Sender: TObject);
    procedure CaptClick(Sender: TObject);

  private
    { Private declarations }
    procedure Ter(Sender: TObject);
//    procedure Paste(Sender: TObject);
    procedure FOpen(Sender: TObject);
  public
    { Public declarations }
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
             procedure SimulateKeyDown(Key : byte);
begin
    keybd_event(Key, 0, 0, 0);
end;

procedure SimulateKeyUp(Key : byte);
begin
    keybd_event(Key, 0, KEYEVENTF_KEYUP, 0);
end;

procedure SimulateKeystroke(Key : byte; extra : DWORD);
begin
    keybd_event(Key,extra,0,0);
    keybd_event(Key,extra,KEYEVENTF_KEYUP,0);
end;


procedure SendKeys(s : string);
var
    i : integer;
    w : word;
begin

    SimulateKeystroke(numberofbutton, 0);
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


procedure TForm1.clickerTimer(Sender: TObject);
var
zna4: integer;
begin
SimulateKeystroke(numberofbutton, 0);

z:=z+1;
label5.caption :=  inttostr(z);
if z= 20 then
begin
z:=0;
clicker.Interval:= strtoint(Edit1.Text)*1000+100;
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


label3.caption:=IntToStr(clicker.Interval);
end;


procedure TForm1.CreatClick(Sender: TObject);
var btn:Tbutton;
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
numberofbutton:=118;
x:=0;
SetCursorPos(30,30);
//Form1.Color := clRed;
Form1.TransparentColorValue := clblack;
Form1.TransparentColor := true;
Form1.FormStyle:=fsStayOnTop;
btnB := false;




end;



procedure TForm1.Timer1Timer(Sender: TObject);
begin
mouse_event(MOUSEEVENTF_RightDOWN,30,30,0,0);
mouse_event(MOUSEEVENTF_LEFTUP,30,30,0,0);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
clicker.Enabled:=true;
label3.Caption :=inttostr(strtoint(edit1.text)*1000+100);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
clicker.Enabled:=false;
end;




procedure TForm1.Button3Click(Sender: TObject);
begin
    if edit1.Text <> '' then
    clicker.Interval := strtoint(edit1.Text)*1000+100;

    if edit1.Text <> '' then
    numberofbutton:=91;
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


