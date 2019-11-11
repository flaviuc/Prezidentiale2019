$loops = 0;
while($true) {
	$loops++



$rootFolder = "D:\Flaviu\Prezidentiale2019"
$folderName = (Get-Date).ToString('yyMMdd_hhmmss')

$subFolder = New-Item -Path $rootFolder -Name $folderName -ItemType "directory"

$fileNameRo = $rootFolder + "\" + $folderName + "\" + "pv_RO_PRSD_INFO.csv"
$uriRo = "https://prezidentiale2019.roaep.ro/csv/pv_RO_PRSD_INFO.csv"
$null = Invoke-WebRequest -Uri $uriRo -OutFile $fileNameRo

$fileNameSr = $rootFolder + "\" + $folderName + "\" + "pv_SR_PRSD_INFO.csv"
$uriSr = "https://prezidentiale2019.roaep.ro/csv/pv_SR_PRSD_INFO.csv"
$null = Invoke-WebRequest -Uri $uriSr -OutFile $fileNameSr

$fileNameSrC = $rootFolder + "\" + $folderName + "\" + "pv_SR_PRSD-C_INFO.csv"
$uriSrC = "https://prezidentiale2019.roaep.ro/csv/pv_SR_PRSD-C_INFO.csv"
$null = Invoke-WebRequest -Uri $uriSrC -OutFile $fileNameSrC

cls

Write-Host 

# TARA

$csvRo = import-csv $fileNameRo

$kiT = 0; #g1 

$dbT = 0; #g3
$vvT = 0; #g5
$toT = 0; #c

$tpT = 0; #g2
$rbT = 0; #g12
$mdT = 0; #g10

$acT = 0; #g12
$khT = 0; #g10


foreach($ro in $csvRo) {
	$kiT += $ro.g1 
	$dbT += $ro.g3 
	$vvT += $ro.g5 

	$tpT += $ro.g2 
	$rbT += $ro.g12 
	$mdT += $ro.g10 

	$acT += $ro.g14 
	$khT += $ro.g4 

	$toT += $ro.c
}

$kiTP = ($kiT/$toT).tostring("P")
$dbTP = ($dbT/$toT).tostring("P")
$vvTP = ($vvT/$toT).tostring("P")

$tpTP = ($tpT/$toT).tostring("P")
$rbTP = ($rbT/$toT).tostring("P")
$mdTP = ($mdT/$toT).tostring("P")

$acTP = ($acT/$toT).tostring("P")
$khTP = ($khT/$toT).tostring("P")

Write-Host "TARA"
Write-Host "Iohannis:`t`t" $kiT "`t" $kiTP
Write-Host "Barna:`t`t`t" $dbT "`t" $dbTP
Write-Host "Dancila:`t`t" $vvT "`t" $vvTP
Write-Host "Paleologu:`t`t" $tpT "`t" $tpTP
Write-Host "Bruynsells:`t`t" $rbT "`t" $rbTP
Write-Host "Diaconu:`t`t" $mdT "`t" $mdTP
Write-Host "Cumpanasu:`t`t" $acT "`t" $acTP
Write-Host "Kelemen:`t`t" $khT "`t" $khTP
Write-Host "Total:`t`t`t" $toT 

<#
a - Numărul total al alegătorilor prevăzut în lista electorală permanentă existentă în secția de votare
b - Numărul total al alegătorilor care s-au prezentat la urne
b1 - Numărul total al alegătorilor care s-au prezentat la urne, înscriși în lista electorală permanentă
b2 - Numărul total al alegătorilor care s-au prezentat la urne și nu sunt cuprinși în lista electorală permanentă, înscriși în lista electorală suplimentară
b3 - Numărul total al alegătorilor care au votat utilizând urna specială, înscriși în extrasul din listele electorale
c - Numărul total al voturilor valabil exprimate
d - Numărul voturilor nule
e - Numărul buletinelor de vot primite
f - Numărul buletinelor de vot neîntrebuințate și anulate
Lista candidați
g1 - KLAUS-WERNER IOHANNIS
g2 - THEODOR PALEOLOGU
g3 - ILIE-DAN BARNA
g4 - HUNOR KELEMEN
g5 - VASILICA-VIORICA DĂNCILĂ
g6 - CĂTĂLIN-SORIN IVAN
g7 - NINEL PEIA
g8 - SEBASTIAN-CONSTANTIN POPESCU
g9 - JOHN-ION BANU
g10 - MIRCEA DIACONU
g11 - BOGDAN-DRAGOS-AURELIU MARIAN-STANOEVICI
g12 - RAMONA-IOANA BRUYNSEELS
g13 - VIOREL CATARAMĂ
g14 - ALEXANDRU CUMPĂNAŞU
#>

Write-Host 

# DIASPORA

$csvSr = import-csv $fileNameSr

$toS = 0; #c

$kiS = 0; #g1 
$dbS = 0; #g3
$vvS = 0; #g5

$tpS = 0; #g2
$rbS = 0; #g12
$mdS = 0; #g10

$acS = 0; #g4
$khS = 0; #g14

foreach($sr in $csvSr) {
	$kiS += $sr.g1 
	$dbS += $sr.g3 
	$vvS += $sr.g5 
	
	$tpS += $sr.g2 
	$rbS += $sr.g12 
	$mdS += $sr.g10 
	
	$acS += $sr.g4 
	$khS += $sr.g14 
	
	$toS += $sr.c
}

$kiSP = ($kiS/$toS).tostring("P")
$dbSP = ($dbS/$toS).tostring("P")
$vvSP = ($vvS/$toS).tostring("P")

$tpSP = ($tpS/$toS).tostring("P")
$rbSP = ($rbS/$toS).tostring("P")
$mdSP = ($mdS/$toS).tostring("P")

$acSP = ($acS/$toS).tostring("P")
$khSP = ($khS/$toS).tostring("P")

Write-Host "DIASPORA"
Write-Host "Iohannis:`t`t" $kiS "`t" $kiSP
Write-Host "Barna:`t`t`t" $dbS "`t" $dbSP
Write-Host "Dancila:`t`t" $vvS "`t`t" $vvSP
Write-Host "Paleologu:`t`t" $tpS "`t`t" $tpSP
Write-Host "Bruynsells:`t`t" $rbS "`t`t" $rbSP
Write-Host "Diaconu:`t`t" $mdS "`t`t" $mdSP
Write-Host "Cumpanasu:`t`t" $acS "`t`t" $acSP
Write-Host "Kelemen:`t`t" $khS "`t`t" $khSP
Write-Host "Total:`t`t`t" $toS 

<# SR
g1 - KLAUS-WERNER IOHANNIS
g2 - THEODOR PALEOLOGU
g3 - ILIE-DAN BARNA
g4 - HUNOR KELEMEN
g5 - VASILICA-VIORICA DĂNCILĂ
g6 - CĂTĂLIN-SORIN IVAN
g7 - NINEL PEIA
g8 - SEBASTIAN-CONSTANTIN POPESCU
g9 - JOHN-ION BANU
g10 - MIRCEA DIACONU
g11 - BOGDAN-DRAGOS-AURELIU MARIAN-STANOEVICI
g12 - RAMONA-IOANA BRUYNSEELS
g13 - VIOREL CATARAMĂ
g14 - ALEXANDRU CUMPĂNAŞU

a - Numărul total al alegătorilor prevăzut în lista electorală permanentă existentă în secția de votare
b - Numărul total al alegătorilor care s-au prezentat la urne
b1 - Numărul total al alegătorilor care s-au prezentat la urne, înscriși în lista electorală permanentă
b2 - Numărul total al alegătorilor care s-au prezentat la urne și nu sunt cuprinși în lista electorală permanentă, înscriși în lista electorală suplimentară
b3 - Numărul total al alegătorilor care au votat utilizând urna specială, înscriși în extrasul din listele electorale
c - Numărul total al voturilor valabil exprimate
d - Numărul voturilor nule
e - Numărul buletinelor de vot primite
f - Numărul buletinelor de vot neîntrebuințate și anulate
#>

Write-Host 

$kiTotal = $kiT + $kiS
$dbTotal = $dbT + $dbS
$vvTotal = $vvT + $vvS

$tpTotal = $tpT + $tpS
$rbTotal = $rbT + $rbS
$mdTotal = $mdT + $mdS

$acTotal = $acT + $acS
$khTotal = $khT + $khS

$totalT = $toS + $toT

$kiTotalP = ($kiTotal/$totalT).tostring("P")
$dbTotalP = ($dbTotal/$totalT).tostring("P")
$vvTotalP = ($vvTotal/$totalT).tostring("P")

$tpTotalP = ($tpTotal/$totalT).tostring("P")
$rbTotalP = ($rbTotal/$totalT).tostring("P")
$mdTotalP = ($mdTotal/$totalT).tostring("P")

$acTotalP = ($acTotal/$totalT).tostring("P")
$khTotalP = ($khTotal/$totalT).tostring("P")

Write-Host "TARA + DIASPORA"
Write-Host "Iohannis:`t`t" $kiTotal "`t" $kiTotalP
Write-Host "Barna:`t`t`t" $dbTotal "`t" $dbTotalP
Write-Host "Dancila:`t`t" $vvTotal "`t" $vvTotalP
Write-Host "Paleologu:`t`t" $tpTotal "`t" $tpTotalP
Write-Host "Bruynsells:`t`t" $rbTotal "`t" $rbTotalP
Write-Host "Diaconu:`t`t" $mdTotal "`t" $mdTotalP
Write-Host "Cumpanasu:`t`t" $acTotal "`t" $acTotalP
Write-Host "Kelemen:`t`t" $khTotal "`t" $khTotalP
Write-Host "Total:`t`t`t" $totalT 
Write-Host 

$dateUpdated = Get-Date -Format "ddd MM/dd/yyyy HH:mm K"

$out = @"
<html>
	<head>
		<title>Prezidentiale 2019 - Primul Tur</title>
		<style>
			p, td {
				font-size: 18px;
			}
			p {
				font-weight: bolder;
			}
			.updated {
				font-size: 12px;
				font-weight: lighter;
			}
			table, th, td {
				border: 1px solid #cacaca;
			}
			table {
				border-collapse: collapse;
			}
		</style>
	</head>
	<body>

		<p>Prezidentiale 2019 - Primul Tur</p>
	
		<table border="1" cellpadding="3">

			<tr>
				<td colspan="3">TARA</td>
			</tr>
			<tr>
				<td>Iohannis</td><td>$kiT</td><td>$kiTP</td>
			</tr>
			<tr>
				<td>Barna</td><td>$dbT</td><td>$dbTP</td>
			</tr>
			<tr>
				<td>Dancila</td><td>$vvT</td><td>$vvTP</td>
			</tr>

			<tr>
				<td>Kelemen</td><td>$khT</td><td>$khTP</td>
			</tr>
			<tr>
				<td>Diaconu</td><td>$mdT</td><td>$mdTP</td>
			</tr>
			<tr>
				<td>Bruynseels</td><td>$rbT</td><td>$rbTP</td>
			</tr>
			<tr>
				<td>Cumpanasu</td><td>$acT</td><td>$acTP</td>
			</tr>

			<tr>
				<td>Total</td><td>$toT</td><td></td>
			</tr>

		<table>

		<br />

		<table border="1" cellpadding="3">

			<tr>
				<td colspan="3">DIASPORA</td>
			</tr>
			<tr>
				<td>Iohannis</td><td>$kiS</td><td>$kiSP</td>
			</tr>
			<tr>
				<td>Barna</td><td>$dbS</td><td>$dbSP</td>
			</tr>
			<tr>
				<td>Dancila</td><td>$vvS</td><td>$vvSP</td>
			</tr>
			
			<tr>
				<td>Kelemen</td><td>$khS</td><td>$khSP</td>
			</tr>
			<tr>
				<td>Diaconu</td><td>$mdS</td><td>$mdSP</td>
			</tr>
			<tr>
				<td>Bruynseels</td><td>$rbS</td><td>$rbSP</td>
			</tr>
			<tr>
				<td>Cumpanasu</td><td>$acS</td><td>$acSP</td>
			</tr>

			<tr>
				<td>Total</td><td>$toS</td><td></td>
			</tr>

		</table>

		<br />

		<table border="1" cellpadding="3">

			<tr>
				<td colspan="3">TARA + DIASPORA</td>
			</tr>
			<tr>
				<td>Iohannis</td><td>$kiTotal</td><td>$kiTotalP</td>
			</tr>
			<tr>
				<td>Barna</td><td>$dbTotal</td><td>$dbTotalP</td>
			</tr>
			<tr>
				<td>Dancila</td><td>$vvTotal</td><td>$vvTotalP</td>
			</tr>
			
			<tr>
				<td>Kelemen</td><td>$khTotal</td><td>$khTotalP</td>
			</tr>
			<tr>
				<td>Diaconu</td><td>$mdTotal</td><td>$mdTotalP</td>
			</tr>
			<tr>
				<td>Bruynseels</td><td>$rbTotal</td><td>$rbTotalP</td>
			</tr>
			<tr>
				<td>Cumpanasu</td><td>$acTotal</td><td>$acTotalP</td>
			</tr>
			
			<tr>
				<td>Total</td><td>$totalT</td><td></td>
			</tr>

		<table>
		
		<p class="updated">Last updated: $dateUpdated</p>
				
	</body>
</html>
"@

$localFile = "D:\Flaviu\Prezidentiale2019\index.html"

$out | Out-File -FilePath $localFile

$ftp = [System.Net.FtpWebRequest]::Create("ftp://flaviu.eu/flaviu.eu/Prezidentiale2019/index.html")
$ftp = [System.Net.FtpWebRequest]$ftp
$user = "**********";
$pass = "***********";
$credential = new-object System.Net.NetworkCredential($user, $pass)
$ftp.Credentials = $credential
$ftp.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
$content = [System.IO.File]::ReadAllBytes($localFile)
$ftp.ContentLength = $content.Length
$rs = $ftp.GetRequestStream()
$rs.Write($content, 0, $content.Length)
$rs.Close()
$rs.Dispose()

	Write-Host "Loop:" $loops
	Start-Sleep -Second 600
}