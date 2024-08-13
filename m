Return-Path: <SRS0=RnIW=PM=rp.pmail.daneshkar.net=dusc7u@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120A6C52D7B
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Aug 2024 08:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6FBCC4AF17; Tue, 13 Aug 2024 08:30:38 +0000 (UTC)
Received: from pmail.daneshkar.net (static.231.1.235.167.clients.your-server.de [167.235.1.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 379FBC4AF10
	for <linux-firmware@kernel.org>; Tue, 13 Aug 2024 08:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 379FBC4AF10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=daneshkar.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=rp.pmail.daneshkar.net
Resent-Sender: dusc7u@rp.pmail.daneshkar.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=daneshkar.net;
	s=postal-UkMeMe; t=1723537835;
	bh=Sxr9+JpICny81WYMIDca8RZLgv32pPvSKmN9S0P57cM=;
	h=message-id:date:subject:from:reply-to:to:mime-version:content-type:list-unsubscribe;
	b=Dave/NIbXSMGeuUJqps2/bEHG9iu3NxhfEbbXgoH/d+j/KD3Pbx0yfECADcGp5Uh0eB6PyKC
	3ytiJ0KqGgfsZx9Z6djYF7M8ZJF4+tlsrDFrlIvv7zNNksWn+HyFyrQbP6TrW4qsKjgDKJeU
	UQBDGRjneWs46y7JfzxCnLZxzM4=
X-Postal-MsgID: XMEFjkYR3XkX
Received: from mautic.daneshkar.net (::ffff:172.26.0.3 [::ffff:172.26.0.3]) by pmail.daneshkar.net with SMTP; Tue, 13 Aug 2024 07:46:43 -0000
Message-ID: <a305e8e1cabeca3da2a62d1717483d51@mautic.daneshkar.net>
Date: Tue, 13 Aug 2024 07:46:26 +0000
Subject: =?utf-8?Q?=D8=A7=D8=B2_=D9=85=D8=B3=D8=AA=D8=B9=D8=AF?=
 =?utf-8?Q?=D8=AA=D8=B1=DB=8C=D9=86=E2=80=8C=D9=87=D8=A7_?=
 =?utf-8?Q?=D8=A7=D8=B3=D8=AA=D8=AE=D8=AF=D8=A7=D9=85_?=
 =?utf-8?Q?=DA=A9=D9=86=DB=8C=D8=AF=2E?=
From: =?utf-8?Q?=D8=AF=D8=A7=D9=86=D8=B4=DA=A9=D8=A7=D8=B1?=
 <info@daneshkar.net>
Reply-To: info@daneshkar.net
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="_=_swift_1723535186_2f7a1538afd5c81f6877a89ab8cd715d_=_"
X-EMAIL-ID: 95
Precedence: Bulk
List-Unsubscribe: <http://mautic.daneshkar.net/email/unsubscribe/66bb0f6380000614118982>
Resent-Message-Id: <20240813083036.379FBC4AF10@smtp.kernel.org>
Resent-Date: Tue, 13 Aug 2024 08:30:35 +0000 (UTC)
Resent-From: SRS0=RnIW=PM=rp.pmail.daneshkar.net=dusc7u@kernel.org


--_=_swift_1723535186_2f7a1538afd5c81f6877a89ab8cd715d_=_
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

=D8=A7=DA=AF=D8=B1 =D9=82=D8=A7=D8=AF=D8=B1 =D8=A8=D9=87 =D8=AF=DB=8C=D8=
=AF=D9=86 =D8=A7=DB=8C=D9=86 =D8=A7=DB=8C=D9=85=DB=8C=D9=84 =D9=86=DB=8C=
=D8=B3=D8=AA=DB=8C=D8=AF=D8=8C
=D8=A7=DB=8C=D9=86=D8=AC=D8=A7 [http://mau=
tic.daneshkar.net/r/e8757db11094bfb036c66916a?ct=3DYTo1OntzOjY6InNvdXJjZSI7=
YToyOntpOjA7czo1OiJlbWFpbCI7aToxO2k6OTU7fXM6NToiZW1haWwiO2k6OTU7czo0OiJzdGF=
0IjtzOjIyOiI2NmJiMGY2MzgwMDAwNjE0MTE4OTgyIjtzOjQ6ImxlYWQiO3M6NjoiNzUwNzM3Ij=
tzOjc6ImNoYW5uZWwiO2E6MTp7czo1OiJlbWFpbCI7aTo5NTt9fQ%3D%3D&] =DA=A9=D9=
=84=DB=8C=DA=A9
=DA=A9=D9=86=DB=8C=D8=AF.

[http://mautic.daneshkar.n=
et/r/a763fbe0f564b5802cd7a190d?ct=3DYTo1OntzOjY6InNvdXJjZSI7YToyOntpOjA7czo=
1OiJlbWFpbCI7aToxO2k6OTU7fXM6NToiZW1haWwiO2k6OTU7czo0OiJzdGF0IjtzOjIyOiI2Nm=
JiMGY2MzgwMDAwNjE0MTE4OTgyIjtzOjQ6ImxlYWQiO3M6NjoiNzUwNzM3IjtzOjc6ImNoYW5uZ=
WwiO2E6MTp7czo1OiJlbWFpbCI7aTo5NTt9fQ%3D%3D&]

Unsubscribe

--_=_swift_1723535186_2f7a1538afd5c81f6877a89ab8cd715d_=_
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!doctype html>
<html lang=3D"en" xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:sch=
emas-microsoft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"=
>

<head>
  <title>=D8=A7=D8=B2 =D9=85=D8=B3=D8=AA=D8=B9=D8=AF=D8=AA=D8=B1=DB=8C=
=D9=86=E2=80=8C=D9=87=D8=A7 =D8=A7=D8=B3=D8=AA=D8=AE=D8=AF=D8=A7=D9=85 =
=DA=A9=D9=86=DB=8C=D8=AF.</title>
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
" cellspacing=3D"0" class=3D"" role=3D"presentation" style=3D"width:600px;"=
 width=3D"600" ><tr><td style=3D"line-height:0px;font-size:0px;mso-line-hei=
ght-rule:exactly;"><![endif]-->
    <div style=3D"margin:0px auto;max-width:600px;">
      <table align=3D"center" border=3D"0" cellpadding=3D"0" cellspacing=3D=
"0" role=3D"presentation" style=3D"width:100%;">
        <tbody>
          <tr>
            <td style=3D"direction:ltr;font-size:0px;padding:20px 0;text-al=
ign:center;">
              <!--[if mso | IE]><table role=3D"presentation" border=3D"0" c=
ellpadding=3D"0" cellspacing=3D"0"><tr><td class=3D"" style=3D"vertical-ali=
gn:top;width:600px;" ><![endif]-->
              <div class=3D"mj-column-per-100 mj-outlook-group-fix" style=
=3D"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertic=
al-align:top;width:100%;">
                <table border=3D"0" cellpadding=3D"0" cellspacing=3D"0" rol=
e=3D"presentation" style=3D"vertical-align:top;" width=3D"100%">
                  <tbody>
                    <tr>
                      <td align=3D"center" style=3D"font-size:0px;padding:1=
0px 25px;word-break:break-word;">
                        <div style=3D"font-family:Ubuntu, Helvetica, Arial,=
 sans-serif;font-size:13px;line-height:1;text-align:center;color:#000000;">
                          <p style=3D"margin: 0; padding: 0;">=D8=A7=DA=
=AF=D8=B1 =D9=82=D8=A7=D8=AF=D8=B1 =D8=A8=D9=87 =D8=AF=DB=8C=D8=AF=D9=86 =
=D8=A7=DB=8C=D9=86 =D8=A7=DB=8C=D9=85=DB=8C=D9=84 =D9=86=DB=8C=D8=B3=D8=
=AA=DB=8C=D8=AF=D8=8C <a href=3D"http://mautic.daneshkar.net/r/e8757db11094=
bfb036c66916a?ct=3DYTo1OntzOjY6InNvdXJjZSI7YToyOntpOjA7czo1OiJlbWFpbCI7aTox=
O2k6OTU7fXM6NToiZW1haWwiO2k6OTU7czo0OiJzdGF0IjtzOjIyOiI2NmJiMGY2MzgwMDAwNjE=
0MTE4OTgyIjtzOjQ6ImxlYWQiO3M6NjoiNzUwNzM3IjtzOjc6ImNoYW5uZWwiO2E6MTp7czo1Oi=
JlbWFpbCI7aTo5NTt9fQ%3D%3D&">=D8=A7=DB=8C=D9=86=D8=AC=D8=A7</a> =DA=A9=
=D9=84=DB=8C=DA=A9 =DA=A9=D9=86=DB=8C=D8=AF.</p>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td align=3D"center" style=3D"font-size:0px;padding:1=
0px 25px;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;word=
-break:break-word;">
                        <table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"border-collapse:collapse;border-spaci=
ng:0px;">
                          <tbody>
                            <tr>
                              <td style=3D"width:600px;">
                                <img height=3D"auto" src=3D"http://mautic.d=
aneshkar.net/media/images/internship-talent-email-top.jpg" style=3D"border:=
0;display:block;outline:none;text-decoration:none;height:auto;width:100%;fo=
nt-size:13px;" width=3D"600">
                              </td>
                            </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                    <tr>
                      <td align=3D"center" style=3D"font-size:0px;padding:1=
0px 25px;padding-top:0;padding-right:0;padding-bottom:0;padding-left:0;word=
-break:break-word;">
                        <table border=3D"0" cellpadding=3D"0" cellspacing=
=3D"0" role=3D"presentation" style=3D"border-collapse:collapse;border-spaci=
ng:0px;">
                          <tbody>
                            <tr>
                              <td style=3D"width:600px;">
                                <a href=3D"http://mautic.daneshkar.net/r/a7=
63fbe0f564b5802cd7a190d?ct=3DYTo1OntzOjY6InNvdXJjZSI7YToyOntpOjA7czo1OiJlbW=
FpbCI7aToxO2k6OTU7fXM6NToiZW1haWwiO2k6OTU7czo0OiJzdGF0IjtzOjIyOiI2NmJiMGY2M=
zgwMDAwNjE0MTE4OTgyIjtzOjQ6ImxlYWQiO3M6NjoiNzUwNzM3IjtzOjc6ImNoYW5uZWwiO2E6=
MTp7czo1OiJlbWFpbCI7aTo5NTt9fQ%3D%3D&" target=3D"_blank">
                                  <img alt=3D"=D8=AB=D8=A8=D8=AA =D8=A2=
=DA=AF=D9=87=DB=8C =D8=B4=D8=BA=D9=84=DB=8C =D8=AF=D8=B1 =D8=A8=D9=87=D8=
=AA=D8=B1=DB=8C=D9=86 =D9=BE=D9=84=D8=AA=D9=81=D8=B1=D9=85 =DA=A9=D8=A7=
=D8=B1=D8=A2=D9=85=D9=88=D8=B2=DB=8C =D9=88 =D8=AF=D8=A7=D9=86=D8=B4=D8=
=AC=D9=88=DB=8C=DB=8C =D8=A8=D9=87 =D8=B5=D9=88=D8=B1=D8=AA =D8=B1=D8=A7=
=DB=8C=DA=AF=D8=A7=D9=86! =D8=A7=DB=8C=D9=86=D8=AC=D8=A7 =DA=A9=D9=84=DB=
=8C=DA=A9 =DA=A9=D9=86=DB=8C=D8=AF." height=3D"auto" src=3D"http://mautic.d=
aneshkar.net/media/images/internship-talent-email-bottom.jpg" style=3D"bord=
er:0;display:block;outline:none;text-decoration:none;height:auto;width:100%=
;font-size:13px;" width=3D"600">
                                </a>
                              </td>
                            </tr>
                          </tbody>
                        </table>
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
    <!--[if mso | IE]></td></tr></table><table align=3D"center" border=3D"0=
" cellpadding=3D"0" cellspacing=3D"0" class=3D"graylink-outlook" role=3D"pr=
esentation" style=3D"width:600px;" width=3D"600" ><tr><td style=3D"line-hei=
ght:0px;font-size:0px;mso-line-height-rule:exactly;"><![endif]-->
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
0px 25px;padding-top:0px;padding-bottom:0px;word-break:break-word;">
                        <div style=3D"font-family:Ubuntu, Helvetica, Arial,=
 sans-serif;font-size:13px;line-height:1.5;text-align:center;color:#6d6d6d;=
">
                          <p style=3D"margin: 0; padding: 0; font-size: 11p=
x;"><a href=3D"http://mautic.daneshkar.net/email/unsubscribe/66bb0f63800006=
14118982">Unsubscribe</a> </p>
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
<img height=3D"1" width=3D"1" src=3D"http://mautic.daneshkar.net/email/66bb=
0f6380000614118982.gif" alt=3D"" /></body>

</html>

--_=_swift_1723535186_2f7a1538afd5c81f6877a89ab8cd715d_=_--

