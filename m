Return-Path: <SRS0=MiPk=TY=rp.pmail.daneshkar.net=dusc7u@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31985E77188
	for <linux-firmware@archiver.kernel.org>; Tue, 31 Dec 2024 11:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0D2A2C4CED6; Tue, 31 Dec 2024 11:26:30 +0000 (UTC)
Received: from pmail.daneshkar.net (static.231.1.235.167.clients.your-server.de [167.235.1.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5A6FC4CED2
	for <linux-firmware@kernel.org>; Tue, 31 Dec 2024 11:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5A6FC4CED2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=daneshkar.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rp.pmail.daneshkar.net
Resent-Sender: dusc7u@rp.pmail.daneshkar.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=daneshkar.net;
	s=postal-UkMeMe; t=1735643528;
	bh=i9XEdc6DNEGT8oBhY+UIrk5GG8gYx105gri9H9aYqMk=;
	h=message-id:date:subject:from:reply-to:to:mime-version:content-type:list-unsubscribe;
	b=mHI6MYvcGZcAaj0dWgMFajj54/4ajVTWVJ5nxBL6XLye7Hj3jHAMwuFdsKgPfpvWBwK/wxfL
	+vO/v8w1Mlcxi09ivtDvzC7Jf1a23In6dHMh6Kyy9tmq1CtEXsVye+4RMaZkVQ3/ILiFCgpx
	TkNaOYERXa6XisRv72/wlBH7LbM=
X-Postal-MsgID: bTGJMe1jozJy
Received: from mautic.daneshkar.net (::ffff:172.30.0.3 [::ffff:172.30.0.3]) by pmail.daneshkar.net with SMTP; Tue, 31 Dec 2024 10:04:06 -0000
Message-ID: <5639ecc401d5114deffbdd1e12aaf690@mautic.daneshkar.net>
Date: Tue, 31 Dec 2024 10:03:51 +0000
Subject:  =?utf-8?Q?=D8=A7=DB=8C=D9=86_=D8=A8=D9=88=D8=AA=E2=80=8C?=
 =?utf-8?Q?=DA=A9=D9=85=D9=BE_=D8=B1=D8=A7=DB=8C=DA=AF=D8=A7=D9=86_=D8=B1?=
 =?utf-8?Q?=D9=88_=D8=B4=D8=B1=DA=A9=D8=AA_=DA=A9=D9=86_=D9=88_?=
 =?utf-8?Q?=D8=A7=D8=B3=D8=AA=D8=AE=D8=AF=D8=A7=D9=85_=D8=B4=D9=88=2E?=
From: =?utf-8?Q?=D9=87=D9=85=DA=A9=D8=A7=D8=B1=D8=A7=D9=86_?=
 =?utf-8?Q?=D8=B3=DB=8C=D8=B3=D8=AA=D9=85?= <info@daneshkar.net>
Reply-To: info@daneshkar.net
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="_=_swift_1735639431_a806e87cf7f3b3939dbbe856c8089c66_=_"
X-EMAIL-ID: 195
Precedence: Bulk
List-Unsubscribe: <http://mautic.daneshkar.net/email/unsubscribe/6773c19698cb0440302805>
Resent-Message-Id: <20241231112627.E5A6FC4CED2@smtp.kernel.org>
Resent-Date: Tue, 31 Dec 2024 11:26:27 +0000 (UTC)
Resent-From: SRS0=MiPk=TY=rp.pmail.daneshkar.net=dusc7u@kernel.org


--_=_swift_1735639431_a806e87cf7f3b3939dbbe856c8089c66_=_
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

[http://mautic.daneshkar.net/r/4c7c004b9c8e66e6c255a346f?ct=3DYTo1OntzOjY6I=
nNvdXJjZSI7YToyOntpOjA7czo1OiJlbWFpbCI7aToxO2k6MTk1O31zOjU6ImVtYWlsIjtpOjE5=
NTtzOjQ6InN0YXQiO3M6MjI6IjY3NzNjMTk2OThjYjA0NDAzMDI4MDUiO3M6NDoibGVhZCI7czo=
2OiI3NTA3MzciO3M6NzoiY2hhbm5lbCI7YToxOntzOjU6ImVtYWlsIjtpOjE5NTt9fQ%3D%3D&]=


=D8=A7=DA=AF=D8=B1 =D9=82=D8=A7=D8=AF=D8=B1 =D8=A8=D9=87 =D8=AF=DB=
=8C=D8=AF=D9=86 =D8=A7=DB=8C=D9=86 =D8=A7=DB=8C=D9=85=DB=8C=D9=84 =D9=86=
=DB=8C=D8=B3=D8=AA=DB=8C=D8=AF=D8=8C
=D8=A7=DB=8C=D9=86=D8=AC=D8=A7 [http=
://mautic.daneshkar.net/r/4a748c5dd91f4671f58f9c095?ct=3DYTo1OntzOjY6InNvdX=
JjZSI7YToyOntpOjA7czo1OiJlbWFpbCI7aToxO2k6MTk1O31zOjU6ImVtYWlsIjtpOjE5NTtzO=
jQ6InN0YXQiO3M6MjI6IjY3NzNjMTk2OThjYjA0NDAzMDI4MDUiO3M6NDoibGVhZCI7czo2OiI3=
NTA3MzciO3M6NzoiY2hhbm5lbCI7YToxOntzOjU6ImVtYWlsIjtpOjE5NTt9fQ%3D%3D&]=
=DA=A9=D9=84=DB=8C=DA=A9
=DA=A9=D9=86=DB=8C=D8=AF

Unsubscribe

--_=_swift_1735639431_a806e87cf7f3b3939dbbe856c8089c66_=_
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!doctype html>
<html lang=3D"en" xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:sch=
emas-microsoft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"=
>

<head>
  <title> =D8=A7=DB=8C=D9=86 =D8=A8=D9=88=D8=AA=E2=80=8C=DA=A9=D9=85=D9=
=BE =D8=B1=D8=A7=DB=8C=DA=AF=D8=A7=D9=86 =D8=B1=D9=88 =D8=B4=D8=B1=DA=A9=
=D8=AA =DA=A9=D9=86 =D9=88 =D8=A7=D8=B3=D8=AA=D8=AE=D8=AF=D8=A7=D9=85 =
=D8=B4=D9=88.</title>
  <!--[if !mso]><!-->
  <meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
  <!--<![endif]-->
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8">
  <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D=
1">
  <style type=3D"text/css">
    #outlook a {
      padding: 0;
    }

    body {
      margin: 0;
      padding: 0;
      -webkit-text-size-adjust: 100%;
      -ms-text-size-adjust: 100%;
    }

    table,
    td {
      border-collapse: collapse;
      mso-table-lspace: 0pt;
      mso-table-rspace: 0pt;
    }

    img {
      border: 0;
      height: auto;
      line-height: 100%;
      outline: none;
      text-decoration: none;
      -ms-interpolation-mode: bicubic;
    }

    p {
      display: block;
      margin: 13px 0;
    }
  </style>
  <!--[if mso]>
        <noscript>
        <xml>
        <o:OfficeDocumentSettings>
          <o:AllowPNG/>
          <o:PixelsPerInch>96</o:PixelsPerInch>
        </o:OfficeDocumentSettings>
        </xml>
        </noscript>
        <![endif]-->
  <!--[if lte mso 11]>
        <style type=3D"text/css">
          .mj-outlook-group-fix { width:100% !important; }
        </style>
        <![endif]-->
  <!--[if !mso]><!-->
  <link href=3D"https://fonts.googleapis.com/css?family=3DUbuntu:300,400,50=
0,700" rel=3D"stylesheet" type=3D"text/css">
  <style type=3D"text/css">
    @import url(https://fonts.googleapis.com/css?family=3DUbuntu:300,400,50=
0,700);
  </style>
  <!--<![endif]-->
  <style type=3D"text/css">
    @media only screen and (min-width:480px) {
      .mj-column-per-100 {
        width: 100% !important;
        max-width: 100%;
      }
    }
  </style>
  <style media=3D"screen and (min-width:480px)">
    .moz-text-html .mj-column-per-100 {
      width: 100% !important;
      max-width: 100%;
    }
  </style>
  <style type=3D"text/css">
    @media only screen and (max-width:480px) {
      table.mj-full-width-mobile {
        width: 100% !important;
      }

      td.mj-full-width-mobile {
        width: auto !important;
      }
    }
  </style>
  <style type=3D"text/css">
  </style>
  <!-- CSS-STYLE -->
</head>

<body style=3D"word-spacing:normal;background-color:#d6dde5;">
  <div style=3D"background-color:#d6dde5;">
    <!-- LOGO HEADER -->
    <!-- SECTION HEADER -->
    <!-- SECTION HERO -->
    <!-- SECTION TEXT + BUTTON -->
    <!-- SECTION SPACER -->
    <!--[if mso | IE]><table align=3D"center" border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0" class=3D"" role=3D"presentation" style=3D"width:600px;"=
 width=3D"600" ><tr><td style=3D"line-height:0px;font-size:0px;mso-line-hei=
ght-rule:exactly;"><![endif]-->
    <div style=3D"margin:0px auto;max-width:600px;">
      <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D=
"0" role=3D"presentation" style=3D"width:100%;">
        <tbody>
          <tr>
            <td style=3D"direction:ltr;font-size:0px;padding:20px 0;padding=
-bottom:0px;padding-top:0px;text-align:center;">
              <!--[if mso | IE]><table role=3D"presentation" border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0"><tr></tr></table><![endif]-->
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <!--[if mso | IE]></td></tr></table><![endif]-->
    <!-- SECTION IMAGE + TEXT + BUTTON -->
    <!-- SECTION SPACER -->
    <!--[if mso | IE]><table align=3D"center" border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0" class=3D"" role=3D"presentation" style=3D"width:600px;"=
 width=3D"600" ><tr><td style=3D"line-height:0px;font-size:0px;mso-line-hei=
ght-rule:exactly;"><![endif]-->
    <div style=3D"margin:0px auto;max-width:600px;">
      <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D=
"0" role=3D"presentation" style=3D"width:100%;">
        <tbody>
          <tr>
            <td style=3D"direction:ltr;font-size:0px;padding:20px 0;padding=
-bottom:0px;padding-top:0px;text-align:center;">
              <!--[if mso | IE]><table role=3D"presentation" border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0"><tr></tr></table><![endif]-->
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <!--[if mso | IE]></td></tr></table><![endif]-->
    <!-- SECTION 2-COLUMNS IMAGE + TEXT + BUTTON -->
    <!-- SECTION SPACER -->
    <!--[if mso | IE]><table align=3D"center" border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0" class=3D"" role=3D"presentation" style=3D"width:600px;"=
 width=3D"600" ><tr><td style=3D"line-height:0px;font-size:0px;mso-line-hei=
ght-rule:exactly;"><![endif]-->
    <div style=3D"margin:0px auto;max-width:600px;">
      <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D=
"0" role=3D"presentation" style=3D"width:100%;">
        <tbody>
          <tr>
            <td style=3D"direction:ltr;font-size:0px;padding:20px 0;padding=
-bottom:0px;padding-top:0px;text-align:center;">
              <!--[if mso | IE]><table role=3D"presentation" border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0"><tr></tr></table><![endif]-->
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <!--[if mso | IE]></td></tr></table><![endif]-->
    <!-- SECTION FOOTER -->
    <!--[if mso | IE]><table align=3D"center" border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0" class=3D"" role=3D"presentation" style=3D"width:600px;"=
 width=3D"600" ><tr><td style=3D"line-height:0px;font-size:0px;mso-line-hei=
ght-rule:exactly;"><![endif]-->
    <div style=3D"margin:0px auto;max-width:600px;">
      <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D=
"0" role=3D"presentation" style=3D"width:100%;">
        <tbody>
          <tr>
            <td style=3D"direction:ltr;font-size:0px;padding:20px 0;padding=
-bottom:0px;padding-top:0px;text-align:center;">
              <!--[if mso | IE]><table role=3D"presentation" border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0"><tr></tr></table><![endif]-->
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <!--[if mso | IE]></td></tr></table><![endif]-->
    <!-- SECTION POLICY -->
    <!--[if mso | IE]><table align=3D"center" border=3D"0" cellpadding=3D"0=
" cellspacing=3D"0" class=3D"graylink-outlook" role=3D"presentation" style=
=3D"width:600px;" width=3D"600" ><tr><td style=3D"line-height:0px;font-size=
:0px;mso-line-height-rule:exactly;"><![endif]-->
    <div class=3D"graylink" style=3D"margin:0px auto;max-width:600px;">
      <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D=
"0" role=3D"presentation" style=3D"width:100%;">
        <tbody>
          <tr>
            <td style=3D"direction:ltr;font-size:0px;padding:20px 0;padding=
-bottom:60px;padding-top:20px;text-align:center;">
              <!--[if mso | IE]><table role=3D"presentation" border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0"><tr><td class=3D"" style=3D"vertical-ali=
gn:middle;width:600px;" ><![endif]-->
              <div class=3D"mj-column-per-100 mj-outlook-group-fix" style=
=3D"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertic=
al-align:middle;width:100%;">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" rol=
e=3D"presentation" style=3D"vertical-align:middle;" width=3D"100%">
                  <tbody>
                    <tr>
                      <td align=3D"center" style=3D"font-size:0px;padding:1=
0px 25px;word-break:break-word;">
                        <table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"border-collapse:collapse;border-spaci=
ng:0px;">
                          <tbody>
                            <tr>
                              <td style=3D"width:550px;">
                                <a href=3D"http://mautic.daneshkar.net/r/4c=
7c004b9c8e66e6c255a346f?ct=3DYTo1OntzOjY6InNvdXJjZSI7YToyOntpOjA7czo1OiJlbW=
FpbCI7aToxO2k6MTk1O31zOjU6ImVtYWlsIjtpOjE5NTtzOjQ6InN0YXQiO3M6MjI6IjY3NzNjM=
Tk2OThjYjA0NDAzMDI4MDUiO3M6NDoibGVhZCI7czo2OiI3NTA3MzciO3M6NzoiY2hhbm5lbCI7=
YToxOntzOjU6ImVtYWlsIjtpOjE5NTt9fQ%3D%3D&" target=3D"_blank">
                                  <img alt=3D"=D9=87=D9=85=DA=A9=D8=A7=
=D8=B1=D8=A7=D9=86 =D8=B3=DB=8C=D8=B3=D8=AA=D9=85=D8=8C =D8=B1=D8=A7=DB=
=8C=DA=AF=D8=A7=D9=86 =D8=A8=D8=B1=DA=AF=D8=B2=D8=A7=D8=B1 =D9=85=DB=8C=
=E2=80=8C=DA=A9=D8=AF=D8=AF" height=3D"auto" src=3D"http://mautic.daneshkar=
.net/media/images/photo_2024-12-30_10-07-32.jpg" style=3D"border:0;display:=
block;outline:none;text-decoration:none;height:auto;width:100%;font-size:13=
px;" width=3D"550">
                                </a>
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td align=3D"center" style=3D"font-size:0px;padding:1=
0px 25px;word-break:break-word;">
                        <div style=3D"font-family:Ubuntu, Helvetica, Arial,=
 sans-serif;font-size:13px;line-height:1;text-align:center;color:#000000;">
                          <p style=3D"margin: 0; padding: 0;">=D8=A7=DA=
=AF=D8=B1 =D9=82=D8=A7=D8=AF=D8=B1 =D8=A8=D9=87 =D8=AF=DB=8C=D8=AF=D9=86 =
=D8=A7=DB=8C=D9=86 =D8=A7=DB=8C=D9=85=DB=8C=D9=84 =D9=86=DB=8C=D8=B3=D8=
=AA=DB=8C=D8=AF=D8=8C <a href=3D"http://mautic.daneshkar.net/r/4a748c5dd91f=
4671f58f9c095?ct=3DYTo1OntzOjY6InNvdXJjZSI7YToyOntpOjA7czo1OiJlbWFpbCI7aTox=
O2k6MTk1O31zOjU6ImVtYWlsIjtpOjE5NTtzOjQ6InN0YXQiO3M6MjI6IjY3NzNjMTk2OThjYjA=
0NDAzMDI4MDUiO3M6NDoibGVhZCI7czo2OiI3NTA3MzciO3M6NzoiY2hhbm5lbCI7YToxOntzOj=
U6ImVtYWlsIjtpOjE5NTt9fQ%3D%3D&">=D8=A7=DB=8C=D9=86=D8=AC=D8=A7 </a>=DA=
=A9=D9=84=DB=8C=DA=A9 =DA=A9=D9=86=DB=8C=D8=AF</p>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td align=3D"center" style=3D"font-size:0px;padding:1=
0px 25px;padding-top:0px;padding-bottom:0px;word-break:break-word;">
                        <div style=3D"font-family:Ubuntu, Helvetica, Arial,=
 sans-serif;font-size:13px;line-height:1.5;text-align:center;color:#6d6d6d;=
">
                          <p style=3D"margin: 0; padding: 0;"><a href=3D"ht=
tp://mautic.daneshkar.net/email/unsubscribe/6773c19698cb0440302805">Unsubsc=
ribe</a></p>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!--[if mso | IE]></td></tr></table><![endif]-->
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <!--[if mso | IE]></td></tr></table><![endif]-->
  </div>
<img height=3D"1" width=3D"1" src=3D"http://mautic.daneshkar.net/email/6773=
c19698cb0440302805.gif" alt=3D"" /></body>

</html>

--_=_swift_1735639431_a806e87cf7f3b3939dbbe856c8089c66_=_--

