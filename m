Return-Path: <SRS0=n1G1=BQ=mailb.zgpm.zcsend.net=bounce_888478127+a.1147154fd4c8f31c2_v29@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C815BD58B21
	for <linux-firmware@archiver.kernel.org>; Mon, 16 Mar 2026 06:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A185C19425; Mon, 16 Mar 2026 06:05:48 +0000 (UTC)
Received: from sender-145.psu3.zcsend.net (sender-145.psu3.zcsend.net [135.84.81.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21F49C19421
	for <linux-firmware@kernel.org>; Mon, 16 Mar 2026 06:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21F49C19421
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=168yuanjian.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mailb.zgpm.zcsend.net
Received: from senderb31.zcsend.net by sender-145.psu3.zcsend.net
	with SMTP id 177364114591175975; Sun, 15 Mar 2026 23:05:45 -0700
Received: from 10.75.159.108 by senderb31.zcsend.net
	with SMTP id 177364114474554843; Sun, 15 Mar 2026 23:05:44 -0700
DKIM-Signature: a=rsa-sha256; q=dns/txt; b=FbCFml45ezYoubaetWAnmZ5rvAFBTTcfjZBRr3NGQw0+JLQ9pSDDXmcHLcVmeQs/aqBDuDrM3FeSl4gC7QmeRZzR6kNpOHonYV6Lu0OzchvpM+K9BXWDqAd1vHgZq9Z8P6sVEdjk1iqhDk3nAi17wlADNddhuMGlBq57CTtX8YA=; c=simple/simple; s=242059; d=168yuanjian.com; v=1; bh=H30Vi2TMdnWu6c1IMVzzpVxsCUEvVMGt6vprCDCqgAk=; h=date:date:from:from:to:to:message-id:subject:subject:mime-version:content-type:list-unsubscribe:list-unsubscribe:list-unsubscribe-post:x-csa-complaints;
DKIM-Signature: a=rsa-sha256; q=dns/txt; b=bh7u8lTzfuBbEGx+JTeQRMcssgmE+IqBP89TaG7CHlVdv4cm4tiByUaj619jBOSh/CRIoB6cpAj3QtFD8KGbRBR/qLMxLhThsxgtqpvNuOXLNaRqrHq/FrKCCUxw+nGjSTOq4SPzjlg84+DmlZ2uh9yuEsvYiSzrvR3dK/Tf0kw=; c=simple/simple; s=k1; d=mail4.zgpm.zcsend.net; v=1; bh=H30Vi2TMdnWu6c1IMVzzpVxsCUEvVMGt6vprCDCqgAk=; h=date:date:from:from:to:to:message-id:subject:subject:mime-version:content-type:list-unsubscribe:list-unsubscribe:list-unsubscribe-post:x-csa-complaints;
Date: Sun, 15 Mar 2026 23:05:44 -0700 (PDT)
From: "John Leung" <john@168yuanjian.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Message-ID: <zcb.3zc97934e0781d7cc45a44b9fb7a17dd92ce3bcdbd4f59db73cc2d043dba41fb78.1147154fd4c8f31c2.1773641144742@mailb.zgpm.zcsend.net>
Subject: We are PCBA manufacturer : R&D team
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_15042300_942541787.1773641144741"
List-Unsubscribe: <https://hgele-zgpm.maillist-manage.com/ua/optout?od=3zc97934e0781d7cc45a44b9fb7a17dd92ce3bcdbd4f59db73cc2d043dba41fb78&rd=1147154fd4c8f31c2&sd=1147154fd4c8f3013&n=124296e04fe637>,<mailto:leave_888478127+1147154fd4c8f31c2_1147154fd4c8f3013@zcsend.net>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-CSA-Complaints: csa-complaints@eco.de
Reply-To: john@168yuanjian.com
X-JID: 3zc97934e0781d7cc45a44b9fb7a17dd92ce3bcdbd4f59db73cc2d043dba41fb78.1147154fd4c8e1a56
X-campaignid: zohocampaigns.3zc97934e0781d7cc45a44b9fb7a17dd92ce3bcdbd4f59db73cc2d043dba41fb78.zcb.1147154fd4c8f31c2.124296e04fe637
X-Zoho-RID: zohocampaigns.3zc97934e0781d7cc45a44b9fb7a17dd92ce3bcdbd4f59db73cc2d043dba41fb78.zcb.1147154fd4c8f31c2.124296e04fe637
X-Mailer: Zoho Campaigns
X-Report-Abuse: <Please send a copy of this message along with header to abuse+3zc97934e0781d7cc45a44b9fb7a17dd92ce3bcdbd4f59db73cc2d043dba41fb78_zcb_1147154fd4c8f31c2@zohocampaigns.com>, <https://hgele-zgpm.maillist-manage.com/campaigns/ReportAbuse.zc?od=3zc97934e0781d7cc45a44b9fb7a17dd92ce3bcdbd4f59db73cc2d043dba41fb78&rd=1147154fd4c8f31c2&sd=1147154fd4c8f3013&n=124296e04fe637>

------=_Part_15042300_942541787.1773641144741
Content-Type: text/plain;charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



Dear Customer

Good day

The attachment is the product we have developed.=20

We are the R&D team. We have a PCBA manufacturer and can help you realize y=
our ideas.

If you have a PCBA projects or need alternative component solutions ,
please feel free to contact me at any time.

Thank you

Best wish
Johnson
Email :john@rongfei.net
---------------------------------------------------------------------------=
-----------------------
Electronic product R&D team
Add : Room 1606, Jiahui New Town, Futian Sub-district, Futian District, She=
nzhen City, China POSTAL: 518031
---------------------------------------------------------------------------=
------------------------

You are receiving this email as you signed up for our newsletters.
Want to change how you receive these emails?
You can https://hgele-zgpm.maillist-manage.com/ua/optout?od=3D3zc97934e0781=
d7cc45a44b9fb7a17dd92ce3bcdbd4f59db73cc2d043dba41fb78&rd=3D1147154fd4c8f31c=
2&sd=3D1147154fd4c8f3013&n=3D124296e04fe637 Unsubscribe or https://hgele-zg=
pm.maillist-manage.com/ua/commpref?od=3D3zc97934e0781d7cc45a44b9fb7a17dd92c=
e3bcdbd4f59db73cc2d043dba41fb78&rd=3D1147154fd4c8f31c2&sd=3D1147154fd4c8f30=
13&n=3D124296e04fe637 Update your preferences




------=_Part_15042300_942541787.1773641144741
Content-Type: text/html;charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:o=3D"urn:schemas-microso=
ft-com:office:office" xmlns:v=3D"urn:schemas-microsoft-com:vml"><head><!--[=
if gte mso 15]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch=
>96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--><!--[if g=
te mso 15]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>96<=
/o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--><title>We are=
 PCBA manufacturer : R&D team</title><!--[if gte mso 9]><xml><o:OfficeDocum=
entSettings><o:AllowPNG/><o:PixelsPerInch>96</o:PixelsPerInch></o:OfficeDoc=
umentSettings></xml><![endif]-->
=09<meta content=3D"width=3Ddevice-width" name=3D"viewport">
=09<style>
=09/* #### Mobile Phones Portrait #### */
=09/* #### iPhone 4+ Portrait or Landscape #### */
=09@media only screen and (max-width: 480px){
=09=09table[class=3DcontentInner] {width:100% !important;padding:0px;margin=
:0px;}
=09=09img[class=3DzpImage]{width:100% !important;max-width: 360px !importan=
t;text-align:center;margin:0px;padding:0px}=20
=09=09body, table, td, p, li,div,span, blockquote{-webkit-text-size-adjust:=
none !important;margin:0px auto;line-height:1.7}
=09=09table[class=3DzpImageCaption]{text-align:left;}
=09=09table[class=3Dcols]{width:100% !important;max-width:100% !important;t=
ext-align:left;}
=09=09table[class=3Dzpcolumns] {text-align:left;margin:0px;}=20
=09=09table[class=3Dzpcolumn] {text-align:left;margin:0px;}=20
=09=09table[class=3DzpAlignPos]{width:100%;text-align:left;margin:0px;}=20
=09=09td[class=3Dtxtsize]{font-size:18px !important;}
=09=09td[class=3Dpaddingcomp]{ padding-left: 15px !important; padding-right=
: 15px !important }
=09=09td[class=3Dbannerimgpad]{padding:0px !important;}
=09=09span[class=3Dtxtsize]{font-size:18px !important;}
=09=09img[size =3D "B"]{width: 100% !important;max-width:100% !important;ma=
rgin: 0px !important;padding:0px !important;}
=09=09img[size =3D "F"]{width: 100% !important;max-width:100% !important;ma=
rgin: 0px !important;padding:0px !important;}
=09=09img[size =3D "S"]{width:105px !important; height:auto; margin:0px aut=
o !important;padding:0px !important;}
=09=09img[size =3D "M"]{width:277.869px !important;height:auto;margin:0px a=
uto !important;padding:0px !important;}
=09=09.cmp-mobile-view-hide { display: none !important }=20
=09=09.cmp-desk-view-hide { display: block !important }=20
=09=09h1{
=09=09=09font-size:28px !important;
=09=09=09line-height:100% !important;
=09=09}
=09=09h2{
=09=09=09font-size:24px !important;
=09=09=09line-height:100% !important;
=09=09}
=09=09h3{
=09=09=09font-size:20px !important;
=09=09=09line-height:100% !important;
=09=09}
=09=09h4{
=09=09=09font-size:18px !important;
=09=09=09line-height:100% !important;
=09=09}
=09=09}=09=09
=09=09@media only screen and (max-width: 480px){
=09=09.zpImage{
=09=09=09height:auto !important;
=09=09=09width:100% !important;
=09=09}}
=09=09@media only screen and (max-width: 480px){
=09=09.contentInner,.cols,.zpAlignPos{
=09=09=09width:100% !important;
=09=09=09max-width:100% !important;
=09=09}}
=09=09@media only screen and (max-width: 480px){
=09=09.paddingcomp{
=09=09=09padding-left: 15px !important;
=09=09=09padding-right: 15px !important;=20
=09=09}
=09=09.bannerimgpad{
=09=09=09padding:0px !important;
=09=09}
=09=09.buttonElem a
=09=09{
=09=09=09max-width: 320px !important;
=09=09}
=09}
=09=09@media screen and (max-width: 480px)
        {
                .tmplheader,.tmplfooter{width:100% !important;max-width:400=
px !important;margin:0px auto;text-align:center;}
        }
=09=09a[x-apple-data-detectors] {
=09=09    color: inherit !important;
=09=09    text-decoration: none !important;
=09=09    font-size: inherit !important;
=09=09    font-family: inherit !important;
=09=09    font-weight: inherit !important;
=09=09    line-height: inherit !important;
=09=09}
=09=09
=09=09</style>
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body bgcolor=3D"#f0f0f0" style=3D"margin:0; padding:0;font-family:Aria=
l, Helvetica, sans-serif; font-size:12px; color:#000000;"><!--[if !mso 9]><=
!--><span style=3D'font-size:0px;max-width: 0px;max-height: 0px;mso-hide:al=
l;display:block;'>  </span><!--<![endif]--><center>=20
<div class=3D"zppage-container">                                           =
              =20
=09=09<table bgcolor=3D"#f0f0f0" border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" class=3D"contentOuter" id=3D"contentOuter" style=3D"background-color=
:#f0f0f0;background-color:#f0f0f0; mso-table-lspace:0pt; mso-table-rspace:0=
pt;font-size:12px;text-align:center;border:0px;padding:0px;border-collapse:=
collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;" width=3D"100%">=20
=09=09=09<tbody><tr>=20
=09=09=09=09<td style=3D" mso-table-lspace:0pt; font-size:12px;font-family:=
Arial, Helvetica, sans-serif; mso-table-rspace:0pt;font-size:12px;border:0p=
x;padding:0px;border-collapse:collapse; mso-table-lspace:0pt; mso-table-rsp=
ace:0pt;">&nbsp;</td>
=09=09=09=09<td align=3D"center" style=3D" mso-table-lspace:0pt; font-size:=
12px;font-family:Arial, Helvetica, sans-serif; mso-table-rspace:0pt;font-si=
ze:12px;border:0px;padding:0px;border-collapse:collapse; mso-table-lspace:0=
pt; mso-table-rspace:0pt;">
=09=09=09=09=09<table bgcolor=3D"#ffffff" border=3D"0" cellpadding=3D"0" ce=
llspacing=3D"0" class=3D"contentInner" id=3D"contentInner" style=3D"border-=
collapse:collapse; border:0px;font-size:12px;border-collapse:collapse; mso-=
table-lspace:0pt; mso-table-rspace:0pt;background-color:#ffffff;background-=
color:#ffffff;width:600px;margin:0px auto;border:0px;" width=3D"600">=20
=09=09=09=09=09<tbody><tr>=20
=09=09=09=09=09<td height=3D"570" style=3D"border-collapse:collapse; mso-ta=
ble-lspace:0pt; font-size:12px;font-family:Arial, Helvetica, sans-serif; ms=
o-table-rspace:0pt;font-size:12px;border:0px;padding:0px;" valign=3D"top">
=09=09=09=09=09 =09<a name=3D"Top" style=3D"text-decoration:underline;"></a=
>
    <div baseposition=3D"pos_YrobDQg7SAqnBt5RUo4dhQ" class=3D"zpcontent-wra=
pper" id=3D"page-container">
    <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" id=3D"page-cont=
ainer" style=3D" mso-table-lspace:0pt;font-size:12px;border:0px;padding:0px=
;border-collapse:collapse; mso-table-lspace:0pt;mso-table-rspace:0pt;text-d=
ecoration:none !important;" width=3D"100%">
<tbody><tr><td class=3D"txtsize" id=3D"elm_1762326591920" style=3D" mso-tab=
le-lspace:0pt; font-size:12px;font-family:Arial, Helvetica, sans-serif; mso=
-table-rspace:0pt;font-size:12px;border:0px;padding:0px 0px;border-collapse=
:collapse;" valign=3D"top">

          <div class=3D"zpelement-wrapper" id=3D"elm_1762326591920" style=
=3D";word-wrap:break-word;overflow:hidden;padding-right:0px;background-colo=
r:;">
=09    =09<table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" class=3D"=
zpAlignPos" style=3D" mso-table-lspace:0pt; mso-table-rspace:0pt;font-size:=
12px;padding:0px;border:0px;border-collapse:collapse; mso-table-lspace:0pt;=
 mso-table-rspace:0pt;word-break:break-word;-ms-text-size-adjust: 100%;-web=
kit-text-size-adjust: 100%;" width=3D"100%">
=09  =09
            <tbody><tr><td class=3D"paddingcomp" style=3D"border-collapse:c=
ollapse; mso-table-lspace:0pt; mso-table-rspace:0pt;border:0px;padding:7px =
15px;font-size:12pt;font-family:Arial,Helvetica;line-height:19pt;border-top=
:0px none ;   border-bottom:0px none ;padding-top:7px;padding-bottom:7px;pa=
dding-right:15px;padding-left:15px;">
             =09    =09=09<div style><p style=3D"font-family:Arial,verdana;=
font-size:12px; color:#000000;padding:0px;margin: 0;line-height: 25pt; text=
-align: left;"><font face=3D"Arial, Helvetica" style=3D"font-size: 15pt;">D=
ear Customer</font></p><p style=3D"font-family:Arial,verdana;font-size:12px=
; color:#000000;padding:0px;margin: 0;line-height: 25pt; text-align: left;"=
><font face=3D"Arial, Helvetica" style=3D"font-size: 15pt;"><br></font></p>=
<p style=3D"font-family:Arial,verdana;font-size:12px; color:#000000;padding=
:0px;margin: 0;line-height: 25pt; text-align: left;"><font face=3D"Arial, H=
elvetica" style=3D"font-size: 15pt;">Good day </font></p><p style=3D"font-f=
amily:Arial,verdana;font-size:12px; color:#000000;padding:0px;margin: 0;lin=
e-height: 25pt; text-align: left;"><font color=3D"#000000" face=3D"Arial, H=
elvetica" style=3D"color: rgb(0, 0, 0); font-size: 15pt;"><span><span><font=
><span><br></span></font></span></span></font></p><p style=3D"font-family:A=
rial,verdana;font-size:12px; color:#000000;padding:0px;margin: 0;line-heigh=
t: 25pt; text-align: left;"><font color=3D"#000000" face=3D"Arial, Helvetic=
a" style=3D"color: rgb(0, 0, 0); font-size: 15pt;"><span><span>

<font><span>The attachment is the product we have developed.<span>&nbsp;</s=
pan></span></font></span></span></font></p><font color=3D"#000000" face=3D"=
Arial, Helvetica" style=3D"color: rgb(0, 0, 0); font-size: 15pt;">

<br></font><p style=3D"margin: 0;padding: 0px;font-family:Arial, Helvetica,=
 sans-serif; color:#000000;line-height:1.7;font-family:Arial,verdana;font-s=
ize:12px;padding:0px;"></p><p style=3D"font-family:Arial,verdana;font-size:=
12px; color:#000000;padding:0px;margin: 0;line-height: 25pt; text-align: le=
ft;"><font face=3D"Arial, Helvetica" style><span style=3D"color: rgb(0, 0, =
0); font-size: 15pt;">We are the R&D team. We have a </span><font style=3D"=
font-size: 18pt;"><font color=3D"#006cfb">PCBA manufacturer</font>&nbsp;</f=
ont><span style=3D"color: rgb(0, 0, 0); font-size: 15pt;">and can help you =
realize your ideas.</span></font></p><p style=3D"font-family:Arial,verdana;=
font-size:12px; color:#000000;padding:0px;margin: 0;line-height: 25pt; text=
-align: left;"><span style=3D"font-family: Arial, Helvetica;"><font style=
=3D"font-size: 15pt;"><br></font></span></p><p style=3D"font-family:Arial,v=
erdana;font-size:12px; color:#000000;padding:0px;margin: 0;line-height: 25p=
t; text-align: left;"><span style=3D"font-family: Arial, Helvetica;"><font =
style=3D"font-size: 15pt;">If you have a<font color=3D"#006cfb"> </font></f=
ont><font color=3D"#006cfb" style=3D"font-size: 18pt;">PCBA projects</font>=
<font style=3D"font-size: 15pt;"><font color=3D"#006cfb"> </font>or need</f=
ont><font color=3D"#006cfb"><font style=3D"font-size: 18pt;"> alternative c=
omponent solutions</font><font style=3D"font-size: 15pt;">, </font></font><=
/span></p><p style=3D"font-family:Arial,verdana;font-size:12px; color:#0000=
00;padding:0px;margin: 0;line-height: 25pt; text-align: left;"><span style=
=3D"font-family: Arial, Helvetica;"><font style=3D"font-size: 15pt;">please=
 feel free to contact me at any time.</font></span></p><p style=3D"font-fam=
ily:Arial,verdana;font-size:12px; color:#000000;padding:0px;margin: 0;line-=
height: 25pt; text-align: left;"><span style=3D"font-family: Arial, Helveti=
ca;"><font style=3D"font-size: 15pt;"><br></font></span></p><p style=3D"fon=
t-family:Arial,verdana;font-size:12px; color:#000000;padding:0px;margin: 0;=
line-height: 25pt; text-align: left;"><span style=3D"font-family: Arial, He=
lvetica;"><font style=3D"font-size: 15pt;">Thank you&nbsp;</font></span></p=
><p style=3D"font-family:Arial,verdana;font-size:12px; color:#000000;paddin=
g:0px;margin: 0;line-height: 25pt; text-align: left;"><span style=3D"font-f=
amily: Arial, Helvetica; font-size: 18pt;"><br></span></p><p style=3D"font-=
family:Arial,verdana;font-size:12px; color:#000000;padding:0px;margin: 0;li=
ne-height: 25pt; text-align: left;"><span style=3D"font-family: Arial, Helv=
etica;"><font style=3D"font-size: 12pt;">Best wish</font></span></p><p styl=
e=3D"font-family:Arial,verdana;font-size:12px; color:#000000;padding:0px;ma=
rgin: 0;line-height: 25pt; text-align: left;"><span style=3D"font-family: A=
rial, Helvetica;"><font style=3D"font-size: 12pt;">Johnson<br><font color=
=3D"#006cfb">Email :john@rongfei.net</font></font></span></p><p style=3D"fo=
nt-family:Arial,verdana;font-size:12px; color:#000000;padding:0px;margin: 0=
;line-height: 25pt; text-align: left;"><font style=3D"font-size: 12pt;"><sp=
an style=3D"font-family: Arial, Helvetica;">-------------------------------=
-------------------------------------------------------------------</span><=
/font></p><p style=3D"font-family:Arial,verdana;font-size:12px; color:#0000=
00;padding:0px;margin: 0;line-height: 25pt; text-align: left;"><font style=
=3D"font-size: 12pt;"><span style=3D"font-family: Arial, Helvetica;">Electr=
onic product R&D team</span></font></p><p style=3D"font-family:Arial,verdan=
a;font-size:12px; color:#000000;padding:0px;margin: 0;line-height: 25pt; te=
xt-align: left;"><span style=3D"font-family: Arial, Helvetica;"><font style=
><font style=3D"font-size: 12pt;">Add&nbsp; &nbsp;: Room 1606, Jiahui New T=
own, Futian Sub-district, Futian District, Shenzhen City, China POSTAL: 518=
031 </font><br></font></span></p><p style=3D"font-family:Arial,verdana;font=
-size:12px; color:#000000;padding:0px;margin: 0;line-height: 25pt; text-ali=
gn: left;"><span style=3D"font-family: Arial, Helvetica;"><font style=3D"fo=
nt-size: 12pt;">-----------------------------------------------------------=
----------------------------------------</font></span></p></div>
=09=09=09</td></tr>
=09=09</tbody></table>
       =09  </div>
</td></tr>
<tr><td class=3D"txtsize" id=3D"elm_1762326874186" style=3D" mso-table-lspa=
ce:0pt; font-size:12px;font-family:Arial, Helvetica, sans-serif; mso-table-=
rspace:0pt;font-size:12px;border:0px;padding:0px 0px;border-collapse:collap=
se;" valign=3D"top">

=09    =09<table bgcolor=3D"transparent" border=3D"0" cellpadding=3D"0" cel=
lspacing=3D"0" style=3D" mso-table-lspace:0pt; mso-table-rspace:0pt;font-si=
ze:12px;border:0px;padding:0px;width:100%;border-collapse:collapse; mso-tab=
le-lspace:0pt; mso-table-rspace:0pt;word-break:break-word;background-color:=
transparent;">
=09    <tbody><tr>
=09=09<td class=3D"txtsize" style=3D"border-collapse:collapse; mso-table-ls=
pace:0pt; font-size:12px;font-family:Arial, Helvetica, sans-serif; mso-tabl=
e-rspace:0pt;font-size:12px;border:0px;padding:0px 0px;border-top:none none=
 none ;border-bottom:none none none;">
            =09<div class=3D"zpelement-wrapper image" coupcmp id=3D"elm_176=
2326874186" prodcmp style=3D";word-wrap:break-word;overflow:hidden;padding:=
0px;background-color:transparent;">
=09=09=09<div>
=09=09        <table align=3D"left" border=3D"0" cellpadding=3D"0" cellspac=
ing=3D"0" class=3D"zpAlignPos" style=3D" mso-table-lspace:0pt; mso-table-rs=
pace:0pt;font-size:12px;text-align:left;width:100%;padding:0px;border:0px;b=
order-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt;word-br=
eak:break-word;width:100%;text-align:left;">
            =09=09<tbody><tr><td class=3D"paddingcomp" style=3D"border-coll=
apse:collapse; mso-table-lspace:0pt; font-size:12px;font-family:Arial, Helv=
etica, sans-serif; mso-table-rspace:0pt;font-size:12px;border:0px;padding:7=
px 15px;text-align:center;padding-top:7px;padding-bottom:7px;padding-right:=
15px;padding-left:15px;">
=09=09=09<img align=3D"left" alt=3D"https://stratus.campaign-image.com/imag=
es/1473052000014702991_zc_v1_1762326878958_=E6=88=AA=E5=9B=BE.png" class=3D=
"zpImage" height=3D"auto" hspace=3D"0" size=3D"F" src=3D"https://stratus.ca=
mpaign-image.com/images/1473052000014703192_zc_v1_1762326878958_=E6=88=AA=
=E5=9B=BE.png" style=3D"width:570px;height:autopx;max-width:570px !importan=
t;border:0px;text-align:left;" vspace=3D"0" width=3D"570">
=09=09=09</td></tr>
=09=09=09</tbody></table>
=09=09</div>
            </div>
            </td></tr></tbody></table>
</td></tr>
<tr><td class=3D"txtsize" id=3D"elm_1762326915117" style=3D" mso-table-lspa=
ce:0pt; font-size:12px;font-family:Arial, Helvetica, sans-serif; mso-table-=
rspace:0pt;font-size:12px;border:0px;padding:0px 0px;border-collapse:collap=
se;" valign=3D"top">

          <div class=3D"zpelement-wrapper" id=3D"elm_1762326915117" style=
=3D";word-wrap:break-word;overflow:hidden;padding-right:0px;background-colo=
r:#f4f4f4;">
=09    =09<table bgcolor=3D"#f4f4f4" border=3D"0" cellpadding=3D"0" cellspa=
cing=3D"0" class=3D"zpAlignPos" style=3D" mso-table-lspace:0pt; mso-table-r=
space:0pt;font-size:12px;padding:0px;border:0px;border-collapse:collapse; m=
so-table-lspace:0pt; mso-table-rspace:0pt;word-break:break-word;-ms-text-si=
ze-adjust: 100%;-webkit-text-size-adjust: 100%;" width=3D"100%">
=09  =09
            <tbody><tr><td class=3D"paddingcomp" style=3D"border-collapse:c=
ollapse; mso-table-lspace:0pt; mso-table-rspace:0pt;border:0px;padding:7px =
15px;font-size:12pt;font-family:Arial,Helvetica;line-height:19pt;border-top=
:0px none ;   border-bottom:0px none ;padding-top:20px;padding-bottom:20px;=
padding-right:15px;padding-left:15px;">
             =09    =09=09<div componentbgcolor=3D"#f4f4f4" componentpaddin=
gbottom=3D"20px" componentpaddingleft=3D"15px" componentpaddingright=3D"15p=
x" componentpaddingtop=3D"20px" style><p align=3D"center" style=3D"font-fam=
ily:Arial,verdana;font-size:12px; color:#000000;padding:0px;margin: 0;line-=
height: 19pt; text-align: center;"><font color=3D"#333333" face=3D"Arial, H=
elvetica" style=3D"color: rgb(51, 51, 51); font-size: 10pt;">You are receiv=
ing this email as you signed up for our newsletters.</font></p><p align=3D"=
center" style=3D"font-family:Arial,verdana;font-size:12px; color:#000000;pa=
dding:0px;margin: 0;line-height: 19pt; text-align: center;"><font color=3D"=
#333333" face=3D"Arial, Helvetica" style=3D"color: rgb(51, 51, 51); font-si=
ze: 10pt;"><span><span>Want to change how you receive these emails?</span><=
br></span></font></p><p align=3D"center" style=3D"font-family:Arial,verdana=
;font-size:12px; color:#000000;padding:0px;margin: 0;line-height: 19pt; tex=
t-align: center;"><font color=3D"#333333" face=3D"Arial, Helvetica" style=
=3D"color: rgb(51, 51, 51); font-size: 10pt;"><span>You can <a alt=3D"Unsub=
scribe" href=3D"https://hgele-zgpm.maillist-manage.com/ua/optout?od=3D3zc97=
934e0781d7cc45a44b9fb7a17dd92ce3bcdbd4f59db73cc2d043dba41fb78&rd=3D1147154f=
d4c8f31c2&sd=3D1147154fd4c8f3013&n=3D124296e04fe637" rel=3D"noopener norefe=
rrer" style=3D"text-decoration:underline;color:#333333;" target=3D"_blank" =
title=3D"Unsubscribe" zcurl_name=3D"l_1"><font color=3D"#333333" style=3D"c=
olor:#333333;">Unsubscribe</font></a> or <a alt=3D"Update your preferences"=
 href=3D"https://hgele-zgpm.maillist-manage.com/click/1147154fd4c8f31c2/114=
7154fd4c8e1a6c" rel=3D"noopener noreferrer" style=3D"text-decoration:underl=
ine;color:#333333;" target=3D"_blank" title=3D"Update your preferences" zcu=
rl_name=3D"l_2"><font color=3D"#333333" style=3D"color:#333333;">Update you=
r preferences</font></a><br></span></font></p></div>
=09=09=09</td></tr>
=09=09</tbody></table>
       =09  </div>
</td></tr>
    </tbody></table>
</div>

=09=09=09=09=09</td>=20
=09=09=09=09=09</tr>=20
=09=09=09=09=09</tbody></table>
=09=09=09=09</td>=20
=09=09=09=09<td style=3D" mso-table-lspace:0pt; font-size:12px;font-family:=
Arial, Helvetica, sans-serif; mso-table-rspace:0pt;font-size:12px;border:0p=
x;padding:0px;border-collapse:collapse; mso-table-lspace:0pt; mso-table-rsp=
ace:0pt;">&nbsp;</td>
=09=09=09</tr>=20
=09=09</tbody></table>=20
</div>
</center>=20
<img style=3D'visibility:hidden' src=3D"https://hgele-zgpm.maillist-manage.=
com/click/1147154fd4c8f31c2/open.gif" alt=3D"" height=3D"1" width=3D"1"/><a=
 style=3D'visibility:hidden' href=3D"https://hgele-zgpm.maillist-manage.com=
/click/1147154fd4c8f31c2/1147154fd4c8e1a58" alt=3D"" height=3D"1" width=3D"=
1"/></body></html>
------=_Part_15042300_942541787.1773641144741--
