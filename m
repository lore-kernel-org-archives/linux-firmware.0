Return-Path: <SRS0=UHmk=G2=jiocx.info=info@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3103C61DD6
	for <linux-firmware@archiver.kernel.org>; Wed,  2 Sep 2026 10:31:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A25BC1F00A3A; Wed,  2 Sep 2026 10:31:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=116.50.98.98
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788345105;
	b=KQL2hfL3Q+LDDDuUlPIogOr2fQCz+Wk67E1FzlB1edXpOGWKylog7sSrtC1JDX99iaXQ
	 DFbYY6tpsutZuOjqSPD12T/fht0tKIVN15LHEoZZM4GEksDV7Ky7vjrwi27vBPxI6KCCw
	 7FS728Wm/jbEGHvgvArD+Fz1+VqY6lES7i/zsgzL7Ox7GrTYRqIzzMJ+tCSkiNP11o6zX
	 IhbPLodtpBWi5hrXfwkDANeT8i19gfsUh5MhWr3pkzc5w7v+219U6S/cDdfOt9IJgNzed
	 U+mMyO3nY4AsyLufdnaT1o9vjjewW3FEYsDPK38aEBrTPyEoCJR+HTPDbczvTRJA0Tw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788345105;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:Date:From:List-Id:
	 To:Subject:List-Unsubscribe:List-Unsubscribe-Post:Reply-To:Message-ID:
	 Content-Type;
	bh=T2qcf5GrhrYWrKegTWZ4t+C6diZinyHBAlfpZ6B2tnc=;
	b=CJbr1AF3KSAil9zBHqfHs8+JYr8ILarmCquCOmvOiKAE0x1ZV7LxKyiSUWg45D39oyji
	 bgStYncK4t3ObsGGvL/Gqb04/yUoAsUxuj5V6PPwq546CxM2LRcI4N3ehMVvUd6xFZq4g
	 2NLMMtnNCFKlIZxrMjTZRCPce51AS6JwyCkGevzFGv8Fmln+YU5VrrAGeEKD+77OrRgQE
	 nUCA3mPg+HJN3coc0U0NfZFGiamprXp+uyVFUju6JD7ZPVfKs+2CHvNovfjhlThaO6gEz
	 prdsuFZcCPxt2jEosjtJSyrPR4boGWcPVZwi4L7KdZrjlZ5R+4+6bgU4e/OLq9vKYrw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=jiocx.info header.i=@jiocx.info header.a=rsa-sha256 header.s=mtajiocx header.b=pSTKE+h7;
	dmarc=pass header.from=jiocx.info;
	spf=pass smtp.mailfrom=jiocx.info;
	arc=none smtp.remote-ip=116.50.98.98
