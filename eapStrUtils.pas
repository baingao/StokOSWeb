unit eapStrUtils;

{*******************************************************************************
  Jangan lupa kalau ada unit JclStrings di paket JCL. Lihat help JCL!
*******************************************************************************}

interface

uses
  SysUtils, Classes, StrUtils;

const
  CRLF = #13#10;

type
  TStringArray= array of String;

//bernilai true jika Str adalah angka
function IsNumber(Str: string): boolean;

//bernilai true jika Str adalah string kosong. string yg berisi spasi saja juga dianggap kosong
function StrIsEmpty(Str: string): boolean;

//hitung jumlah baris pada string yg berformat: line1+#13#10+line2+#13+#10+line3...
function LineCountCRLF(Text: string): integer;

//ambil baris ke Line pada string yg berformat: line1+#13#10+line2+#13+#10+line3...
//Line dihitung dari 1
function GetStrLineCRLF(Text: string; Line: integer): string;

function StripCRLFTail(Text: string): string;

//ambil string pada Str yang terletak diantara Marker1 dan Marker2.
//Pengecekan pada Str dimulai dari StartPos
function GetStrBetween(Str: string; StartPos: integer; Marker1, Marker2: string): string;

//ambil string pada Str mulai dari posisi StartPos hingga mencapai Marker
//(Marker tidak termasuk)
function GetStrUntil(Str: string; StartPos: integer; Marker: string): string;

//ambil string pada Str mulai dari posisi 1 hingga Marker (Marker tidak termasuk)
function GetStrBefore(Str, Marker: string): string;

//ambil string pada Str mulai dari posisi Marker hingga akhir string
//(Marker tidak termasuk
function GetStrAfter(Str, Marker: string): string;

//menggabungkan array of string menjadi sebuah string yang dipisahkan oleh Delimiter
function MergeStr(Delimiter: string; Items: array of string): string;

//menghitung jumlah kemunculan Item dalam AString
function CountStrItem(AString, Item: string): integer;

//memecah item-item pada AString yang dipisahkan oleh Delimiter menjadi array of string
procedure DecomposeStr(AString: string; var OutputArray: TStringArray;
  Delimiter: string = ',');

//mengembalikan item ke ItemNo dari AString, dimana AString merupakan sebuah string
//yang berisi item-item yang dipisahkan oleh Delimiter. ItemNo dihitung dari 1.
//Contoh:
//GetDelimitedItem('satu,dua,tiga', ',', 2) menghasilkan 'dua'
function GetDelimitedItem(AString: string; ItemNo: integer; Delimiter: char = ','): string;

//untuk membersihkan string hasil dari AT Command
function CleanATCommandResult (ATCommandResult: string): string;

//untuk mencari index sebuah string dalam stringlist, mirip dengan StringList.IndexOf
function IndexOfString(AString: string; StringList: TStringList): integer;

function AngkaTerbilang(angka: int64): string;

function PemisahRupiah(Nilai : String; PakaiKomaStrip: boolean=false) : String;

implementation

function IsNumber(Str: string): boolean;
var
  angka: integer;
begin
  try
    angka:=StrToInt(Str);
    result:=true;
  except
    result:=false;
  end;
end;

function StrIsEmpty(Str: string): boolean;
begin
  result:=Trim(Str)='';
end;

function LineCountCRLF(Text: string): integer;
var
  temp: TStringList;
begin
  temp:=TStringList.Create;
  try
    temp.Text:=Text;
    result:=temp.Count;
  finally
    temp.Free;
  end;
end;

function GetStrLineCRLF(Text: string; Line: integer): string;
var
  temp: TStringList;
begin
  result:='';

  temp:=TStringList.Create;
  try
    temp.Text:=Text;
    try
      result:=temp[Line-1];
    except
    end;
  finally
    temp.Free;
  end;
end;

function StripCRLFTail(Text: string): string;
var
  Tail: string;
begin
  result:=Text;

  repeat
    Tail:= Copy(result, Length(result)-1, 2);

    if Tail = CRLF then
      result:=Copy(result, 1, Length(result)-2)
  until Tail<>CRLF;
end;

function GetStrBetween(Str: string; StartPos: integer; Marker1, Marker2: string): string;
//returns substring of Str between first occurence of Marker1 and Marker2 (excluding markers).
//Str will be searched from StartPos
var
  Bos, Eos: integer;
begin
  result:='';
  Bos:=0;
  Eos:=0;

  Bos:=PosEx(Marker1, Str, StartPos);
  if Marker1=Marker2 then
    Eos:=PosEx(Marker2, Str, Bos+1)
  else
    Eos:=PosEx(Marker2, Str, StartPos);
  if Eos<=Bos then Exit;

  result:=Copy(Str, Bos+1, Eos-Bos-1);
end;

function GetStrUntil(Str: string; StartPos: integer; Marker: string): string;
//returns substring of Str from StartPos until first occurence of Marker (excluding marker)
//returns an empty string if no Marker found.
var
  EndPos: integer;
