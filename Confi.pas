unit Confi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, clipbrd,

  Winapi.Hooks;

type
  TForm2 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
    FHook: THook;
    procedure Hooking;
  public
    { Public declarations }
  end;

  Dref = class
    FB:  TForm;
    TextK: String;

    constructor Create;
  end;



var
  Form2: TForm2;
  But: array[0..100] of Dref;
  Frm: array[0..100] of TFORM;
  bl: Boolean;
  Helem: array of Dref;
  Razr:boolean;

implementation

{$R *.dfm}

uses Macros;

Procedure TForm2.Hooking;
begin
  FHook := THookInstance<TLowLevelKeyboardHook>.CreateHook(Self);
  FHook.OnPreExecuteRef := procedure(Hook: THook; var HookMsg: THookMessage)
    var
      LLKeyBoardHook: TLowLevelKeyboardHook;
      ScanCode: integer;
    begin
      LLKeyBoardHook := TLowLevelKeyboardHook(Hook);

      if LLKeyBoardHook.LowLevelKeyStates.KeyState <> ksKeyDown then
        exit;

      ScanCode := LLKeyBoardHook.KeyName.ScanCode;

      if ScanCode = 89 then begin
        HookMsg.Result := 1;
        Timer1.Enabled := not Timer1.Enabled;
      end;

//      if not(ScanCode in [VK_NUMPAD0 .. VK_NUMPAD9, VK_0 .. VK_9]) then
//      begin
//        Caption := 'Got ya! Key [' + LLKeyBoardHook.KeyName.KeyExtName + '] blocked.';
//        HookMsg.Result := 1;
//      end
//      else
//        Caption := '';
    end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);

begin

//  mouse_event(MOUSEEVENTF_LEFTDOWN,A.X,A.Y,0,0);
//  mouse_event(MOUSEEVENTF_LEFTUP,A.X,A.Y,0,0);
end;

constructor Dref.Create;
begin
  FB := TForm.Create(Form1);
  FB.Top := 50;
  FB.Left := 50;
  FB.Height := 20;
  FB.Width := 200;
  FB.Show;
  FB.BorderIcons := [];
  FB.BorderStyle := bsNone;
  FB.Tag := Length(Helem);
  FB.OnMouseDown := Form2.FormMouseDown;
end;



procedure TForm2.Button1Click(Sender: TObject);
//const
//  Captions: array [Boolean] of string = ('Decativate', 'Active');
begin
//  FHook.Active := not FHook.Active;
//  Button1.Caption := Captions[not FHook.Active];
  SetLength(Helem,Length(Helem) + 1);
  Helem[Length(Helem)] := Dref.Create;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  FHook.Active := true;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  Hooking;

//  ShowMessage(Clipboard.asText);
//   Form1.
   bl := true;
end;




procedure TForm2.FormDestroy(Sender: TObject);
begin

  FHook.Active := false;
end;



procedure TForm2.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Sender as TForm).Tag = 1 then
    SHowMessage('Работает');

end;

end.