Received: from cmpgn-mta98.jio.ril.com (cmpgn-mta98.jio.ril.com [116.50.98.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with UTF8SMTPS id DCABF1F000E9
	for <linux-firmware@kernel.org>; Wed,  2 Sep 2026 10:31:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=jiocx.info header.i=@jiocx.info header.a=rsa-sha256 header.s=mtajiocx header.b=pSTKE+h7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DCABF1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=jiocx.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=jiocx.info
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jiocx.info;
 i=@jiocx.info; q=dns/txt; s=mtajiocx; t=1788345092; h=mime-version :
 date : from : to : subject : list-unsubscribe : reply-to : message-id
 : content-type : from;
 bh=T2qcf5GrhrYWrKegTWZ4t+C6diZinyHBAlfpZ6B2tnc=;
 b=pSTKE+h7DNrOyWN9sGbqF8VsjTMzGhDA7Ep/JZ4HM1vkkGCZnVS1OVvaJpSSE1afH7ssu
 6APX2QGkonSnyJmrWclAfG8YV1vnl2RiC5drNXuzzHLHBIiofdBtIqJfuK5aVhxApZf1nmD
 QWYIxSynIsMrI6YTJazbCoPF7r351iY=
Received: from localhost (unknown [10.177.4.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by cmpgn-mta98.jio.ril.com (Postfix) with UTF8SMTPSA id 1F5696EA12C4
	for <linux-firmware@kernel.org>; Wed,  2 Sep 2026 16:01:32 +0530 (IST)
Mime-Version: 1.0
Date: Wed, 02 Sep 2026 16:01:32 +0530
From: "Harsh Gawade" <info@jiocx.info>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: A Smarter Way to Manage Dental Appointments with JioCX
List-Unsubscribe: <https://email.jiocx.com/unsubscribe.html?data=nPAIqBOjCIFyWDPknA0DYov_T-8MepvU-67_afHWDV-2_N1HZeSFlmHayuriKlvumduJ9JqD-3wn9wny5DRPu9ihfaQBIaEbXRGY1slUS7QENhOHjh9FL4e01A5gbbk4W2l6e7OIWc8VclJxjRAgwLCYanBnOhpNJ6BqPrPyMI2OeSfsaeT2ZPkhY-TSHhoEvnw7Ix-Go5cRdvMRdh-0z6YGAXhJe-UG64jtxkzV22A6_ML_pIbazm5vVagp&emailTo=linux-firmware%40kernel.org&list=master&reasonID=0>,
 <mailto:unsubscribe@jiocx.info?subject=unsubscribe>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Reply-To: hello@jiocx.com
Message-ID: <jiocxmarketing254/16556/570046/4d79e3d4-a6b9-11f1-b384-3a79b4b2c064/campaign/info@jiocx.info>
Content-Type: multipart/alternative;
 boundary=a4abd1a948408d1d9b0ae523ac7199cefb7017bb8998348459c6d72e9469

--a4abd1a948408d1d9b0ae523ac7199cefb7017bb8998348459c6d72e9469
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8


--a4abd1a948408d1d9b0ae523ac7199cefb7017bb8998348459c6d72e9469
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<div style=3D"display: none; font-size: 1px; max-height: 0px; max-width: 0p=
x; opacity: 0; overflow: hidden; color: white"><p>Your Next Appointment Sta=
rts with WhatsApp</p></div>




   =20
     =20
    <style>
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
            display: block;
        }
        a {
            text-decoration: none;
        }
    </style>`
    <table width=3D"100%" style=3D"width:100%; background-color: white;">
        <tbody>
            <tr>
                <td align=3D"center">

                   =20
                   =20
                    <table width=3D"650" style=3D"width:100%;max-width:650p=
x;background-color:#FFFFFF;font-family:Arial,Helvetica,sans-serif;font-size=
:14px;line-height:20px;color:#1A1A1A;">
                        <tbody>

                           =20
                            <tr>
                                <td align=3D"center" style=3D"padding:14px =
30px;background-color:#1B0633;">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td valign=3D"middle" style=
=3D"padding-right:6px;">
                                                    <img alt=3D"JioCX Pulse=
" src=3D"https://jioimages.cdn.jio.com/media_uploads/20260807162405.png" wi=
dth=3D"40" style=3D"display:block;width:40px;height:auto;">
                                                </td>
                                                <td valign=3D"middle" style=
=3D"font-family:Arial,Helvetica,sans-serif;font-size:20px;line-height:26px;=
font-weight:bold;color:#FFFFFF;">
                                                    JioCX Pulse <span style=
=3D"font-weight:normal;color:#8D8299; font-size: 18px; font-weight: 400;">
                                                        | Dental</span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>

                           =20
                            <tr>
                                <td style=3D"background-color:#F5F0FF;">
                                    <table width=3D"100%" style=3D"width:10=
0%;">
                                        <tbody>

                                           =20
                                            <tr>
                                                <td align=3D"center" style=
=3D"padding:30px 20px 0 20px;">
                                                    <img alt=3D"Dental clin=
ic patient chatting on WhatsApp" src=3D"https://jioimages.cdn.jio.com/media=
_uploads/20260810125255.png" width=3D"420" style=3D"display:block;width:420=
px;max-width:420px;height:auto;">
                                                </td>
                                            </tr>
                                           =20
                                            <tr>
                                                <td align=3D"center" style=
=3D"padding:28px 40px 0 40px;font-family:Arial,Helvetica,sans-serif;font-si=
ze:28px;line-height:36px;font-weight:bold;color:#1A1A1A;text-align:center;"=
>
                                                    Your Next Appointment S=
tarts with WhatsApp
                                                </td>
                                            </tr>
                                           =20
                                            <tr>
                                                <td style=3D"height:14px;li=
ne-height:14px;font-size:1px;">=C2=A0</td>
                                            </tr>
                                           =20
                                            <tr>
                                                <td align=3D"center" style=
=3D"padding:0 40px;font-family:Arial,Helvetica,sans-serif;font-size:12px;fo=
nt-weight:400; line-height:normal;color:#222222;text-align:center;">
                                                    JioCX Pulse helps denta=
l clinics manage appointments, answer patient
                                                    queries, share treatmen=
t information, and send reminders seamlessly
                                                    on WhatsApp. Keep every=
 patient conversation organized in one place.
                                                </td>
                                            </tr>

                                           =20
                                            <tr>
                                                <td style=3D"height:24px;li=
ne-height:24px;font-size:1px;">=C2=A0</td>
                                            </tr>

                                           =20
                                           =20
                                            <tr>
                                                <td align=3D"center" style=
=3D"padding:0 40px;">
                                                    <table style=3D"margin:=
0 auto;width:280px;border-collapse:separate;border-radius:24px;-webkit-bord=
er-radius:24px;background-color:#6C1CD3;">
                                                        <tbody>
                                                            <tr>
                                                                <td align=
=3D"center" style=3D"background-color:#6C1CD3;border-radius:24px;-webkit-bo=
rder-radius:24px;background-clip:padding-box;padding:12px 20px;font-family:=
Arial,Helvetica,sans-serif;font-size:16px;line-height:20px;font-weight:bold=
;color:#FFFFFF;text-align:center;width:280px;">
                                                                    <a href=
=3D"https://email.jiocx.com/web/v1/ctr/v2/AokdLscB34pDr-MYEQPsHK5wI8whWPEMU=
kWi0UfsZGFehcx4HvGPVn95P4Wuok0fOp8tx3y0ExyfL1U0nu4z8Igp4wWdGd15v2xBUpK9FPrR=
d-52sXMdAwuirYI592hv_ZyIAGUIO5-myfss4_AZ2JIXNXJ3fSdRzlyb55UXeLlQRUvRBZJqb9b=
k4YqCPWS5zvpSjqSNhkm0mBZwyusw1tKPrs7zRL6PeGSFOOtCKpwpmm4r-FvwAm-pdls89RyLlv=
fKVKLzeHDFh34Buey_1P9J87QAT7ZjSmi_BdFbVlNArhrzjMpFclr2SEUz6Fm--4iuaYlbVwZSa=
yNcPI-wu2qBDi6qqoRqW9GPFMYyq8zsSylLDOPJ7Im8FbQNSSUVo_eiRIuD_VdcHT-nzT-HOAeq=
fU1Geakdz1P8Hf-vl1XuFJTp3G_bM_GWU8hIrvD-FSTQ8cgXp280H0XokOFDrVHNf3gOx8ifoCL=
wSoFjRjFD3034Kl78g4bHIOHNHhXtHIiUiQCwZkuqsU43b9PH5EbBBAWs3qlv_AulXchZTkBtz9=
1jDBOlnYnj-VaEDyW13Css5_pub3DMtAefT715HnNbYNa0fZ1CNVh_fGOHe7cElLfDhmBByjIBJ=
yKXR2XH85Edpmdsfq1kINHZZnLwiuyJdVHNH4vvOisgmiNTr69EssIPweDcdYzUYustnrPwtdp1=
" style=3D"color:#FFFFFF;text-decoration:none;display:block;font-family:Ari=
al,Helvetica,sans-serif;font-size:16px;font-weight:bold;line-height:20px;" =
rel=3D"nofollow">
                                                                        Let=
=E2=80=99s talk on WhatsApp =C2=A0=E2=86=92
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                   =20
                                                </td>
                                            </tr>

                                           =20
                                            <tr>
                                                <td style=3D"height:12px;li=
ne-height:12px;font-size:1px;">=C2=A0</td>
                                            </tr>

                                           =20
                                            <tr>
                                                <td align=3D"center" style=
=3D"padding:0 40px;">
                                                    <table style=3D"margin:=
0 auto;width:280px;border-collapse:separate;border-radius:24px;-webkit-bord=
er-radius:24px;background-color:#F5F0FF;">
                                                        <tbody>
                                                            <tr>
                                                                <td align=
=3D"center" style=3D"background-color:#F5F0FF;border:1px solid #CCCCCC;bord=
er-radius:24px;-webkit-border-radius:24px;background-clip:padding-box;paddi=
ng:12px 20px;font-family:Arial,Helvetica,sans-serif;font-size:16px;line-hei=
ght:20px;font-weight:bold;color:#3B0B72;text-align:center;width:280px;">
                                                                    <a href=
=3D"https://email.jiocx.com/web/v1/ctr/v2/6umVDTMDq5QxlUrn0hspgCXb-wmPIthx3=
vyfXme6OYc2AUn1zwgmZc7IWPBuyucpJCWqLB-_SWqtAZZXgJzJOBsg13RZdZ493xY_eT4EVn7I=
Vx1JB3ulC3Kls_oATSY8DEAwwi6EeRMtCvSGSushTFa3aOhuto_zwyIxPXzSljKWSxogOwbNPKo=
2o4b9RZwjivEz79f83Yu0hQeKxUuCpT39VofWt3i9YJcC0iZdexrrfsX5cuL1QVFlwtZ530WeFO=
FVtxLUrgmkaekyqE-fQP6BlHkMLl8sPFtQdz6tCZwBlxdUZlBQfI39BbeyMYeuhbie4Ft208MS5=
6Nwo5PqDVXWXJCs-JM8_bdfu4wL3mZJkWjpfQdcfK0ryBd0yW2GS_T9Fm4SOBsKlWec04VGF03R=
jL9bLrpy59Ogk5804wASfy7ONa-bdNfvNlU1S4iwhhkwHkx9Mli5JtULW3X3mRBx0nS807iOeHZ=
1I4h6KuRVVIf59oNw-NzAPhc0Er2HA9gUerWfssoga6KaqqF9h34nwtsFuXSLdrtXnv9Qzj0OH_=
3M7Po978VINK-DbkItFBf5J1v68avU_4fr7kVTx7dq4zC0_JjMtQTQPXo-3uY=3D" style=3D"=
color:#3B0B72;text-decoration:none;display:block;font-family:Arial,Helvetic=
a,sans-serif;font-size:16px;font-weight:bold;line-height:20px;" rel=3D"nofo=
llow">
                                                                        Exp=
lore JioCX Pulse
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                   =20
                                                </td>
                                            </tr>

                                           =20
                                            <tr>
                                                <td style=3D"height:30px;li=
ne-height:30px;font-size:1px;">=C2=A0</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>

                           =20
                            <tr>
                                <td style=3D"background-color:#FFFFFF;">
                                    <table width=3D"100%" style=3D"width:10=
0%;">
                                        <tbody>
                                           =20
                                            <tr>
                                                <td style=3D"height:30px;li=
ne-height:30px;font-size:1px;">=C2=A0</td>
                                            </tr>

                                           =20
                                            <tr>
                                                <td align=3D"center" style=
=3D"padding:0 35px;font-family:Arial,Helvetica,sans-serif;font-size:24px;li=
ne-height:normal;font-weight:700;color:#1A1A1A;text-align:center;">
                                                    Get more from every con=
versation
                                                </td>
                                            </tr>

                                           =20
                                            <tr>
                                                <td style=3D"height:10px;li=
ne-height:10px;font-size:1px;">=C2=A0</td>
                                            </tr>
                                           =20
                                            <tr>
                                                <td align=3D"center" style=
=3D"padding:0 50px;font-family:Arial,Helvetica,sans-serif;font-size:12px; f=
ont-weight: 400; line-height:normal;color:#222222;text-align:center;">
                                                    Everything you need to =
engage patients, reduce missed appointments,
                                                    and strengthen everyday=
 communication all within WhatsApp.
                                                </td>
                                            </tr>
                                           =20
                                            <tr>
                                                <td style=3D"height:28px;li=
ne-height:28px;font-size:1px;">=C2=A0</td>
                                            </tr>

                                           =20
                                            <tr>
                                                <td style=3D"padding:0;">
                                                    <table width=3D"100%" s=
tyle=3D"width:100%;">
                                                        <tbody>
                                                           =20
                                                            <tr>
                                                               =20
                                                                <td width=
=3D"50%" valign=3D"top" style=3D"width:50%;padding:28px 20px 32px 20px;vert=
ical-align:top;background-color:#FFF8EE;">
                                                                    <table =
width=3D"100%" style=3D"width:100%;">
                                                                        <tb=
ody>
                                                                           =
=20
                                                                           =
 <tr>
                                                                           =
     <td align=3D"center" style=3D"padding-bottom:20px;">
                                                                           =
         <img alt=3D"Appointment booking on WhatsApp for dental clinic" src=
=3D"https://jioimages.cdn.jio.com/media_uploads/20260818191706.png" width=
=3D"170" style=3D"display:block;width:170px;max-width:170px;height:auto;bor=
der-radius:12px;">
                                                                           =
     </td>
                                                                           =
 </tr>
                                                                           =
=20
                                                                           =
 <tr>
                                                                           =
     <td align=3D"center" style=3D"font-family:Arial,Helvetica,sans-serif;f=
ont-size:20px;line-height:24px;font-weight:700;color:#000000;text-align:cen=
ter;padding-bottom:12px;">
                                                                           =
         Appointment Booking
                                                                           =
     </td>
                                                                           =
 </tr>
                                                                           =
=20
                                                                           =
 <tr>
                                                                           =
     <td align=3D"center" style=3D"font-family:Arial,Helvetica,sans-serif;f=
ont-size:12px; font-weight: 400; line-height:normal;color:#222222;text-alig=
n:center;">
                                                                           =
         Make it easy for patients to enquire
                                                                           =
         about treatments, choose a preferred
                                                                           =
         slot, and receive appointment
                                                                           =
         confirmations directly on WhatsApp
                                                                           =
         without calling the clinic.
                                                                           =
     </td>
                                                                           =
 </tr>
                                                                        </t=
body>
                                                                    </table=
>
                                                                </td>
                                                               =20
                                                                <td width=
=3D"50%" valign=3D"top" style=3D"width:50%;padding:28px 20px 32px 20px;vert=
ical-align:top;background-color:#E8F8F3;">
                                                                    <table =
width=3D"100%" style=3D"width:100%;">
                                                                        <tb=
ody>
                                                                           =
=20
                                                                           =
 <tr>
                                                                           =
     <td align=3D"center" style=3D"padding-bottom:20px;">
                                                                           =
         <img alt=3D"Automated appointment reminders on WhatsApp" src=3D"ht=
tps://jioimages.cdn.jio.com/media_uploads/20260818180201.png" width=3D"170"=
 style=3D"display:block;width:170px;max-width:170px;height:auto;border-radi=
us:12px;">
                                                                           =
     </td>
                                                                           =
 </tr>
                                                                           =
=20
                                                                           =
 <tr>
                                                                           =
     <td align=3D"center" style=3D"font-family:Arial,Helvetica,sans-serif;f=
ont-size:20px;line-height:24px;font-weight:700;color:#000000;text-align:cen=
ter;padding-bottom:12px;">
                                                                           =
         Automated Reminders
                                                                           =
     </td>
                                                                           =
 </tr>
                                                                           =
=20
                                                                           =
 <tr>
                                                                           =
     <td align=3D"center" style=3D"font-family:Arial,Helvetica,sans-serif;f=
ont-size:12px; font-weight: 400; line-height:normal;color:#222222;text-alig=
n:center;">
                                                                           =
         Reduce no-shows by sending timely
                                                                           =
         appointment reminders with options
                                                                           =
         to confirm, reschedule, or
                                                                           =
         cancel helping patients manage
                                                                           =
         visits without extra follow up
                                                                           =
         calls.
                                                                           =
     </td>
                                                                           =
 </tr>
                                                                        </t=
body>
                                                                    </table=
>
                                                                </td>
                                                            </tr>
                                                           =20
                                                            <tr>
                                                               =20
                                                                <td width=
=3D"50%" valign=3D"top" style=3D"width:50%;padding:28px 20px 32px 20px;vert=
ical-align:top;background-color:#E4F3FA;">
                                                                    <table =
width=3D"100%" style=3D"width:100%;">
                                                                        <tb=
ody>
                                                                           =
=20
                                                                           =
 <tr>
                                                                           =
     <td align=3D"center" style=3D"padding-bottom:20px;">
                                                                           =
         <img alt=3D"Instant FAQ support for dental patients on WhatsApp" s=
rc=3D"https://jioimages.cdn.jio.com/media_uploads/20260818180221.png" width=
=3D"170" style=3D"display:block;width:170px;max-width:170px;height:auto;bor=
der-radius:12px;">
                                                                           =
     </td>
                                                                           =
 </tr>
                                                                           =
=20
                                                                           =
 <tr>
                                                                           =
     <td align=3D"center" style=3D"font-family:Arial,Helvetica,sans-serif;f=
ont-size:20px;line-height:normal;font-weight:700;color:#000000;text-align:c=
enter;padding-bottom:12px;">
                                                                           =
         Instant FAQ Support
                                                                           =
     </td>
                                                                           =
 </tr>
                                                                           =
=20
                                                                           =
 <tr>
                                                                           =
     <td align=3D"center" style=3D"font-family:Arial,Helvetica,sans-serif;f=
ont-size:12px; font-weight: 400; line-height:normal;color:#222222;text-alig=
n:center;">
                                                                           =
         Answer common patient questions
                                                                           =
         instantly about clinic timings,
                                                                           =
         treatments, pricing, consultation
                                                                           =
         availability, post-care guidance,
                                                                           =
         and appointment-related information
                                                                           =
         24/7.
                                                                           =
     </td>
                                                                           =
 </tr>
                                                                        </t=
body>
                                                                    </table=
>
                                                                </td>

                                                               =20
                                                                <td width=
=3D"50%" valign=3D"top" style=3D"width:50%;padding:28px 20px 32px 20px;vert=
ical-align:top;background-color:#FDF0F8;">
                                                                    <table =
width=3D"100%" style=3D"width:100%;">
                                                                        <tb=
ody>
                                                                           =
=20
                                                                           =
 <tr>
                                                                           =
     <td align=3D"center" style=3D"padding-bottom:20px;">
                                                                           =
         <img alt=3D"Patient follow-ups on WhatsApp for dental clinic" src=
=3D"https://jioimages.cdn.jio.com/media_uploads/20260818180434.png" width=
=3D"170" style=3D"display:block;width:170px;max-width:170px;height:auto;bor=
der-radius:12px;">
                                                                           =
     </td>
                                                                           =
 </tr>
                                                                           =
=20
                                                                           =
 <tr>
                                                                           =
     <td align=3D"center" style=3D"font-family:Arial,Helvetica,sans-serif;f=
ont-size:20px;line-height:normal;font-weight:700;color:#000000;text-align:c=
enter;padding-bottom:12px;">
                                                                           =
         Patient Follow-Ups
                                                                           =
     </td>
                                                                           =
 </tr>
                                                                           =
=20
                                                                           =
 <tr>
                                                                           =
     <td align=3D"center" style=3D"font-family:Arial,Helvetica,sans-serif;f=
ont-size:12px; font-weight: 400; line-height:normal;color:#222222;text-alig=
n:center;">
                                                                           =
         Stay connected after every visit
                                                                           =
         with treatment follow-ups, recall
                                                                           =
         reminders, payment reminders, oral
                                                                           =
         care tips, and personalised
                                                                           =
         messages that bring patients back.
                                                                           =
     </td>
                                                                           =
 </tr>
                                                                        </t=
body>
                                                                    </table=
>
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

                           =20
                            <tr>
                                <td style=3D"padding:32px 30px;background-c=
olor:#EFEAFB;">
                                    <table width=3D"100%" style=3D"width:10=
0%;">
                                        <tbody>
                                           =20
                                            <tr>
                                                <td align=3D"center" style=
=3D"font-family:Arial,Helvetica,sans-serif;font-size:24px;line-height:norma=
l;font-weight:700;color:#1A1A1A;text-align:center;">
                                                    Ready to transform your=
 patient engagement?
                                                </td>
                                            </tr>

                                           =20
                                            <tr>
                                                <td style=3D"height:12px;li=
ne-height:12px;font-size:1px;">=C2=A0</td>
                                            </tr>

                                           =20
                                            <tr>
                                                <td align=3D"center" style=
=3D"font-family:Arial,Helvetica,sans-serif;font-size:12px; line-height:norm=
al;font-weight:400;color:#222222;text-align:center;">
                                                    Connect with a JioCX sp=
ecialist to discover how WhatsApp can engage
                                                    patients, automate conv=
ersations, and drive more appointments for
                                                    your clinic.
                                                </td>
                                            </tr>

                                           =20
                                            <tr>
                                                <td style=3D"height:26px;li=
ne-height:26px;font-size:1px;">=C2=A0</td>
                                            </tr>

                                           =20
                                            <tr>
                                                <td align=3D"center">
                                                   =20
                                                   =20
                                                    <table style=3D"margin:=
0 auto;width:220px;border-collapse:separate;border-radius:24px;-webkit-bord=
er-radius:24px;background-color:#6C1CD3;">
                                                        <tbody>
                                                            <tr>
                                                                <td align=
=3D"center" style=3D"background-color:#6C1CD3;border-radius:24px;-webkit-bo=
rder-radius:24px;background-clip:padding-box;padding:12px 28px;font-family:=
Arial,Helvetica,sans-serif;font-size:16px;line-height:20px;font-weight:bold=
;color:#FFFFFF;text-align:center;width:220px;">
                                                                    <a href=
=3D"https://email.jiocx.com/web/v1/ctr/v2/zLSKJPbx1vFhjBrAwqUm0XOB8VUAbW3dY=
QeuR69K8GUe22QMj8rg9OUeHnPMC7dPLLMu-0e04b73gIBNBbJHjAjemhWIUBGiCNRBssbF3GT9=
NhHjdl78kTWVcMjl06TpNn5sRSfZoJ8r3c6KJWv-Zj6haNGgg77rLfNByK1Yu5BL3sDAE4HDWQn=
4pf6wp86wHsHQJB9h9Kl2PVYvLwvbpdSB6eQmQbQkL9Cjqn0dyRvG8KYj4MRXflHcNsiLaPGhbu=
5nl2BTLRbgmz6Xd1ch7I9LAEoQelxP-rn5lrkCIJok2m_E14TFIvdhvBGuLgvtiYgRutofKbQtE=
QOAbjVzXv2GaZqqeQAq5Pqp0WkTPn4dQfoEO-HzxB_P4lS4__egC6ZH3xrVkz_jKiY8w7s4J75v=
3VDdn76qWL9OE1DHxg5ve9YCBvsF_9yxF_F21c3By0ziF2TzUp5duGQpAcnfw6hFqjDnnBckTTg=
x8NIr55eGu-axQmOEKHDyxUeOtCsSCPWnFoG0urIq7AOQqbUFFBAnyB1uf3DjmQEeBNDQ8ewknz=
f6Sy5a1tZHdmDfCtgs1Iyw5wWSKcIFjQ=3D=3D" style=3D"color:#FFFFFF;text-decorat=
ion:none;display:block;font-family:Arial,Helvetica,sans-serif;font-size:16p=
x;font-weight:bold;line-height:20px;" rel=3D"nofollow">
                                                                        Req=
uest a Demo
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                   =20
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>

                           =20
                            <tr>
                                <td style=3D"padding:28px 30px;background-c=
olor:#1A1A1A;">
                                    <table width=3D"100%" style=3D"width:10=
0%;">
                                        <tbody>
                                           =20
                                            <tr>
                                                <td align=3D"center" style=
=3D"padding-bottom:10px;">
                                                    <img src=3D"https://jio=
campaigns.cdn.jio.com/pdjcmp/image_uploads/6f4261c8d75246569f793dde9ab16018=
ca0e7846d3899c73ea9106ebb41a3a36_1783681790621_ps_jiocx.png" width=3D"36" h=
eight=3D"36" alt=3D"JioCX Logo" style=3D"display:block;width:36px;height:36=
px;">
                                                </td>
                                            </tr>
                                           =20
                                            <tr>
                                                <td align=3D"center" style=
=3D"font-family:Arial,Helvetica,sans-serif;font-size:12px;line-height:20px;=
color:#FFFFFF;text-align:center;">
                                                    Website:
                                                    <a href=3D"https://emai=
l.jiocx.com/web/v1/ctr/v2/v-GkmQd9yS7_a-NC3AY-ACQAuwgrAFkNjEttHuLhg6Yr1rC8r=
vhK5WmkFjGlHBArym8Ia-IjLKx1UcQ_fG04UjlPSMASqXnKKTwdb7JqxZ4OoET9xWsJnfo8W_js=
bcd-HrJU371BeWS3bOFX11d4mtse3qRJyQacg1MJB8pNfXf2CZx5qVKxSiWhxKt7AtY54eh1lob=
s9drajHDsGkZCtWynZBOLQNKt6VRZxj6xCcU4x91mploEBEMM85JVc37o6wn8Ep7MO-5Vy9YZid=
k0iYwIJZge7qjmx_sHWDnT9f8Y8jbJ1d6GphrlLYL-95acfVi25vQPji5KxByuJUPZnbKiTWeih=
eMilgfmK4w3x6E7xiHnkg1drq88Nak7vmaAD5kp1E4MGnIzcZZPr1xLrkolQ_NbrQVCCjIMfitM=
WcIlY7iOfv-svGaWCObHSXbxooTc9Ge2VEsebV7geJeX0hDIKgKBqthGbzSsQe05ZQ3qGrrKH2w=
zPp04PSWb04Mpx00mOHvccM2_vVE3NWveLHoehJBpHlv322bZ0OhXf6AUQCfU-jiK1Pj1H0lOOW=
OTOm0FQLtx70y9yqJ5M9frGXtWS1-t-jyyKkzPxd01_UwM__hj1iuynED87K4tet4XE1fg1xL-O=
7df1YCS3kU=3D" style=3D"color:#FFFFFF;font-size: 12px; font-weight:700;" re=
l=3D"nofollow">www.jiocx.com</a>
                                                    =C2=A0|=C2=A0 Contact U=
s:
                                                    <a style=3D"color:#FFFF=
FF;text-decoration:none;font-size: 12px; font-weight:700;">+91-8169930507
 </a>
                                                    =C2=A0|=C2=A0 Email:
                                                    <a href=3D"mailto:hello=
@jiocx.com" style=3D"color:#FFFFFF;text-decoration:none; font-size: 12px; f=
ont-weight: 400;" rel=3D"nofollow">hello@jiocx.com</a>
                                                </td>
                                            </tr>
                                           =20
                                            <tr>
                                                <td style=3D"height:8px;lin=
e-height:8px;font-size:1px;">=C2=A0</td>
                                            </tr>

                                           =20
                                            <tr>
                                                <td align=3D"center" style=
=3D"font-family:Arial,Helvetica,sans-serif;font-size:12px;font-weight: 400;=
 line-height:normal;color:#898989;text-align:center;">
                                                    Copyright =C2=A9 2026 J=
io Things Ltd. All rights reserved.
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                   =20
                </td>
            </tr>
        </tbody>
    </table>



<table style=3D"width: 100%"> <tr> <td align=3D"center"> <p style=3D"font-s=
ize:10px;">No longer want to receive these email? <a href=3D"https://email.=
jiocx.com/unsubscribe.html?data=3DnPAIqBOjCIFyWDPknA0DYov_T-8MepvU-67_afHWD=
V-2_N1HZeSFlmHayuriKlvumduJ9JqD-3wn9wny5DRPu9ihfaQBIaEbXRGY1slUS7QENhOHjh9F=
L4e01A5gbbk4W2l6e7OIWc8VclJxjRAgwLCYanBnOhpNJ6BqPrPyMI2OeSfsaeT2ZPkhY-TSHho=
Evnw7Ix-Go5cRdvMRdh-0z6YGAXhJe-UG64jtxkzV22A6_ML_pIbazm5vVagp&amp;emailTo=
=3Dlinux-firmware%40kernel.org&amp;list=3Dmaster&amp;reasonID=3D0">Unsubscr=
ibe</a> </p> </td> </tr> </table><div style=3D'display: none;'><img src=3D'=
https://email.jiocx.com/web/v1/openTracking?ampRendered=3Dfalse&campaignId=
=3D16556&messageId=3D%3Cjiocxmarketing254%2F16556%2F570046%2F4d79e3d4-a6b9-=
11f1-b384-3a79b4b2c064%2Fcampaign%2Finfo%40jiocx.info%3E&sentAt=3D2026-09-0=
2T16%3A00%3A16%2B05%3A30&toEmail=3Dlinux-firmware%40kernel.org' alt=3D''/><=
/div>
--a4abd1a948408d1d9b0ae523ac7199cefb7017bb8998348459c6d72e9469--
