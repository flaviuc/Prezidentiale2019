Add-Type -Assembly Microsoft.VisualBasic

$pass = Read-Host -assecurestring "Please enter your password"
$pass = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pass))
$rootFolder = "D:\Flaviu\Prezidentiale2019"

$loops = 0;
while($true) {
	$loops++

	$folderName = (Get-Date).ToString('yyMMdd_hhmmss')
	$subFolder = New-Item -Path $rootFolder -Name $folderName -ItemType "directory"

	$fileNameRo = $rootFolder + "\" + $folderName + "\" + "pv_RO_PRSD_INFO.csv"
	$uriRo = "https://prezenta.bec.ro/prezidentiale24112019/data/pv/csv/pv_RO_PRSD_PART.csv"
	$null = Invoke-WebRequest -Uri $uriRo -OutFile $fileNameRo

	$fileNameSr = $rootFolder + "\" + $folderName + "\" + "pv_SR_PRSD_INFO.csv"
	$uriSr = "https://prezenta.bec.ro/prezidentiale24112019/data/pv/csv/pv_SR_PRSD_PART.csv"
	$null = Invoke-WebRequest -Uri $uriSr -OutFile $fileNameSr

	$fileNameSrC = $rootFolder + "\" + $folderName + "\" + "pv_SR_PRSD-C_INFO.csv"
	$uriSrC = "https://prezenta.bec.ro/prezidentiale24112019/data/pv/csv/pv_SR_PRSD-C_PART.csv"
	$null = Invoke-WebRequest -Uri $uriSrC -OutFile $fileNameSrC

	cls

	# TARA
		Write-Host 

		$csvRo = import-csv $fileNameRo

		$kiT = 0; #g1 
		$vvT = 0; #g2
		$toT = 0; #c

		foreach($ro in $csvRo) {
			if([Microsoft.VisualBasic.Information]::IsNumeric($ro.g1)) {
				$kiT += $ro.g1 
			}
			if([Microsoft.VisualBasic.Information]::IsNumeric($ro.g2)) {
				$vvT += $ro.g2 
			}
			if([Microsoft.VisualBasic.Information]::IsNumeric($ro.c)) {
				$toT += $ro.c
			}
		}
		
		$kiTP = ($kiT/$toT).tostring("P")
		$vvTP = ($vvT/$toT).tostring("P")

		Write-Host "TARA"
		Write-Host "------------------------------------------------"
		Write-Host "Iohannis:`t`t" $kiT "`t" $kiTP
		Write-Host "Dancila:`t`t" $vvT "`t" $vvTP
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
		g5 - VASILICA-VIORICA DĂNCILĂ
		#>

	# DIASPORA
		Write-Host 

		$csvSr = import-csv $fileNameSr

		$kiS = 0; #g1 
		$vvS = 0; #g2
		$toS = 0; #c

		foreach($sr in $csvSr) {
			$kiS += $sr.g1 
			$vvS += $sr.g2 
			$toS += $sr.c
		}

		$kiSP = ($kiS/$toS).tostring("P")
		$vvSP = ($vvS/$toS).tostring("P")

		Write-Host "DIASPORA"
		Write-Host "------------------------------------------------"
		Write-Host "Iohannis:`t`t" $kiS "`t" $kiSP
		Write-Host "Dancila:`t`t" $vvS "`t" $vvSP
		Write-Host "Total:`t`t`t" $toS 

		<# SR
		g1 - KLAUS-WERNER IOHANNIS
		g5 - VASILICA-VIORICA DĂNCILĂ

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

	# CORESPONDENTA
		Write-Host 
		
		$csvSrC = import-csv $fileNameSrC

		$kiC = 0; #e1 
		$vvC = 0; #e2
		$toC = 0; #c

		foreach($srC in $csvSrC) {
			$kiC += $srC.e1 
			$vvC += $srC.e2 
			$toC += $srC.c
		}

		$kiCP = ($kiC/$toC).tostring("P")
		$vvCP = ($vvC/$toC).tostring("P")

		Write-Host "CORESPONDENTA"
		Write-Host "------------------------------------------------"
		Write-Host "Iohannis:`t`t" $kiC "`t" $kiCP
		Write-Host "Dancila:`t`t" $vvC "`t" $vvCP
		Write-Host "Total:`t`t`t" $toC 

	# TOTAL
		Write-Host 

		$kiTotal = $kiT + $kiS + $kiC
		$vvTotal = $vvT + $vvS + $vvC
		$totalT = $toS + $toT + $toC

		$kiTotalP = ($kiTotal/$totalT).tostring("P")
		$vvTotalP = ($vvTotal/$totalT).tostring("P")

		Write-Host "TARA + DIASPORA + CORESPONDENTA"
		Write-Host "------------------------------------------------"
		Write-Host "Iohannis:`t`t" $kiTotal "`t" $kiTotalP
		Write-Host "Dancila:`t`t" $vvTotal "`t" $vvTotalP
		Write-Host "Total:`t`t`t" $totalT 
		Write-Host 

	$dateUpdated = Get-Date -Format "ddd MM/dd/yyyy HH:mm K"

$out = @"
<html>
	<head>
		<title>Prezidentiale 2019 - Tur Final</title>
		<meta http-equiv="Refresh" content="60">
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

		<p>Prezidentiale 2019 - Tur Final</p>
	
		<table border="1" cellpadding="3">

			<tr>
				<td colspan="3">TARA</td>
			</tr>
			<tr>
				<td>Iohannis</td><td>$kiT</td><td>$kiTP</td>
			</tr>
			<tr>
				<td>Dancila</td><td>$vvT</td><td>$vvTP</td>
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
				<td>Dancila</td><td>$vvS</td><td>$vvSP</td>
			</tr>
			<tr>
				<td>Total</td><td>$toS</td><td></td>
			</tr>

		</table>

		<br />

		<table border="1" cellpadding="3">

			<tr>
				<td colspan="3">CORESPONDENTA</td>
			</tr>
			<tr>
				<td>Iohannis</td><td>$kiC</td><td>$kiCP</td>
			</tr>
			<tr>
				<td>Dancila</td><td>$vvC</td><td>$vvCP</td>
			</tr>
			<tr>
				<td>Total</td><td>$toC</td><td></td>
			</tr>

		</table>

		<br />

		<table border="1" cellpadding="3">

			<tr>
				<td colspan="3">TOTAL</td>
			</tr>
			<tr>
				<td>Iohannis</td><td>$kiTotal</td><td>$kiTotalP</td>
			</tr>
			<tr>
				<td>Dancila</td><td>$vvTotal</td><td>$vvTotalP</td>
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
	$user = "*";
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
	Start-Sleep -Second 60
}