Return-Path: <SRS0=fWSz=ZG=m4.sendingservice.net=bounce-503582@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2532BC77B7C
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Jun 2025 15:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB61BC4CEEA; Mon, 23 Jun 2025 15:04:21 +0000 (UTC)
Received: from mta150.sendingservice.net (mta150.sendingservice.net [176.9.183.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3AC3C4CEF0
	for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 15:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3AC3C4CEF0
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=farsight.co.uk
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=m4.sendingservice.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=s01; d=sendingservice.net;
 h=Date:From:Reply-To:To:Message-ID:Subject:Mime-Version:Content-Type:
 Content-Transfer-Encoding:Feedback-ID:List-Unsubscribe:List-Unsubscribe-Post:
 From:To:Subject:CC:Date; i=bounce-503582@sendingservice.net;
 bh=3wSOaDMI03QoPrP46xXicDEkSsXNCQ92ru3vnZJeN24=;
 b=eezhVIFDwHaMMjGl7gEyrsXXnM2Zb7cJdQnGe8eFjKXr+l+bMYasNCFTMUQqyCCGSazf+nNa54RD
   iCm/vYGMyMltZaJTIZgV0ajqJqrihqPfkiiIXPQS4xtDCJhtGH/R640pBtUgQebuq4UfD39WYNsl
   nEZ+lPTnPua5vyH3jdQPcNfGWzmRRkk4jWYzCZYa0rsN7L26gCkp+NweIY+jfsLCfp7H+tKWXwxt
   H0ZXHpDIEqxD0F768OvFAEZ5kHnd43HloE5MHNk42x6/jDYojInyUUVignPEN9OG7sYqYJYUMU7J
   qTkaHv0gcHtoPd9gJssuAGInLDDd5xpsb6BitA==
Received: by mta150.sendingservice.net id hb5mf239s34l for <linux-firmware@kernel.org>; Mon, 23 Jun 2025 14:49:10 +0000 (envelope-from <bounce-503582@m4.sendingservice.net>)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=farsight.co.uk; q=dns/txt; s=mailpoet2; t=1750690150; bh=3wSOaDMI03QoPrP46xXicDEkSsXNCQ92ru3vnZJeN24=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:x-rid:x-message-id:x-userid:feedback-id:list-unsubscribe:list-unsubscribe-post; b=EuJhF8U9JQBwQbaa7ynsSXYrU+UEjYJZwlSv/2JRcxKQ+P1XQVx11HaM7BC2LYshNBRdi/mk2TgmCNDJl+I0xyuBK8sY/TRYuWNDezusIdMTcH+A22J/VbsqhX3fOLKfrfqy9t6ufA3RIKmU0wrzeXYrUUmOTNrlfu3/ReuybdfRgIR+OZBAtViWQQMNNnt7O2zgznfqoko8/vYJtaWExiHGedMgfdYBMfMQJKtmGgYPzmzrfG/ke6Iw3doxeF0cBE+1VwIj1KujKEtRDpZSFnuSv4AEvcRDWlZIi8oNKQyLQiD9vRen09LEANW5CLX9OPtQ7Iv3oEckewgrCNO8Yw==
Date: Mon, 23 Jun 2025 14:49:09 +0000
From: Farsight Security Services <marketing@farsight.co.uk>
Reply-To: Farsight Team <marketing@farsight.co.uk>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Message-ID: <12f2182b-7bdc-4ac3-a8b5-da1c89c73a90@sendingservice.net>
Subject: =?UTF-8?Q?Trusted_Monitoring_for_Your_Installs_=E2=80=93_Partner?=
 =?UTF-8?Q?_with_Farsight?=
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_68596965ebb12_257e402d501432316"
Content-Transfer-Encoding: 7bit
X-RID: 1ZWl5HT1y/Jpxh8HAupEMEe4kc/o+x0kTWRaEW2D8giCYYHRJpm9YFw9mv3Y62o0lnWJsQtNeY18Jqmjp8bVqiSGhlwZPWoDZU7hWZYpwfU9pXSqOR0a5eobyoTC90wdovwPDuoqfueXJTv4VIFyR/BRnUhdPuWjvL/3rmiSdVY=
X-Message-ID: 12f2182b-7bdc-4ac3-a8b5-da1c89c73a90
X-Campaign-ID: d3bebae218fddd4c-b96b41bc68b60df6
X-UserID: 503582
Feedback-ID: d3bebae218fddd4c-b96b41bc68b60df6:503582:newsletter:mailpoet
List-Unsubscribe: <https://www.farsight.co.uk/?mailpoet_page=subscriptions&mailpoet_router&endpoint=subscription&action=unsubscribe&data=eyJxdWV1ZUlkIjo1OSwidG9rZW4iOiIxOGFyZnB2ejcxMzR3ZzBra3cwbzh3a3djNG8wNHdnOCIsImVtYWlsIjoibGludXgtZmlybXdhcmVAa2VybmVsLm9yZyJ9>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-Virtual-MTA: mta150


----==_mimepart_68596965ebb12_257e402d501432316
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

[View this in your browser.](https://www.farsight.co.uk?mailpoet_router&e=
ndpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t=
3MG84d2t3YzRvMDR3ZzgiLCI1OSIsImZmMDI1Y2YzODdiYiIsZmFsc2Vd)

Hi "there",

Just reaching out to introduce ourselves =E2=80=93 we=E2=80=99re [Farsigh=
t Security Services](https://www.farsight.co.uk?mailpoet_router&endpoint=3D=
track&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Y=
zRvMDR3ZzgiLCI1OSIsIjJkNzIyOWM0MTRmZCIsZmFsc2Vd), a leading UK-based remo=
te monitoring station working closely with installers like you.

We work with CCTV and alarm installers across the UK to provide reliable =
monitoring for their clients, and we=E2=80=99re currently building new in=
staller relationships in your area.

Here=E2=80=99s what we offer:
=E2=9C=94=EF=B8=8F 24/7 event-driven CCTV & alarm monitoring for commerci=
al and residential sites
=E2=9C=94=EF=B8=8F Competitive pricing with flexible quarterly payment op=
tions
=E2=9C=94=EF=B8=8F Commissioning support and testing with our ARC
=E2=9C=94=EF=B8=8F Full transparency with live access to your monitored s=
ites
=E2=9C=94=EF=B8=8F Installer incentives and a dedicated UK-based support =
team

If you=E2=80=99re looking for a trusted monitoring partner or just want t=
o see how we work, you can download our info pack below:
=F0=9F=91=89 [Download Company Brochure](https://www.farsight.co.uk?mailp=
oet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno=
3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsIjUwYWRlOGQ1NTlkMSIsZmFsc2Vd)

Let us know if you=E2=80=99d like to have a [quick chat](https://www.fars=
ight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA=
4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsIjQzMjRmYjA5NTU2=
OSIsZmFsc2Vd) or want to test a site with us=E2=80=94happy to help.

Best regards,

The Farsight Team
[Watch Behind the Scenes at Farsight=E2=80=99s Control Room](https://www.=
farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI=
5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsIjI0NWQwZDUw=
OGQ1MyIsZmFsc2Vd)
=F0=9F=93=A7 info@farsight.co.uk
=F0=9F=8C=90 [www.farsight.co.uk](https://www.farsight.co.uk?mailpoet_rou=
ter&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2=
cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsIjhmNzg3YjcyMDRiMyIsZmFsc2Vd)
=F0=9F=93=9E 0845 371 0101

[=F0=9F=91=89 Get Your Free CCTV Quote](https://www.farsight.co.uk?mailpo=
et_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3=
MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsImIzMzQzNTRhYjg1NiIsZmFsc2Vd)

[=F0=9F=91=89 Get Your Free Alarm Quote](https://www.farsight.co.uk?mailp=
oet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno=
3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsImE0NTgxOTljY2YwZSIsZmFsc2Vd)

[facebook](https://www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&ac=
tion=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3Z=
zgiLCI1OSIsImM4YzU1ZGE0Nzk2MyIsZmFsc2Vd) [linkedin](https://www.farsight.=
co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4Iiwi=
MThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsIjhhYzM0ZTE3YWZjNCIsZ=
mFsc2Vd) [youtube](https://www.farsight.co.uk?mailpoet_router&endpoint=3D=
track&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Y=
zRvMDR3ZzgiLCI1OSIsImU1NWVkMDhjNDExMCIsZmFsc2Vd) [twitter](https://www.fa=
rsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5N=
DA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsIjc0MDFlNTQyZj=
BhMiIsZmFsc2Vd)
[Unsubscribe](https://www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack=
&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMD=
R3ZzgiLCI1OSIsIjU2Y2MzM2ZjOGQwMyIsZmFsc2Vd) | [Manage your subscription](=
https://www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclic=
k&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIs=
ImY2NzBiZDRlMGQwOSIsZmFsc2Vd)
The Observatory
Vicarage Farm Road
Peterborough
PE1 5TU
Tel: 01733 35 24 35=

----==_mimepart_68596965ebb12_257e402d501432316
Content-Type: text/html;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html lang=3D"en-GB" style=3D"margin:0;padding:0">
<head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8" />
    <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scal=
e=3D1" />
    <meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge" />
    <meta name=3D"format-detection" content=3D"telephone=3Dno" />
    =

    <title>Trusted Monitoring for Your Installs =E2=80=93 Partner with Fa=
rsight</title>
    <style type=3D"text/css"> @media screen and (max-width: 480px) {
            .mailpoet_button {width:100% !important;}
        }
 @media screen and (max-width: 599px) {
            .mailpoet_header {
                padding: 10px 20px;
            }
            .mailpoet_button {
                width: 100% !important;
                padding: 5px 0 !important;
                box-sizing:border-box !important;
            }
            div, .mailpoet_cols-two, .mailpoet_cols-three {
                max-width: 100% !important;
            }
        }
</style>
    <!--[if !mso]><!-- --><link href=3D"https://fonts.googleapis.com/css?=
family=3DRoboto:400,400i,700,700i" rel=3D"stylesheet" /><!--<![endif]-->
</head>
<body leftmargin=3D"0" topmargin=3D"0" marginwidth=3D"0" marginheight=3D"=
0" style=3D"margin:0;padding:0;background-color:#e6fbfc">
    <table class=3D"mailpoet_template" border=3D"0" width=3D"100%" cellpa=
dding=3D"0" cellspacing=3D"0" style=3D"border-collapse:collapse;border-sp=
acing:0;mso-table-lspace:0;mso-table-rspace:0">
        <tbody>
        <tr>
            <td class=3D"mailpoet_preheader" style=3D"border-collapse:col=
lapse;display:none;visibility:hidden;mso-hide:all;font-size:1px;color:#33=
3333;line-height:1px;max-height:0;max-width:0;opacity:0;overflow:hidden;-=
webkit-text-size-adjust:none" height=3D"1">
                =

            </td>
        </tr>
        <tr>
            <td align=3D"center" class=3D"mailpoet-wrapper" valign=3D"top=
" style=3D"border-collapse:collapse;background-color:#e6fbfc"><!--[if mso=
]>
                <table align=3D"center" border=3D"0" cellspacing=3D"0" ce=
llpadding=3D"0"
                       width=3D"660">
                    <tr>
                        <td class=3D"mailpoet_content-wrapper" align=3D"c=
enter" valign=3D"top" width=3D"660">
                <![endif]--><table class=3D"mailpoet_content-wrapper" bor=
der=3D"0" width=3D"660" cellpadding=3D"0" cellspacing=3D"0" style=3D"bord=
er-collapse:collapse;background-color:#ffffff;border-spacing:0;mso-table-=
lspace:0;mso-table-rspace:0;max-width:660px;width:100%">
                    <tbody>
                    =

      <tr>
        <td class=3D"mailpoet_content-cols-two" align=3D"left" style=3D"b=
order-collapse:collapse">
          <table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacin=
g=3D"0" style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspa=
ce:0;mso-table-rspace:0">
            <tbody>
              <tr>
                <td align=3D"center" style=3D"border-collapse:collapse;fo=
nt-size:0"><!--[if mso]>
                  <table border=3D"0" width=3D"100%" cellpadding=3D"0" ce=
llspacing=3D"0">
                    <tbody>
                      <tr>
      <td width=3D"330" valign=3D"top">
        <![endif]--><div style=3D"display:inline-block; max-width:330px; =
vertical-align:top; width:100%;">
          <table width=3D"330" class=3D"mailpoet_cols-two" border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0" align=3D"left" style=3D"border-collaps=
e:collapse;width:100%;max-width:330px;border-spacing:0;mso-table-lspace:0=
;mso-table-rspace:0;table-layout:fixed;margin-left:auto;margin-right:auto=
;padding-left:0;padding-right:0">
            <tbody>
      <tr>
        <td class=3D"mailpoet_spacer" bgcolor=3D"#ffffff" height=3D"28" v=
align=3D"top" style=3D"border-collapse:collapse"></td>
      </tr>
            </tbody>
          </table>
        </div><!--[if mso]>
      </td>
      <td width=3D"330" valign=3D"top">
        <![endif]--><div style=3D"display:inline-block; max-width:330px; =
vertical-align:top; width:100%;">
          <table width=3D"330" class=3D"mailpoet_cols-two" border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0" align=3D"left" style=3D"border-collaps=
e:collapse;width:100%;max-width:330px;border-spacing:0;mso-table-lspace:0=
;mso-table-rspace:0;table-layout:fixed;margin-left:auto;margin-right:auto=
;padding-left:0;padding-right:0">
            <tbody>
      <tr>
        <td class=3D"mailpoet_header_footer_padded mailpoet_header" style=
=3D"border-collapse:collapse;padding:10px 20px;line-height:19.2px;text-al=
ign:right;color:#222222;font-family:Arial, 'Helvetica Neue', Helvetica, s=
ans-serif;font-size:12px">
          <a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3D=
track&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Y=
zRvMDR3ZzgiLCI1OSIsImZmMDI1Y2YzODdiYiIsZmFsc2Vd" style=3D"color:#6cb7d4;t=
ext-decoration:underline">View this in your browser.</a>
        </td>
      </tr>
            </tbody>
          </table>
        </div><!--[if mso]>
      </td>
                  </tr>
                </tbody>
              </table>
            <![endif]--></td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
      <tr>
        <td class=3D"mailpoet_content" align=3D"center" style=3D"border-c=
ollapse:collapse">
          <table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacin=
g=3D"0" style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspa=
ce:0;mso-table-rspace:0">
            <tbody>
              <tr>
                <td style=3D"border-collapse:collapse;padding-left:0;padd=
ing-right:0">
                  <table width=3D"100%" border=3D"0" cellpadding=3D"0" ce=
llspacing=3D"0" class=3D"mailpoet_cols-one" style=3D"border-collapse:coll=
apse;border-spacing:0;mso-table-lspace:0;mso-table-rspace:0;table-layout:=
fixed;margin-left:auto;margin-right:auto;padding-left:0;padding-right:0">=

                    <tbody>
      <tr>
        <td class=3D"mailpoet_image mailpoet_padded_vertical mailpoet_pad=
ded_side" align=3D"center" valign=3D"top" style=3D"border-collapse:collap=
se;padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:2=
0px">
          <img src=3D"https://www.farsight.co.uk/wp-content/uploads/2025/=
06/header-image.png" width=3D"600" alt=3D"" style=3D"height:auto;max-widt=
h:100%;-ms-interpolation-mode:bicubic;border:0;display:block;outline:none=
;text-align:center" />
        </td>
      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_content" align=3D"center" style=3D"border-c=
ollapse:collapse">
          <table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacin=
g=3D"0" style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspa=
ce:0;mso-table-rspace:0">
            <tbody>
              <tr>
                <td style=3D"border-collapse:collapse;padding-left:0;padd=
ing-right:0">
                  <table width=3D"100%" border=3D"0" cellpadding=3D"0" ce=
llspacing=3D"0" class=3D"mailpoet_cols-one" style=3D"border-collapse:coll=
apse;border-spacing:0;mso-table-lspace:0;mso-table-rspace:0;table-layout:=
fixed;margin-left:auto;margin-right:auto;padding-left:0;padding-right:0">=

                    <tbody>
      <tr>
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <table style=3D"border-collapse:collapse;border-spacing:0;mso-t=
able-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:roboto,'helvetica n=
eue',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-=
height-alt:24px;word-break:break-word;word-wrap:break-word;text-align:lef=
t">
            Hi "there",<br /><br />
          </td>
        </tr></table>

<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:roboto,'helvetica n=
eue',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-=
height-alt:24px;word-break:break-word;word-wrap:break-word;text-align:lef=
t">
            Just reaching out to introduce ourselves &ndash; we&rsquo;re =
<a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&ac=
tion=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3Z=
zgiLCI1OSIsIjJkNzIyOWM0MTRmZCIsZmFsc2Vd" target=3D"_blank" style=3D"color=
:#10aeb4;text-decoration:underline">Farsight Security Services</a>, a lea=
ding UK-based remote monitoring station working closely with installers l=
ike you.<br /><br />
          </td>
        </tr></table>

<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:roboto,'helvetica n=
eue',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-=
height-alt:24px;word-break:break-word;word-wrap:break-word;text-align:lef=
t">
            We work with CCTV and alarm installers across the UK to provi=
de reliable monitoring for their clients, and we&rsquo;re currently build=
ing new installer relationships in your area.<br /><br />
          </td>
        </tr></table>

<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:roboto,'helvetica n=
eue',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-=
height-alt:24px;word-break:break-word;word-wrap:break-word;text-align:lef=
t">
            <span style=3D"color: #2dc26b"><strong>Here&rsquo;s what we o=
ffer:</strong></span><br />=E2=9C=94=EF=B8=8F 24/7 event-driven CCTV &amp=
; alarm monitoring for commercial and residential sites<br />=E2=9C=94=EF=
=B8=8F Competitive pricing with flexible quarterly payment options<br />=E2=
=9C=94=EF=B8=8F Commissioning support and testing with our ARC<br />=E2=9C=
=94=EF=B8=8F Full transparency with live access to your monitored sites<b=
r />=E2=9C=94=EF=B8=8F Installer incentives and a dedicated UK-based supp=
ort team<br /><br />
          </td>
        </tr></table>

<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:roboto,'helvetica n=
eue',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-=
height-alt:24px;word-break:break-word;word-wrap:break-word;text-align:lef=
t">
            If you&rsquo;re looking for a trusted monitoring partner or j=
ust want to see how we work, you can <strong>download our info pack below=
:</strong>
          </td>
        </tr></table>
<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:roboto,'helvetica n=
eue',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-=
height-alt:24px;word-break:break-word;word-wrap:break-word;text-align:lef=
t">
            =F0=9F=91=89 <strong><a href=3D"https://www.farsight.co.uk?ma=
ilpoet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZw=
dno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsIjUwYWRlOGQ1NTlkMSIsZmFsc2Vd"=
 class=3D"" target=3D"_blank" style=3D"color:#10aeb4;text-decoration:unde=
rline">Download Company Brochure</a></strong><br /><br />
          </td>
        </tr></table>
<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:roboto,'helvetica n=
eue',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-=
height-alt:24px;word-break:break-word;word-wrap:break-word;text-align:lef=
t">
            <strong></strong>
          </td>
        </tr></table>
<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:roboto,'helvetica n=
eue',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-=
height-alt:24px;word-break:break-word;word-wrap:break-word;text-align:lef=
t">
            Let us know if you&rsquo;d like to have a <a href=3D"https://=
www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3D=
WyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsIjQzMjRmY=
jA5NTU2OSIsZmFsc2Vd" target=3D"_blank" style=3D"color:#10aeb4;text-decora=
tion:underline">quick chat</a> or want to <span style=3D"color: #169179">=
<strong>test a site with us</strong></span>&mdash;happy to help.<br /><br=
 />
          </td>
        </tr></table>

<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:roboto,'helvetica n=
eue',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-=
height-alt:24px;word-break:break-word;word-wrap:break-word;text-align:lef=
t">
            Best regards, =

          </td>
        </tr></table>
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <table class=3D"" style=3D"border-collapse:collapse;border-spac=
ing:0;mso-table-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D=
"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:roboto,'helvetica n=
eue',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-=
height-alt:24px;word-break:break-word;word-wrap:break-word;text-align:lef=
t">
            <strong>The Farsight Team</strong>
          </td>
        </tr></table>
<table class=3D"" style=3D"border-collapse:collapse;border-spacing:0;mso-=
table-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:roboto,'helvetica n=
eue',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-=
height-alt:24px;word-break:break-word;word-wrap:break-word;text-align:lef=
t">
            <a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoin=
t=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d=
2t3YzRvMDR3ZzgiLCI1OSIsIjI0NWQwZDUwOGQ1MyIsZmFsc2Vd" target=3D"_blank" st=
yle=3D"color:#10aeb4;text-decoration:underline">Watch Behind the Scenes a=
t Farsight&rsquo;s Control Room</a>
          </td>
        </tr></table>
<table class=3D"" style=3D"border-collapse:collapse;border-spacing:0;mso-=
table-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:roboto,'helvetica n=
eue',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-=
height-alt:24px;word-break:break-word;word-wrap:break-word;text-align:lef=
t">
            =F0=9F=93=A7 <a class=3D"cursor-pointer" style=3D"color:#10ae=
b4;text-decoration:underline" href=3D"">info@farsight.co.uk</a><br />=F0=9F=
=8C=90 <a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3Dt=
rack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Yz=
RvMDR3ZzgiLCI1OSIsIjhmNzg3YjcyMDRiMyIsZmFsc2Vd" class=3D"" style=3D"color=
:#10aeb4;text-decoration:underline">www.farsight.co.uk</a>
          </td>
        </tr></table>
<table class=3D"" style=3D"border-collapse:collapse;border-spacing:0;mso-=
table-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:roboto,'helvetica n=
eue',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-=
height-alt:24px;word-break:break-word;word-wrap:break-word;text-align:lef=
t">
            =F0=9F=93=9E 0845 371 0101
          </td>
        </tr></table>
        </td>
      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_content-cols-two" align=3D"left" style=3D"b=
order-collapse:collapse">
          <table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacin=
g=3D"0" style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspa=
ce:0;mso-table-rspace:0">
            <tbody>
              <tr>
                <td align=3D"center" style=3D"border-collapse:collapse;fo=
nt-size:0"><!--[if mso]>
                  <table border=3D"0" width=3D"100%" cellpadding=3D"0" ce=
llspacing=3D"0">
                    <tbody>
                      <tr>
      <td width=3D"330" valign=3D"top">
        <![endif]--><div style=3D"display:inline-block; max-width:330px; =
vertical-align:top; width:100%;">
          <table width=3D"330" class=3D"mailpoet_cols-two" border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0" align=3D"left" style=3D"border-collaps=
e:collapse;width:100%;max-width:330px;border-spacing:0;mso-table-lspace:0=
;mso-table-rspace:0;table-layout:fixed;margin-left:auto;margin-right:auto=
;padding-left:0;padding-right:0">
            <tbody>
      <tr>
        <td class=3D"mailpoet_padded_vertical mailpoet_padded_side" valig=
n=3D"top" style=3D"border-collapse:collapse;padding-top:10px;padding-bott=
om:10px;padding-left:20px;padding-right:20px">
          <div>
            <table width=3D"100%" cellpadding=3D"0" cellspacing=3D"0" bor=
der=3D"0" style=3D"border-collapse:collapse;border-spacing:0;mso-table-ls=
pace:0;mso-table-rspace:0">
              <tr>
                <td class=3D"mailpoet_button-container" style=3D"border-c=
ollapse:collapse;text-align:center"><!--[if mso]>
                  <v:roundrect xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word"
                    href=3D"https://form.jotform.com/FarsightForms/basic-=
cctv-quote-request-end-user"
                    style=3D"height:34px;
                           width:190px;
                           v-text-anchor:middle;"
                    arcsize=3D"97%"
                    strokeweight=3D"0px"
                    strokecolor=3D"#111111"
                    fillcolor=3D"#10aeb4">
                  <w:anchorlock/>
                  <center style=3D"color:#ffffff;
                    font-family:Lucida;
                    font-size:12px;
                    font-weight:bold;">=F0=9F=91=89 Get Your Free CCTV Qu=
ote
                  </center>
                  </v:roundrect>
                  <![endif]-->
                  <!--[if !mso]><!-- -->
                  <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0"=
 role=3D"presentation" style=3D"border-collapse:separate;display:inline-b=
lock;mso-table-lspace:0;mso-table-rspace:0;width:190px" width=3D"190px">
                    <tr>
                      <td class=3D"mailpoet_table_button" valign=3D"middl=
e" role=3D"presentation" style=3D"border-collapse:collapse;mso-table-lspa=
ce:0;mso-table-rspace:0;display:block;text-decoration:none;text-align:cen=
ter;background-color:#10aeb4;border-color:#111111;border-width:0px;border=
-radius:33px;border-style:solid;width:190px;line-height:34px;color:#fffff=
f;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;font-siz=
e:12px;font-weight:bold">
                        <a class=3D"mailpoet_button" style=3D"color:#ffff=
ff;text-decoration:none;display:block;line-height:34px" href=3D"https://w=
ww.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3D=
WyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsImIzMzQzN=
TRhYjg1NiIsZmFsc2Vd" target=3D"_blank">=F0=9F=91=89 Get Your Free CCTV Qu=
ote</a>
                      </td>
                    </tr>
                  </table>
                  <!--<![endif]-->
                </td>
              </tr>
            </table>
          </div>
        </td>
      </tr>
            </tbody>
          </table>
        </div><!--[if mso]>
      </td>
      <td width=3D"330" valign=3D"top">
        <![endif]--><div style=3D"display:inline-block; max-width:330px; =
vertical-align:top; width:100%;">
          <table width=3D"330" class=3D"mailpoet_cols-two" border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0" align=3D"left" style=3D"border-collaps=
e:collapse;width:100%;max-width:330px;border-spacing:0;mso-table-lspace:0=
;mso-table-rspace:0;table-layout:fixed;margin-left:auto;margin-right:auto=
;padding-left:0;padding-right:0">
            <tbody>
      <tr>
        <td class=3D"mailpoet_padded_vertical mailpoet_padded_side" valig=
n=3D"top" style=3D"border-collapse:collapse;padding-top:10px;padding-bott=
om:10px;padding-left:20px;padding-right:20px">
          <div>
            <table width=3D"100%" cellpadding=3D"0" cellspacing=3D"0" bor=
der=3D"0" style=3D"border-collapse:collapse;border-spacing:0;mso-table-ls=
pace:0;mso-table-rspace:0">
              <tr>
                <td class=3D"mailpoet_button-container" style=3D"border-c=
ollapse:collapse;text-align:center"><!--[if mso]>
                  <v:roundrect xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word"
                    href=3D"https://form.jotform.com/FarsightForms/alarm-=
monitoring-quote"
                    style=3D"height:34px;
                           width:190px;
                           v-text-anchor:middle;"
                    arcsize=3D"97%"
                    strokeweight=3D"0px"
                    strokecolor=3D"#111111"
                    fillcolor=3D"#10aeb4">
                  <w:anchorlock/>
                  <center style=3D"color:#ffffff;
                    font-family:Lucida;
                    font-size:12px;
                    font-weight:bold;">=F0=9F=91=89 Get Your Free Alarm Q=
uote
                  </center>
                  </v:roundrect>
                  <![endif]-->
                  <!--[if !mso]><!-- -->
                  <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0"=
 role=3D"presentation" style=3D"border-collapse:separate;display:inline-b=
lock;mso-table-lspace:0;mso-table-rspace:0;width:190px" width=3D"190px">
                    <tr>
                      <td class=3D"mailpoet_table_button" valign=3D"middl=
e" role=3D"presentation" style=3D"border-collapse:collapse;mso-table-lspa=
ce:0;mso-table-rspace:0;display:block;text-decoration:none;text-align:cen=
ter;background-color:#10aeb4;border-color:#111111;border-width:0px;border=
-radius:33px;border-style:solid;width:190px;line-height:34px;color:#fffff=
f;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;font-siz=
e:12px;font-weight:bold">
                        <a class=3D"mailpoet_button" style=3D"color:#ffff=
ff;text-decoration:none;display:block;line-height:34px" href=3D"https://w=
ww.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3D=
WyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsImE0NTgxO=
TljY2YwZSIsZmFsc2Vd" target=3D"_blank">=F0=9F=91=89 Get Your Free Alarm Q=
uote</a>
                      </td>
                    </tr>
                  </table>
                  <!--<![endif]-->
                </td>
              </tr>
            </table>
          </div>
        </td>
      </tr>
            </tbody>
          </table>
        </div><!--[if mso]>
      </td>
                  </tr>
                </tbody>
              </table>
            <![endif]--></td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
      <tr>
        <td class=3D"mailpoet_content" align=3D"center" style=3D"border-c=
ollapse:collapse">
          <table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacin=
g=3D"0" style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspa=
ce:0;mso-table-rspace:0">
            <tbody>
              <tr>
                <td style=3D"border-collapse:collapse;padding-left:0;padd=
ing-right:0">
                  <table width=3D"100%" border=3D"0" cellpadding=3D"0" ce=
llspacing=3D"0" class=3D"mailpoet_cols-one" style=3D"border-collapse:coll=
apse;border-spacing:0;mso-table-lspace:0;mso-table-rspace:0;table-layout:=
fixed;margin-left:auto;margin-right:auto;padding-left:0;padding-right:0">=

                    <tbody>
      <tr>
        <td class=3D"mailpoet_image mailpoet_padded_vertical mailpoet_pad=
ded_side" align=3D"center" valign=3D"top" style=3D"border-collapse:collap=
se;padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:2=
0px">
          <img src=3D"https://www.farsight.co.uk/wp-content/uploads/2025/=
03/as-featured-600-x-250-px.png" width=3D"172" alt=3D"" style=3D"height:a=
uto;max-width:100%;-ms-interpolation-mode:bicubic;border:0;display:block;=
outline:none;text-align:center" />
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_padded_side mailpoet_padded_vertical" valig=
n=3D"top" align=3D"center" style=3D"border-collapse:collapse;padding-top:=
10px;padding-bottom:10px;padding-left:20px;padding-right:20px">
          <a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3D=
track&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Y=
zRvMDR3ZzgiLCI1OSIsImM4YzU1ZGE0Nzk2MyIsZmFsc2Vd" style=3D"color:#10aeb4;t=
ext-decoration:none!important"><img src=3D"https://www.farsight.co.uk/wp-=
content/plugins/mailpoet/assets/img/newsletter_editor/social-icons/03-cir=
cles/Facebook.png" width=3D"32" height=3D"32" style=3D"width:32px;height:=
32px;-ms-interpolation-mode:bicubic;border:0;display:inline;outline:none;=
" alt=3D"facebook" /></a>&nbsp;<a href=3D"https://www.farsight.co.uk?mail=
poet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdn=
o3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsIjhhYzM0ZTE3YWZjNCIsZmFsc2Vd" s=
tyle=3D"color:#10aeb4;text-decoration:none!important"><img src=3D"https:/=
/www.farsight.co.uk/wp-content/plugins/mailpoet/assets/img/newsletter_edi=
tor/social-icons/03-circles/LinkedIn.png" width=3D"32" height=3D"32" styl=
e=3D"width:32px;height:32px;-ms-interpolation-mode:bicubic;border:0;displ=
ay:inline;outline:none;" alt=3D"linkedin" /></a>&nbsp;<a href=3D"https://=
www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3D=
WyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsImU1NWVkM=
DhjNDExMCIsZmFsc2Vd" style=3D"color:#10aeb4;text-decoration:none!importan=
t"><img src=3D"https://www.farsight.co.uk/wp-content/plugins/mailpoet/ass=
ets/img/newsletter_editor/social-icons/03-circles/Youtube.png" width=3D"3=
2" height=3D"32" style=3D"width:32px;height:32px;-ms-interpolation-mode:b=
icubic;border:0;display:inline;outline:none;" alt=3D"youtube" /></a>&nbsp=
;<a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&a=
ction=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3=
ZzgiLCI1OSIsIjc0MDFlNTQyZjBhMiIsZmFsc2Vd" style=3D"color:#10aeb4;text-dec=
oration:none!important"><img src=3D"https://www.farsight.co.uk/wp-content=
/plugins/mailpoet/assets/img/newsletter_editor/social-icons/03-circles/Tw=
itter.png" width=3D"32" height=3D"32" style=3D"width:32px;height:32px;-ms=
-interpolation-mode:bicubic;border:0;display:inline;outline:none;" alt=3D=
"twitter" /></a>&nbsp;
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_header_footer_padded mailpoet_footer" style=
=3D"border-collapse:collapse;padding:10px 20px;line-height:19.2px;text-al=
ign:center;color:#222222;font-family:Arial, 'Helvetica Neue', Helvetica, =
sans-serif;font-size:12px">
          <strong><span style=3D"color: #b25088"><a href=3D"https://www.f=
arsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5=
NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsIjU2Y2MzM2ZjO=
GQwMyIsZmFsc2Vd" style=3D"color:#b25088;text-decoration:none">Unsubscribe=
</a> | <a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3Dt=
rack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Yz=
RvMDR3ZzgiLCI1OSIsImY2NzBiZDRlMGQwOSIsZmFsc2Vd" style=3D"color:#b25088;te=
xt-decoration:none">Manage your subscription</a></span></strong><br /><sp=
an>The Observatory</span><br /><span>Vicarage Farm Road</span><br /><span=
>Peterborough</span><br /><span>PE1 5TU</span><br /><span>Tel: 01733 35 2=
4 35</span>
        </td>
      </tr>
                    </tbody>
                  </table>
                </td>
              </tr>
            </tbody>
          </table>
        </td>
      </tr>
                    </tbody>
                </table><!--[if mso]>
                </td>
                </tr>
                </table>
                <![endif]--></td>
        </tr>
        </tbody>
    </table>
<img alt=3D"" class=3D"" src=3D"https://www.farsight.co.uk?mailpoet_route=
r&endpoint=3Dtrack&action=3Dopen&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa=
2t3MG84d2t3YzRvMDR3ZzgiLCI1OSIsbnVsbCxmYWxzZV0" /></body>
</html>

----==_mimepart_68596965ebb12_257e402d501432316--