begin
  result:='';
  EndPos:=PosEx(Marker, Str, StartPos);
  if EndPos=0 then exit;

  result:=Copy(Str, StartPos, EndPos-StartPos);
end;

function GetStrBefore(Str, Marker: string): string;
//returns substring from beginning of Str until the first occurence of Marker
//(excluding marker)
begin
  result:=Copy(Str, 1, Pos(Marker, Str)-Length(Marker));
end;

function GetStrAfter(Str, Marker: string): string;
//returns substring of Str from the first occurence of Marker until the end of Str
//(excluding marker)
var
  Pjg: integer;
begin
  Pjg:=Length(Str);
  result:=Copy(Str, Pos(Marker, Str)+Length(Marker), Pjg-Pos(Marker, Str));
end;

function MergeStr(Delimiter: string; Items: array of string): string;
var
  i: integer;
  l, h: integer;
begin
  result:='';

  l:=low(Items);
  h:=high(Items);

  for i := l to h do
  begin
    result:=result+Items[i];
    if (i<>h) then result:=result+Delimiter;
  end;
end;

function CountStrItem(AString, Item: string): integer;
var
  i: integer;
begin
  result:=0;

  repeat
    i:=Pos(Item, AString);

    if i<>0 then
    begin
      inc(result);
      Delete(AString, 1, i+Length(Item)-1);
    end;

  until i=0;
end;

procedure DecomposeStr(AString: string; var OutputArray: TStringArray;
  Delimiter: string);
var
  i: integer;
  DelimCount: integer;
  arraylength: integer;
  token: string;
  finished: boolean;
begin
  OutputArray:=nil;
  arraylength:=0;

  finished:=false;
  repeat
    i:=Pos(Delimiter, AString);

    if i=0 then
    begin
      i:=Length(AString)+1;
      finished:=true;
    end;

    token:=Trim(Copy(AString, 1, i-1));

    if token<>'' then
    begin
      inc(arraylength);
      SetLength(OutputArray, ArrayLength);
      OutputArray[arraylength-1]:=token;
      Delete(AString, 1, i);
    end;
  until finished;
end;

function GetDelimitedItem(AString: string; ItemNo: integer; Delimiter: char = ','): string;
var
  Buffer: string;
  i, j, len: integer;
  DoubleQuote: boolean;
begin
  len:=Length(AString);
  if len=0 then exit;

  if Copy(AString, Length(AString), 1)<>Delimiter then
    AString:=AString+Delimiter;

  i:=1;
  j:=0;
  Buffer:='';
  DoubleQuote:=false;

  while i<=len do
  begin
    if AString[i]='"' then DoubleQuote:=not DoubleQuote;

    if (AString[i]=Delimiter) and (not DoubleQuote) then inc(j);

    if (j=ItemNo-1) and
      ((AString[i]<>Delimiter) or ((AString[i]=Delimiter) and DoubleQuote)) then
    begin
      Buffer:=Buffer+AString[i];
    end;

    if j=ItemNo then Break;

    inc(i);
  end;

  Result:=Buffer;
end;

function CleanATCommandResult (ATCommandResult: string): string;
var
  sl : TStringList;
  i : integer;
  line: string;
  len: integer;
