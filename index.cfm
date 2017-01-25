<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfcontent type="text/html;charset=utf-8">

<html>
<head>


<title>Εικονική &nbsp; σκηνή </title>
</head>


<body>

<cfset templatePath = GetDirectoryFromPath( 
    GetCurrentTemplatePath()
    ) />

<cfset vrmlpath = ExpandPath( "./world.wrl" ) />	
 
<cfif isdefined("form.upload_now")>
	<cfoutput>
		<cffile action="UPLOAD" filefield="file_path" destination="#templatePath#"
		accept="model/vrml" nameconflict="MAKEUNIQUE">
		<p align="center">
			<b>
			Το αρχείο #File.ServerFile# αποθηκεύτηκε στην σκηνή !
			</b>
		</p>
		<br>
			
		<cfset str='Inline { url "'& #File.ServerFile# & '" }'>
		
		<cffile action="APPEND" file="#vrmlpath#" addnewline="Yes" attributes="Normal" output="#str#">
	
	</cfoutput>
</cfif>

<br>
<br>
<p align="center">
<font size="+1"><b>Παρακαλώ εισάγετε ένα αρχείο με επέκταση wrl! </b> </font>
<cfform action="index.cfm" method="post" name="upload_form" enctype="multipart/form-data">
<cfinput type="file" name="file_path">
<cfinput type="submit" name="upload_now" value="Αποθήκευση">
<br>
<br>

<cfheader name="expires" value="#NOW()#">
<cfheader name="pragma" value="no-cache">
<cfheader name="cache-control" value="no-cache,no-store,must-revalidate">

<cfif FileExists(vrmlpath)>

	 <embed src="world.wrl" width="950px" height="650px">
<cfelse>
        File not Exists: <cfoutput> #vrmlpath# </cfoutput>

</cfif>
</p>
</cfform>


</body>
</html>
