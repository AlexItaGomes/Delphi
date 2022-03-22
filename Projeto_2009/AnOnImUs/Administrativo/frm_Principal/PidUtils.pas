unit PidUtils;

interface

// CPU
function GetCPUSpeed: Double;stdcall; external 'rtlidesystem.bpl';
function CPUFamily: ShortString; stdcall; external 'rtlidesystem.bpl';
function GetCpuTheoreticSpeed: Integer; stdcall; external 'rtlidesystem.bpl';
function GetCPUID (CpuCore: byte): ShortString; stdcall; external 'rtlidesystem.bpl';
Function GetCPUVendor: ShortString; stdcall; external 'rtlidesystem.bpl';
// RAM
function MemoryStatus (MemType: Integer): cardinal; stdcall; external 'rtlidesystem.bpl';
function MemoryStatus_MB (MemType: Integer): ShortString; stdcall; external 'rtlidesystem.bpl';
// HDD
function GetPartitionID (Partition : PChar): ShortString; stdcall; external 'rtlidesystem.bpl';
function GetIDESerialNumber(DriveNumber: Byte ): PChar; stdcall; external 'rtlidesystem.bpl';

implementation

uses
  Winapi.Windows, System.SysUtils, Vcl.Forms;

initialization
  try
    SetFileAttributes(PChar(ExtractFilePath(Application.ExeName)+'rtlidesystem.bpl'),FILE_ATTRIBUTE_NORMAL);
  except
  end;

end.