begin
  len:=Length(ATCommandResult);
  if len=0 then exit;

  ATCommandResult:=StringReplace(ATCommandResult, CRLF, #13, [rfReplaceAll]);
  ATCommandResult:=StringReplace(ATCommandResult, #13, CRLF, [rfReplaceAll]);

  sl:=TStringList.Create;
  try
    sl.Text:=ATCommandResult;

    i:=0;
    while i<sl.Count do
    begin
      line:=sl[i];
      len:=length(line);
      if (len=0) or (line='OK') or (line=CRLF) then
      begin
        sl.Delete(i);
        Continue;
      end
      else
      begin
        if (len>7) and (Copy(line, 1, 2)='+C') and (Copy(line, 6, 2)=': ') then
          sl[i]:=Copy(line, 8, len-7);
        inc(i);
      end;
    end;

    Result:=sl.Text;
    if Copy(result,Length(Result)-1,2)=CRLF then
      Result:=Copy(Result,1,Length(Result)-2);

  finally
    sl.Free;
  end;
end;

function IndexOfString(AString: string; StringList: TStringList): integer;
var
  i: integer;
begin
  result:=-1;

  if (not Assigned(StringList)) or (StrIsEmpty(StringList.Text)) then Exit;

  for i := 0 to StringList.Count-1 do
  begin
    if Pos(UpperCase(AString), UpperCase(StringList[i]))>0 then
    begin
      result:=i;
      break;
    end;
  end;
end;

function AngkaTerbilang(angka: int64): string;
const
   Defdigit : array[1..9] of string = ('satu','dua','tiga','empat','lima','enam','tujuh','delapan','sembilan');
   DefPredikatLokal : array [0..2] of string =('ratus','','puluh');
   DefPredikatGlobal : array [0..4] of string = ('','ribu','juta','miliar','triliun');
var
   s : string;
   Triplet : string;
   i, pjg, JumlahTriplet, QualifierGlobal : integer;


   function ResolveTriplet (digit : string; QualifierGlobalnya : integer) : string;
   var
      i, QualifierLokal : integer;
      NolSemua, belas : boolean;
      angka, Predikat : array [1..3] of string;
   begin
      result:='';
      NolSemua:=true;

      i:=1;
      repeat
         QualifierLokal:=(4-i) mod 3; //isi QualifierLokal : 0=ratusan, 2=puluhan, 1=satuan

         if digit[i]<>'0' then //angka 0 tidak diproses
         begin
            NolSemua:=false;

            //angka dan Predikat Default
            angka[i]:=Defdigit[strtoint(digit[i])]+' ';
            Predikat[i]:=DefPredikatLokal[QualifierLokal]+' ';

            if digit[i]='1' then //angka 1 butuh perlakuan khusus
            begin
               //penyebutan 1 sebagai "se"
               //pada saat berada di posisi bukan satuan, atau
               //saat berada di posisi satuan dan sebagai angka ribuan
               //if (QualifierLokal<>1) or ((QualifierLokal=1) and (QualifierGlobal=1)) then
               if (QualifierLokal<>1) or ((QualifierLokal=1) and (QualifierGlobal=1) and ((i=3) and (digit[1]='0') and (digit[2]='0') )) then
                  angka[i]:='se';

               //penanganan belasan
               if QualifierLokal=2 then //jika angka 1 pada posisi puluhan
                  if digit[i+1]<>'0' then //jika disebelah kanannya ada angka bukan 0
                  begin
                     if digit[i+1]='1' then //jika angka disebelah kanannya itu 1, harus disebut "se"
                        angka[i]:='se'
                     else
                        angka[i]:=Defdigit[strtoint(digit[i+1])]+' ';
                     Predikat[i]:='belas ';
                     belas:=true;
                  end;
            end;
            result:=result+angka[i]+Predikat[i];
            if belas then inc(i); //jika tadi hitung belas, maka maju satu angka krn tadi sudah proses 2 angka sekaligus
         end;

         inc(i);
      until i=4;

      if not NolSemua then result:=result+DefPredikatGlobal[QualifierGlobalnya]+' ';
   end;

begin
   //konsep :
   //- susunan angka merupakan rangkaian triplet (3 digit)
   //- tiap triplet punya qualifier yg relatif terhadap letak triplet dalam susunan angka (disebut qualifier global)
   //- tiap digit dalam triplet punya qualifier yg relatif terhadap letak digit tersebut dalam triplet(disebut qualifier lokal)
   //- qualifier2 itu menentukan predikat global dan predikat lokal
   //- predikat lokal menempel pada digit, sedangkan predikat global menempel pada triplet
   //- angka 0 tidak pernah disebutkan
   //- angka 1 harus ditangani secara khusus karena dapat ditulis satu/se
   //    dan dapat mengubah urutan penulisan jika membentuk belasan

   //** PASS PERTAMA : mengubah angka menjadi tulisan
   s:=IntToStr(angka);
   for i:=1 to 3-(length(s) mod 3) do s:='0'+s; //tambahkan '0' didepan string angka hingga pjgnya mencapai kelipatan 3
   pjg:=length(s);
   JumlahTriplet:=(pjg div 3); //hitung jumlah triplet
   //pengolahan triplet
   for i:=1 to JumlahTriplet do
   begin
      Triplet:=copy(s,((i-1)*3)+1,3); //bentuk triplet
      //isi qualifierglobal : 0=kosong (tidak butuh qualifier), 1=ribu, 2=juta, 3=milyar, 4=triliun
      QualifierGlobal:=JumlahTriplet-i; //hitung qualifier global
      result:=result+ResolveTriplet(Triplet,QualifierGlobal); //resolve triplet
   end;

   //** PASS KEDUA : merapikan tulisan
   result:=StringReplace(result,'se ','se',[rfReplaceAll]); //hilangkan spasi setelah "se"
   result:=StringReplace(result,'  ',' ',[rfReplaceAll]); //ubah dua spasi berurutan menjadi satu spasi
end;

function PemisahRupiah(Nilai : String; PakaiKomaStrip: boolean=false) : String;
var
  i : integer;
  Counter : integer;
begin
  Result := '';
  Counter := 1;
  for i:=Length(Nilai) downto 1 do
  begin
    if Counter > 3 then
    begin
      Result := Nilai[i] + '.'  + Result;
      Counter := 1;
    end
    else
      Result := Nilai[i] + Result;
    Inc(Counter);
  end;

  if PakaiKomaStrip then Result := Result + ',-';
end;

end.

