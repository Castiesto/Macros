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
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    FHook: THook;
    procedure Hooking;
  public
    { Public declarations }

  end;

  Dref = class
    ImB:  TImage;
    TextK: String;

    constructor Create(o: Dref);

  end;



var
  Form2: TForm2;
  But: array[0..100] of Dref;

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

      if ScanCode = 70 then begin
        HookMsg.Result := 1;
        Form1.SimulateKeyDown(17);
        Form1.SimulateKeystroke(86,0);
        Form1.SimulateKeyUp(17);
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

constructor Dref.Create(o: Dref);
begin
//  ImB.Create();
end;



procedure TForm2.Button1Click(Sender: TObject);
//const
//  Captions: array [Boolean] of string = ('Decativate', 'Active');
begin
//  FHook.Active := not FHook.Active;
//  Button1.Caption := Captions[not FHook.Active];
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

end;


procedure TForm2.FormDestroy(Sender: TObject);
begin
  FHook.Active := false;
end;

end.
