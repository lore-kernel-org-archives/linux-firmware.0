Return-Path: <SRS0=ozON=ZO=m4.sendingservice.net=bounce-503582@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25F2C7EE30
	for <linux-firmware@archiver.kernel.org>; Tue,  1 Jul 2025 08:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AA617C4CEEE; Tue,  1 Jul 2025 08:56:47 +0000 (UTC)
Received: from mta151.sendingservice.net (mta151.sendingservice.net [176.9.183.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB4C9C4CEEB
	for <linux-firmware@kernel.org>; Tue,  1 Jul 2025 08:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB4C9C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=farsight.co.uk
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=m4.sendingservice.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=s01; d=sendingservice.net;
 h=Date:From:Reply-To:To:Message-ID:Subject:Mime-Version:Content-Type:
 Content-Transfer-Encoding:Feedback-ID:List-Unsubscribe:List-Unsubscribe-Post:
 From:To:Subject:CC:Date; i=bounce-503582@sendingservice.net;
 bh=pkHLq8j81QePAwSDTEl/MkWCCXCh9yZ81WS294ZGxN0=;
 b=hPpt39n8CoEhVX9ilqJy5yC+g1ybi0eL+8QmLX8+mqoqtzeBTqLwlbLhOVRQt0EAtH+i/sXjPpVs
   yxYEpy+QMhugjAps8dV6ceaKioCcn6MJFIORF1iXEqSH4QjppEoEcX0KzvsROqdm8CW6j3IIi6L1
   Ea6rVf1GFjnxmQm/OKootU683Pz8jzbGKRsDik8JiFBk7CidXuG6VZyQuCHUghlFxmKwOO4wNctH
   4wbkwrOW2OKt5pMlPxrvzf2P/9Rj85qi8gWR/MZo2o7lP+VGVRJo60p31UEpWPv8bo4nzVtdY7Uq
   rs014VpULkMY/guzTQS/Rl3yqNX/8ghCKit12w==
Received: by mta151.sendingservice.net id hcehck39s34b for <linux-firmware@kernel.org>; Tue, 1 Jul 2025 08:41:34 +0000 (envelope-from <bounce-503582@m4.sendingservice.net>)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=farsight.co.uk; q=dns/txt; s=mailpoet2; t=1751359294; bh=pkHLq8j81QePAwSDTEl/MkWCCXCh9yZ81WS294ZGxN0=; h=date:from:reply-to:to:message-id:subject:mime-version:content-type:content-transfer-encoding:x-rid:x-message-id:x-userid:feedback-id:list-unsubscribe:list-unsubscribe-post; b=dpJH5iPWnsuhtLnUg+oRdXW2wwYjVXh9B7QHdsTDcFa1iAAsiE3YouSeOWMRWhz5IbuDRN9AvF+CcFsC6/vbUWy7gOKCojVSGCYupLnOjZVekziGUqVGT005EaD7vS973v1I+zXUGbh2HIclydP403MMr/TbxB+r7xHVj9GrOHTM8hjtH6GZlfaIE3jcxYUP/cWr1nEQn7GIaajdkYXgEAjGCUo+kqvqIzz5Krk9Rr8RbuS9kghFEOM3698nXcEvRh9Zw8RR0lk1YqgKCtp8R6XXvOAEXSHFxfBpZR2RcwD1X2q9AttXOrpvxLh2MtP65lnYY9eJsZnOmElZ1XDccA==
Date: Tue, 01 Jul 2025 08:41:34 +0000
From: Farsight Security Services <marketing@farsight.co.uk>
Reply-To: Farsight Team <marketing@farsight.co.uk>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Message-ID: <29e0ed13-03d3-4d88-a0bd-d312504e83fc@sendingservice.net>
Subject: July Newsletter: Fire Detection, Site Stats & Smarter CCTV
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="--==_mimepart_68639f3e7b6b_1e50742ecc38822c4"
Content-Transfer-Encoding: 7bit
X-RID: Xp4Pv9UhpOsbzkLuHq6hArV5C3uMSf1vbitzp3J951FOMBNQkqu/iELeQ7iki67LMvKWijEnQNhwrZKLkGB586+HO+YZ1HfygfzJzSeuhUN+jNpWirTBWyHKMisXMjkwO74oFRKX1DUqW0kH4GTjLq0d8bgCyKhPoM66nBU2VAQ=
X-Message-ID: 29e0ed13-03d3-4d88-a0bd-d312504e83fc
X-Campaign-ID: d3bebae218fddd4c-c8e9352a265f72e3
X-UserID: 503582
Feedback-ID: d3bebae218fddd4c-c8e9352a265f72e3:503582:newsletter:mailpoet
List-Unsubscribe: <https://www.farsight.co.uk/?mailpoet_page=subscriptions&mailpoet_router&endpoint=subscription&action=unsubscribe&data=eyJxdWV1ZUlkIjo2MCwidG9rZW4iOiIxOGFyZnB2ejcxMzR3ZzBra3cwbzh3a3djNG8wNHdnOCIsImVtYWlsIjoibGludXgtZmlybXdhcmVAa2VybmVsLm9yZyJ9>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-Virtual-MTA: mta151


----==_mimepart_68639f3e7b6b_1e50742ecc38822c4
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Catch fire risks early =E2=80=93 see thermal in action.=0D
=0D
https://www.farsight.co.uk/=0D
=0D
[View this in your browser.](https://www.farsight.co.uk?mailpoet_router&e=
ndpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t=
3MG84d2t3YzRvMDR3ZzgiLCI2MCIsImJmYWYwNzJmNjU0NyIsZmFsc2Vd)=0D
=0D
Committed to vigilance=0D
=0D
Protecting businesses and homes across the UK since 1996=0D
=0D
July 2025=0D
=0D
Welcome to the July edition of Farsight's Monthly Newsletter.=0D
=0D
As the UK swelters in a summer heatwave, the risk of outdoor fires is ris=
ing fast. A stray spark in dry grass or smouldering waste in a skip yard =
can quickly become a major incident.=0D
=0D
However, modern CCTV systems can do more than just record =E2=80=94 they =
can detect danger before it becomes visible.=0D
=0D
One feature growing in popularity is the high-temperature alarm.=0D
These intelligent alerts can:=0D
=0D
-=0D
Detect rising temperatures outdoors=0D
-=0D
Trigger alarms before flames appear=0D
-=0D
Help monitoring teams act fast to prevent escalation=0D
=0D
They=E2=80=99re ideal for high-risk sites like recycling centres, but als=
o useful for farms, storage yards, forecourts, and remote areas.=0D
=0D
=F0=9F=91=89 Already using analytics like line crossing or intrusion dete=
ction? High-temperature alerts could be your next step.=0D
=0D
[Get in touch with Farsight](https://www.farsight.co.uk?mailpoet_router&e=
ndpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t=
3MG84d2t3YzRvMDR3ZzgiLCI2MCIsImFkZTY2NDQ2MmZiZSIsZmFsc2Vd) to learn which=
 analytics we support and how to offer this added protection to your site=
 or your clients.=0D
=0D
In hot weather, early warnings can make all the difference.=0D
=0D
Real-Time Fire Risk Detection in Action=0D
=0D
The images shown here are from a live thermal camera feed at a monitored =
site. These Axis cameras use temperature analytics to detect rising heat =
levels across materials like waste piles and bales.=0D
Once a certain temperature threshold is met, an automatic alarm is sent t=
o Farsight=E2=80=99s monitoring station. Our operators then verify the vi=
suals and take immediate action.=0D
=0D
Camera system installed and maintained by [PC1 Ltd](https://www.farsight.=
co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4Iiwi=
MThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsIjg3ZGYzZGU3NTAyYSIsZ=
mFsc2Vd), an official Axis Communications partner.=0D
=0D
STATISTICS=0D
=0D
A Look Back: June's Security Stats=0D
=0D
We=E2=80=99ve been working diligently to keep your sites secure. Over the=
 past month, our vigilant team at Farsight Security Services has responde=
d to 1176  incidents across our clients' sites. As a result of our dedica=
ted approach, we made 42 calls to the police, ensuring swift action where=
 it was needed most.=0D
=0D
Your safety is our top priority, and these numbers reflect our ongoing co=
mmitment to protecting your premises.=0D
=0D
Static IP vs Dynamic IP for CCTV Monitoring=0D
=0D
At Farsight, one of the most important requirements for reliable remote m=
onitoring is a stable internet connection=E2=80=94specifically, a static =
IP address. Without a static IP, your CCTV system may lose connection to =
our Alarm Receiving Centre (ARC), resulting in avoidable faults, delays, =
or missed events. What Is a Static IP Address? A static IP address is a f=
ixed, unchanging identifier =E2=80=A6=0D
=0D
[Read more](https://www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&a=
ction=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3=
ZzgiLCI2MCIsImVjOTcyYTgwMmE3MSIsZmFsc2Vd)=0D
=0D
[Static IP vs Roaming IP CCTV Monitoring Solutions](https://www.farsight.=
co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4Iiwi=
MThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsImVjOTcyYTgwMmE3MSIsZ=
mFsc2Vd)=0D
=0D
Do All Security Cameras Require a Subscription?=0D
=0D
[Collection of security cameras, and nvrs, dvrs](https://www.farsight.co.=
uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMTh=
hcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsImVhYzAyNTFiNmQ0OCIsZmFs=
c2Vd)=0D
=0D
The short answer? No, not all security cameras require a subscription. Ho=
wever, depending on the level of protection you require, there is a signi=
ficant difference between an off-the-shelf system and one specifically de=
signed for professional monitoring, such as the ones we support at Farsig=
ht Security Services. Understanding Subscription-Based Cameras Many consu=
mer-brand cameras, such as Ring, Nest, or Arlo, rely on =E2=80=A6=0D
=0D
[Read more](https://www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&a=
ction=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3=
ZzgiLCI2MCIsImVhYzAyNTFiNmQ0OCIsZmFsc2Vd)=0D
=0D
Best CCTV Setup for Construction Site Security=0D
=0D
Construction sites are dynamic, ever-changing environments that pose uniq=
ue security challenges. With valuable equipment, materials, and vehicles =
on-site, they=E2=80=99re prime targets for theft, vandalism, and unauthor=
ised access. That's why effective CCTV coverage is crucial for protecting=
 assets and ensuring the safety of your site. In this article, we=E2=80=99=
ll explore the best camera placement strategies for construction sites, t=
he most suitable =E2=80=A6=0D
=0D
[Read more](https://www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&a=
ction=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3=
ZzgiLCI2MCIsIjI1NjhkODA4ZGRjNSIsZmFsc2Vd)=0D
=0D
[Best CCTV Setup for Construction Site Security](https://www.farsight.co.=
uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMTh=
hcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsIjI1NjhkODA4ZGRjNSIsZmFs=
c2Vd)=0D
=0D
Join the Farsight Community=0D
=0D
Follow us for the latest updates, insights, and behind-the-scenes content=
.=0D
Stay connected with the people, tech, and stories behind the monitoring.=0D=

[facebook](https://www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&ac=
tion=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3Z=
zgiLCI2MCIsImY5ZjJhYTBiYzliOSIsZmFsc2Vd) [linkedin](https://www.farsight.=
co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4Iiwi=
MThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsIjFiNGNiMzE5YTAzMiIsZ=
mFsc2Vd) [youtube](https://www.farsight.co.uk?mailpoet_router&endpoint=3D=
track&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Y=
zRvMDR3ZzgiLCI2MCIsImRjM2JlOTJhMDkxMiIsZmFsc2Vd) [twitter](https://www.fa=
rsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5N=
DA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsImNjMzliNGU1NT=
U2YyIsZmFsc2Vd)=0D
=0D
[Free CCTV Quote](https://www.farsight.co.uk?mailpoet_router&endpoint=3Dt=
rack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Yz=
RvMDR3ZzgiLCI2MCIsIjM5YTY5MWMwMDEzYSIsZmFsc2Vd)=0D
=0D
[Free Alarm Quote](https://www.farsight.co.uk?mailpoet_router&endpoint=3D=
track&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Y=
zRvMDR3ZzgiLCI2MCIsIjEwNjhjMjljZTAzNCIsZmFsc2Vd)=0D
=0D
[Unsubscribe](https://www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack=
&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMD=
R3ZzgiLCI2MCIsImFiNmZkMzIyNmUwZCIsZmFsc2Vd) | [Manage your subscription](=
https://www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclic=
k&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIs=
Ijk4MzgxYWRhMDAyNCIsZmFsc2Vd)=0D
The Observatory=0D
Vicarage Farm Road=0D
Peterborough=0D
PE1 5TU=0D
Tel: 01733 35 24 35=

----==_mimepart_68639f3e7b6b_1e50742ecc38822c4
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

    <title>July Newsletter: Fire Detection, Site Stats &amp; Smarter CCTV=
</title>
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
family=3DLato:400,400i,700,700i" rel=3D"stylesheet" /><!--<![endif]-->
</head>
<body leftmargin=3D"0" topmargin=3D"0" marginwidth=3D"0" marginheight=3D"=
0" style=3D"margin:0;padding:0;background-color:#10aeb4">
    <table class=3D"mailpoet_template" border=3D"0" width=3D"100%" cellpa=
dding=3D"0" cellspacing=3D"0" style=3D"border-collapse:collapse;border-sp=
acing:0;mso-table-lspace:0;mso-table-rspace:0">
        <tbody>
        <tr>
            <td class=3D"mailpoet_preheader" style=3D"border-collapse:col=
lapse;display:none;visibility:hidden;mso-hide:all;font-size:1px;color:#33=
3333;line-height:1px;max-height:0;max-width:0;opacity:0;overflow:hidden;-=
webkit-text-size-adjust:none" height=3D"1">
                Catch fire risks early =E2=80=93 see thermal in action.
            </td>
        </tr>
        <tr>
            <td align=3D"center" class=3D"mailpoet-wrapper" valign=3D"top=
" style=3D"border-collapse:collapse;background-color:#10aeb4"><!--[if mso=
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
      <tr>
        <td class=3D"mailpoet_image " align=3D"center" valign=3D"top" sty=
le=3D"border-collapse:collapse">
          <a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3D=
track&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Y=
zRvMDR3ZzgiLCI2MCIsImRlYjE4OGViMzRkYyIsZmFsc2Vd" style=3D"color:#10aeb4;t=
ext-decoration:underline"><img src=3D"https://www.farsight.co.uk/wp-conte=
nt/uploads/2023/07/logo-no-space.png" width=3D"234" alt=3D"" style=3D"hei=
ght:auto;max-width:100%;-ms-interpolation-mode:bicubic;border:0;display:b=
lock;outline:none;text-align:center" /></a>
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
        <td class=3D"mailpoet_header_footer_padded mailpoet_header" style=
=3D"border-collapse:collapse;padding:10px 20px;line-height:19.2px;text-al=
ign:right;color:#222222;font-family:Arial, 'Helvetica Neue', Helvetica, s=
ans-serif;font-size:12px">
          <a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3D=
track&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Y=
zRvMDR3ZzgiLCI2MCIsImJmYWYwNzJmNjU0NyIsZmFsc2Vd" style=3D"color:#6cb7d4;t=
ext-decoration:underline">View this in your browser.</a>
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_spacer" height=3D"20" valign=3D"top" style=3D=
"border-collapse:collapse"></td>
      </tr>
      <tr>
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <table style=3D"border-collapse:collapse;border-spacing:0;mso-t=
able-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:cente=
r">
            <span style=3D"color: #7e8c8d"><strong>Committed </strong>to =
vigilance</span>
          </td>
        </tr></table>
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
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <table style=3D"border-collapse:collapse;border-spacing:0;mso-t=
able-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:right=
">
            <span style=3D"color: #34495e"><strong>Protecting businesses =
and homes across the UK since 1996</strong></span>
          </td>
        </tr></table>
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_image " align=3D"center" valign=3D"top" sty=
le=3D"border-collapse:collapse">
          <img src=3D"https://www.farsight.co.uk/wp-content/uploads/2025/=
06/july.png" width=3D"660" alt=3D"" style=3D"height:auto;max-width:100%;-=
ms-interpolation-mode:bicubic;border:0;display:block;outline:none;text-al=
ign:center;width:100%" />
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <table style=3D"border-collapse:collapse;border-spacing:0;mso-t=
able-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:11px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;letter-spacing:4=
px;text-align:left">
            <span style=3D"color: #7e8c8d"><strong>July 2025</strong></sp=
an>
          </td>
        </tr></table>
<h2 style=3D"margin:0 0 7.2px;mso-ansi-font-size:24px;color:#0074a2;font-=
family:lato,'helvetica neue',helvetica,arial,sans-serif;font-size:24px;li=
ne-height:38.4px;mso-line-height-alt:38px;margin-bottom:0;text-align:cent=
er;padding:0;font-style:normal;font-weight:normal"><span style=3D"color: =
#10aeb4"><strong>Welcome to the July edition of </strong></span><span sty=
le=3D"color: #10aeb4"><strong>Farsight's Monthly Newsletter.</strong></sp=
an></h2>
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <table style=3D"border-collapse:collapse;border-spacing:0;mso-t=
able-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            As the UK swelters in a summer heatwave, the risk of outdoor =
fires is rising fast. A stray spark in dry grass or smouldering waste in =
a skip yard can quickly become a major incident.<br /><br />
          </td>
        </tr></table>

<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            However, modern CCTV systems can do more than just record &md=
ash; they can detect danger before it becomes visible.<br /><br />
          </td>
        </tr></table>

<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            One feature growing in popularity is the <span style=3D"color=
: #e67e23"><strong>high-temperature alarm</strong>. </span>
          </td>
        </tr></table>
<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            <strong>These intelligent alerts can:</strong><br />
          </td>
        </tr></table>
<ul class=3D"mailpoet_paragraph" style=3D"padding-top:0;padding-bottom:0;=
margin-top:10px;text-align:left;margin-bottom:10px;">
<li class=3D"mailpoet_paragraph" style=3D"mso-ansi-font-size:16px;color:#=
000000;font-family:lato,'helvetica neue',helvetica,arial,sans-serif;font-=
size:15px;line-height:24px;mso-line-height-alt:24px;text-align:left;margi=
n-bottom:10px">
<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            Detect rising temperatures outdoors
          </td>
        </tr></table>
</li>
<li class=3D"mailpoet_paragraph" style=3D"mso-ansi-font-size:16px;color:#=
000000;font-family:lato,'helvetica neue',helvetica,arial,sans-serif;font-=
size:15px;line-height:24px;mso-line-height-alt:24px;text-align:left;margi=
n-bottom:10px">
<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            Trigger alarms before flames appear
          </td>
        </tr></table>
</li>
<li class=3D"mailpoet_paragraph" style=3D"mso-ansi-font-size:16px;color:#=
000000;font-family:lato,'helvetica neue',helvetica,arial,sans-serif;font-=
size:15px;line-height:24px;mso-line-height-alt:24px;text-align:left;margi=
n-bottom:10px">
<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            Help monitoring teams act fast to prevent escalation
          </td>
        </tr></table>
</li>
</ul>
<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            They&rsquo;re ideal for high-risk sites like recycling centre=
s, but also useful for farms, storage yards, forecourts, and remote areas=
.<br /><br />
          </td>
        </tr></table>

<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            =F0=9F=91=89 Already using analytics like line crossing or in=
trusion detection? High-temperature alerts could be your next step.<br />=
<br />
          </td>
        </tr></table>

<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            <a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoin=
t=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d=
2t3YzRvMDR3ZzgiLCI2MCIsImFkZTY2NDQ2MmZiZSIsZmFsc2Vd" target=3D"_blank" st=
yle=3D"color:#10aeb4;text-decoration:underline"><strong>Get in touch with=
 Farsight</strong></a> to learn which analytics we support and how to off=
er this added protection to your site or your clients.<br /><br />
          </td>
        </tr></table>

<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            <span style=3D"color: #e67e23"><strong>In hot weather, early =
warnings can make all the difference.</strong></span>
          </td>
        </tr></table>
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_divider" valign=3D"top" bgColor=3D"#ffffff"=
 style=3D"border-collapse:collapse;background-color:#ffffff;padding:25.5p=
x 20px 25.5px 20px">
          <table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacin=
g=3D"0" style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspa=
ce:0;mso-table-rspace:0">
            <tr>
              <td class=3D"mailpoet_divider-cell" style=3D"border-collaps=
e:collapse;border-top-width:3px;border-top-style:groove;border-top-color:=
#10aeb4">
             </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <h2 style=3D"margin:0 0 7.2px;mso-ansi-font-size:24px;color:#00=
74a2;font-family:lato,'helvetica neue',helvetica,arial,sans-serif;font-si=
ze:24px;line-height:38.4px;mso-line-height-alt:38px;margin-bottom:0;text-=
align:center;padding:0;font-style:normal;font-weight:normal">Real-Time Fi=
re Risk Detection in Action</h2>
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
        <td class=3D"mailpoet_image mailpoet_padded_vertical mailpoet_pad=
ded_side" align=3D"center" valign=3D"top" style=3D"border-collapse:collap=
se;padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:2=
0px">
          <img src=3D"https://www.farsight.co.uk/wp-content/uploads/2025/=
06/Thermal-Cameras.png" width=3D"290" alt=3D"" style=3D"height:auto;max-w=
idth:100%;-ms-interpolation-mode:bicubic;border:0;display:block;outline:n=
one;text-align:center" />
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
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <table style=3D"border-collapse:collapse;border-spacing:0;mso-t=
able-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            The images shown here are from a live thermal camera feed at =
a monitored site. These Axis cameras use temperature analytics to detect =
rising heat levels across materials like waste piles and bales.
          </td>
        </tr></table>
<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            Once a certain temperature threshold is met, an automatic ala=
rm is sent to Farsight&rsquo;s monitoring station. Our operators then ver=
ify the visuals and take immediate action.<br /><br />
          </td>
        </tr></table>

<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            Camera system installed and maintained by <a href=3D"https://=
www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3D=
WyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsIjg3ZGYzZ=
GU3NTAyYSIsZmFsc2Vd" class=3D"" target=3D"_blank" style=3D"color:#10aeb4;=
text-decoration:underline">PC1 Ltd</a>, an official Axis Communications p=
artner.
          </td>
        </tr></table>
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
        <td class=3D"mailpoet_divider" valign=3D"top" bgColor=3D"#ffffff"=
 style=3D"border-collapse:collapse;background-color:#ffffff;padding:25.5p=
x 20px 25.5px 20px">
          <table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacin=
g=3D"0" style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspa=
ce:0;mso-table-rspace:0">
            <tr>
              <td class=3D"mailpoet_divider-cell" style=3D"border-collaps=
e:collapse;border-top-width:3px;border-top-style:groove;border-top-color:=
#10aeb4">
             </td>
            </tr>
          </table>
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
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <table style=3D"border-collapse:collapse;border-spacing:0;mso-t=
able-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:11px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;letter-spacing:4=
px;text-align:left">
            <span style=3D"color: #7e8c8d"><strong>STATISTICS</strong></s=
pan>
          </td>
        </tr></table>
<h2 style=3D"margin:0 0 7.2px;mso-ansi-font-size:24px;color:#0074a2;font-=
family:lato,'helvetica neue',helvetica,arial,sans-serif;font-size:24px;li=
ne-height:38.4px;mso-line-height-alt:38px;text-align:left;padding:0;font-=
style:normal;font-weight:normal"><strong><span style=3D"color: #10aeb4">A=
 Look Back: June's Security Stats</span></strong></h2>
<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            We&rsquo;ve been working diligently to keep your sites secure=
. Over the past month, our vigilant team at Farsight Security Services ha=
s responded to <strong>1176 </strong> incidents across our clients' sites=
. As a result of our dedicated approach, we made <strong>42</strong> call=
s to the police, ensuring swift action where it was needed most.<br /><br=
 />
          </td>
        </tr></table>

<table style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspac=
e:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            <strong><span style=3D"color: #032a5f">Your safety is our top=
 priority, and these numbers reflect our ongoing commitment to protecting=
 your premises.</span></strong>
          </td>
        </tr></table>
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
        <td class=3D"mailpoet_spacer" bgcolor=3D"#ffffff" height=3D"37" v=
align=3D"top" style=3D"border-collapse:collapse"></td>
      </tr>
      <tr>
        <td class=3D"mailpoet_image " align=3D"center" valign=3D"top" sty=
le=3D"border-collapse:collapse">
          <img src=3D"https://www.farsight.co.uk/wp-content/uploads/2025/=
07/stats-4.png" width=3D"330" alt=3D"" style=3D"height:auto;max-width:100=
%;-ms-interpolation-mode:bicubic;border:0;display:block;outline:none;text=
-align:center;width:100%" />
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
        <td class=3D"mailpoet_divider" valign=3D"top" bgColor=3D"#ffffff"=
 style=3D"border-collapse:collapse;background-color:#ffffff;padding:13px =
20px 13px 20px">
          <table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacin=
g=3D"0" style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspa=
ce:0;mso-table-rspace:0">
            <tr>
              <td class=3D"mailpoet_divider-cell" style=3D"border-collaps=
e:collapse;border-top-width:3px;border-top-style:groove;border-top-color:=
#10aeb4">
             </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_spacer" bgcolor=3D"#ffffff" height=3D"20" v=
align=3D"top" style=3D"border-collapse:collapse"></td>
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
          <h2 data-post-id=3D"5436" style=3D"margin:0 0 7.2px;mso-ansi-fo=
nt-size:24px;color:#0074a2;font-family:lato,'helvetica neue',helvetica,ar=
ial,sans-serif;font-size:24px;line-height:38.4px;mso-line-height-alt:38px=
;margin-bottom:0;text-align:center;padding:0;font-style:normal;font-weigh=
t:normal">Static IP vs Dynamic IP for CCTV Monitoring</h2>
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
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <table style=3D"border-collapse:collapse;border-spacing:0;mso-t=
able-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            At Farsight, one of the most important requirements for relia=
ble remote monitoring is a stable internet connection=E2=80=94specificall=
y, a static IP address. Without a static IP, your CCTV system may lose co=
nnection to our Alarm Receiving Centre (ARC), resulting in avoidable faul=
ts, delays, or missed events. What Is a Static IP Address? A static IP ad=
dress is a fixed, unchanging identifier &hellip;
          </td>
        </tr></table>
        </td>
      </tr>
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
                    href=3D"https://www.farsight.co.uk/blog/static-ip-vs-=
dynamic-ip-for-cctv-monitoring/"
                    style=3D"height:45px;
                           width:144px;
                           v-text-anchor:middle;"
                    arcsize=3D"27%"
                    strokeweight=3D"0px"
                    strokecolor=3D"#0074a2"
                    fillcolor=3D"#10aeba">
                  <w:anchorlock/>
                  <center style=3D"color:#ffffff;
                    font-family:Lucida;
                    font-size:16px;
                    font-weight:bold;">Read more
                  </center>
                  </v:roundrect>
                  <![endif]-->
                  <!--[if !mso]><!-- -->
                  <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0"=
 role=3D"presentation" style=3D"border-collapse:separate;display:inline-b=
lock;mso-table-lspace:0;mso-table-rspace:0;width:144px" width=3D"144px">
                    <tr>
                      <td class=3D"mailpoet_table_button" valign=3D"middl=
e" role=3D"presentation" style=3D"border-collapse:collapse;mso-table-lspa=
ce:0;mso-table-rspace:0;display:block;text-decoration:none;text-align:cen=
ter;background-color:#10aeba;border-color:#0074a2;border-width:0px;border=
-radius:12px;border-style:solid;width:144px;line-height:45px;color:#fffff=
f;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;font-siz=
e:16px;font-weight:bold">
                        <a class=3D"mailpoet_button" style=3D"color:#ffff=
ff;text-decoration:none;display:block;line-height:45px" href=3D"https://w=
ww.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3D=
WyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsImVjOTcyY=
TgwMmE3MSIsZmFsc2Vd" target=3D"_blank">Read more</a>
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
        <td class=3D"mailpoet_image mailpoet_padded_vertical mailpoet_pad=
ded_side" align=3D"center" valign=3D"top" style=3D"border-collapse:collap=
se;padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:2=
0px">
          <a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3D=
track&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Y=
zRvMDR3ZzgiLCI2MCIsImVjOTcyYTgwMmE3MSIsZmFsc2Vd" style=3D"color:#10aeb4;t=
ext-decoration:underline"><img src=3D"https://www.farsight.co.uk/wp-conte=
nt/uploads/2025/06/Static-IP-vs-Roaming-IP-CCTV-Monitoring-Solutions-1320=
x756.png" width=3D"290" alt=3D"Static IP vs Roaming IP CCTV Monitoring So=
lutions" style=3D"height:auto;max-width:100%;-ms-interpolation-mode:bicub=
ic;border:0;display:block;outline:none;text-align:center" /></a>
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
        <td class=3D"mailpoet_divider" valign=3D"top" style=3D"border-col=
lapse:collapse;padding:13px 20px 13px 20px">
          <table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacin=
g=3D"0" style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspa=
ce:0;mso-table-rspace:0">
            <tr>
              <td class=3D"mailpoet_divider-cell" style=3D"border-collaps=
e:collapse;border-top-width:3px;border-top-style:solid;border-top-color:#=
aaaaaa">
             </td>
            </tr>
          </table>
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
          <h2 data-post-id=3D"5418" style=3D"margin:0 0 7.2px;mso-ansi-fo=
nt-size:24px;color:#0074a2;font-family:lato,'helvetica neue',helvetica,ar=
ial,sans-serif;font-size:24px;line-height:38.4px;mso-line-height-alt:38px=
;margin-bottom:0;text-align:center;padding:0;font-style:normal;font-weigh=
t:normal">Do All Security Cameras Require a Subscription?</h2>
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
        <td class=3D"mailpoet_image mailpoet_padded_vertical mailpoet_pad=
ded_side" align=3D"center" valign=3D"top" style=3D"border-collapse:collap=
se;padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:2=
0px">
          <a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3D=
track&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Y=
zRvMDR3ZzgiLCI2MCIsImVhYzAyNTFiNmQ0OCIsZmFsc2Vd" style=3D"color:#10aeb4;t=
ext-decoration:underline"><img src=3D"https://www.farsight.co.uk/wp-conte=
nt/uploads/2025/06/Security-Cameras-Subscription-vs-No-Subscription-1320x=
756.png" width=3D"290" alt=3D"Collection of security cameras, and nvrs, d=
vrs" style=3D"height:auto;max-width:100%;-ms-interpolation-mode:bicubic;b=
order:0;display:block;outline:none;text-align:center" /></a>
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
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <table style=3D"border-collapse:collapse;border-spacing:0;mso-t=
able-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            The short answer? No, not all security cameras require a subs=
cription. However, depending on the level of protection you require, ther=
e is a significant difference between an off-the-shelf system and one spe=
cifically designed for professional monitoring, such as the ones we suppo=
rt at Farsight Security Services. Understanding Subscription-Based Camera=
s Many consumer-brand cameras, such as Ring, Nest, or Arlo, rely on &hell=
ip;
          </td>
        </tr></table>
        </td>
      </tr>
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
                    href=3D"https://www.farsight.co.uk/blog/do-all-securi=
ty-cameras-require-a-subscription/"
                    style=3D"height:45px;
                           width:144px;
                           v-text-anchor:middle;"
                    arcsize=3D"27%"
                    strokeweight=3D"0px"
                    strokecolor=3D"#0074a2"
                    fillcolor=3D"#10aeba">
                  <w:anchorlock/>
                  <center style=3D"color:#ffffff;
                    font-family:Lucida;
                    font-size:16px;
                    font-weight:bold;">Read more
                  </center>
                  </v:roundrect>
                  <![endif]-->
                  <!--[if !mso]><!-- -->
                  <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0"=
 role=3D"presentation" style=3D"border-collapse:separate;display:inline-b=
lock;mso-table-lspace:0;mso-table-rspace:0;width:144px" width=3D"144px">
                    <tr>
                      <td class=3D"mailpoet_table_button" valign=3D"middl=
e" role=3D"presentation" style=3D"border-collapse:collapse;mso-table-lspa=
ce:0;mso-table-rspace:0;display:block;text-decoration:none;text-align:cen=
ter;background-color:#10aeba;border-color:#0074a2;border-width:0px;border=
-radius:12px;border-style:solid;width:144px;line-height:45px;color:#fffff=
f;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;font-siz=
e:16px;font-weight:bold">
                        <a class=3D"mailpoet_button" style=3D"color:#ffff=
ff;text-decoration:none;display:block;line-height:45px" href=3D"https://w=
ww.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3D=
WyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsImVhYzAyN=
TFiNmQ0OCIsZmFsc2Vd" target=3D"_blank">Read more</a>
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
        <td class=3D"mailpoet_divider" valign=3D"top" style=3D"border-col=
lapse:collapse;padding:13px 20px 13px 20px">
          <table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacin=
g=3D"0" style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspa=
ce:0;mso-table-rspace:0">
            <tr>
              <td class=3D"mailpoet_divider-cell" style=3D"border-collaps=
e:collapse;border-top-width:3px;border-top-style:solid;border-top-color:#=
aaaaaa">
             </td>
            </tr>
          </table>
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
          <h2 data-post-id=3D"5384" style=3D"margin:0 0 7.2px;mso-ansi-fo=
nt-size:24px;color:#0074a2;font-family:lato,'helvetica neue',helvetica,ar=
ial,sans-serif;font-size:24px;line-height:38.4px;mso-line-height-alt:38px=
;margin-bottom:0;text-align:center;padding:0;font-style:normal;font-weigh=
t:normal">Best CCTV Setup for Construction Site Security</h2>
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
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <table style=3D"border-collapse:collapse;border-spacing:0;mso-t=
able-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            Construction sites are dynamic, ever-changing environments th=
at pose unique security challenges. With valuable equipment, materials, a=
nd vehicles on-site, they=E2=80=99re prime targets for theft, vandalism, =
and unauthorised access. That's why effective CCTV coverage is crucial fo=
r protecting assets and ensuring the safety of your site. In this article=
, we=E2=80=99ll explore the best camera placement strategies for construc=
tion sites, the most suitable &hellip;
          </td>
        </tr></table>
        </td>
      </tr>
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
                    href=3D"https://www.farsight.co.uk/blog/best-cctv-set=
up-for-construction-site-security/"
                    style=3D"height:45px;
                           width:144px;
                           v-text-anchor:middle;"
                    arcsize=3D"27%"
                    strokeweight=3D"0px"
                    strokecolor=3D"#0074a2"
                    fillcolor=3D"#10aeba">
                  <w:anchorlock/>
                  <center style=3D"color:#ffffff;
                    font-family:Lucida;
                    font-size:16px;
                    font-weight:bold;">Read more
                  </center>
                  </v:roundrect>
                  <![endif]-->
                  <!--[if !mso]><!-- -->
                  <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0"=
 role=3D"presentation" style=3D"border-collapse:separate;display:inline-b=
lock;mso-table-lspace:0;mso-table-rspace:0;width:144px" width=3D"144px">
                    <tr>
                      <td class=3D"mailpoet_table_button" valign=3D"middl=
e" role=3D"presentation" style=3D"border-collapse:collapse;mso-table-lspa=
ce:0;mso-table-rspace:0;display:block;text-decoration:none;text-align:cen=
ter;background-color:#10aeba;border-color:#0074a2;border-width:0px;border=
-radius:12px;border-style:solid;width:144px;line-height:45px;color:#fffff=
f;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;font-siz=
e:16px;font-weight:bold">
                        <a class=3D"mailpoet_button" style=3D"color:#ffff=
ff;text-decoration:none;display:block;line-height:45px" href=3D"https://w=
ww.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3D=
WyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsIjI1NjhkO=
DA4ZGRjNSIsZmFsc2Vd" target=3D"_blank">Read more</a>
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
        <td class=3D"mailpoet_image mailpoet_padded_vertical mailpoet_pad=
ded_side" align=3D"center" valign=3D"top" style=3D"border-collapse:collap=
se;padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:2=
0px">
          <a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3D=
track&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Y=
zRvMDR3ZzgiLCI2MCIsIjI1NjhkODA4ZGRjNSIsZmFsc2Vd" style=3D"color:#10aeb4;t=
ext-decoration:underline"><img src=3D"https://www.farsight.co.uk/wp-conte=
nt/uploads/2025/06/CCTV-placement-feature-image-1320x756.png" width=3D"29=
0" alt=3D"Best CCTV Setup for Construction Site Security" style=3D"height=
:auto;max-width:100%;-ms-interpolation-mode:bicubic;border:0;display:bloc=
k;outline:none;text-align:center" /></a>
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
ollapse:collapse;background-color:#0074a2!important" bgcolor=3D"#0074a2">=

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
        <td class=3D"mailpoet_spacer" bgcolor=3D"#10aeb4" height=3D"20" v=
align=3D"top" style=3D"border-collapse:collapse"></td>
      </tr>
      <tr>
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <h2 style=3D"margin:0 0 7.2px;mso-ansi-font-size:24px;color:#00=
74a2;font-family:lato,'helvetica neue',helvetica,arial,sans-serif;font-si=
ze:11px;line-height:38.4px;mso-line-height-alt:38px;margin-bottom:0;lette=
r-spacing:4px;text-align:center;padding:0;font-style:normal;font-weight:n=
ormal"><span style=3D"color: #ffffff"><strong style=3D"font-size: 24px;ba=
ckground-color: inherit"><strong>Join the Farsight Community</strong></st=
rong></span></h2>
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
        <td class=3D"mailpoet_image mailpoet_padded_vertical mailpoet_pad=
ded_side" align=3D"center" valign=3D"top" style=3D"border-collapse:collap=
se;padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:2=
0px">
          <img src=3D"https://www.farsight.co.uk/wp-content/uploads/2025/=
05/profile-1.png" width=3D"183" alt=3D"" style=3D"height:auto;max-width:1=
00%;-ms-interpolation-mode:bicubic;border:0;display:block;outline:none;te=
xt-align:center" />
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
        <td class=3D"mailpoet_spacer" bgcolor=3D"#ffffff" height=3D"20" v=
align=3D"top" style=3D"border-collapse:collapse"></td>
      </tr>
      <tr>
        <td class=3D"mailpoet_text mailpoet_padded_vertical mailpoet_padd=
ed_side" valign=3D"top" style=3D"border-collapse:collapse;padding-top:10p=
x;padding-bottom:10px;padding-left:20px;padding-right:20px;word-break:bre=
ak-word;word-wrap:break-word">
          <table style=3D"border-collapse:collapse;border-spacing:0;mso-t=
able-lspace:0;mso-table-rspace:0" width=3D"100%" cellpadding=3D"0">
        <tr>
          <td class=3D"mailpoet_paragraph" style=3D"border-collapse:colla=
pse;mso-ansi-font-size:16px;color:#000000;font-family:lato,'helvetica neu=
e',helvetica,arial,sans-serif;font-size:15px;line-height:24px;mso-line-he=
ight-alt:24px;word-break:break-word;word-wrap:break-word;text-align:left"=
>
            Follow us for the latest updates, insights, and behind-the-sc=
enes content.<br />Stay connected with the people, tech, and stories behi=
nd the monitoring.
          </td>
        </tr></table>
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_padded_side mailpoet_padded_vertical" valig=
n=3D"top" align=3D"center" style=3D"border-collapse:collapse;padding-top:=
10px;padding-bottom:10px;padding-left:20px;padding-right:20px">
          <a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3D=
track&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Y=
zRvMDR3ZzgiLCI2MCIsImY5ZjJhYTBiYzliOSIsZmFsc2Vd" style=3D"color:#10aeb4;t=
ext-decoration:none!important"><img src=3D"https://www.farsight.co.uk/wp-=
content/plugins/mailpoet/assets/img/newsletter_editor/social-icons/03-cir=
cles/Facebook.png" width=3D"32" height=3D"32" style=3D"width:32px;height:=
32px;-ms-interpolation-mode:bicubic;border:0;display:inline;outline:none;=
" alt=3D"facebook" /></a>&nbsp;<a href=3D"https://www.farsight.co.uk?mail=
poet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdn=
o3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsIjFiNGNiMzE5YTAzMiIsZmFsc2Vd" s=
tyle=3D"color:#10aeb4;text-decoration:none!important"><img src=3D"https:/=
/www.farsight.co.uk/wp-content/plugins/mailpoet/assets/img/newsletter_edi=
tor/social-icons/03-circles/LinkedIn.png" width=3D"32" height=3D"32" styl=
e=3D"width:32px;height:32px;-ms-interpolation-mode:bicubic;border:0;displ=
ay:inline;outline:none;" alt=3D"linkedin" /></a>&nbsp;<a href=3D"https://=
www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3D=
WyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsImRjM2JlO=
TJhMDkxMiIsZmFsc2Vd" style=3D"color:#10aeb4;text-decoration:none!importan=
t"><img src=3D"https://www.farsight.co.uk/wp-content/plugins/mailpoet/ass=
ets/img/newsletter_editor/social-icons/03-circles/Youtube.png" width=3D"3=
2" height=3D"32" style=3D"width:32px;height:32px;-ms-interpolation-mode:b=
icubic;border:0;display:inline;outline:none;" alt=3D"youtube" /></a>&nbsp=
;<a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&a=
ction=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3=
ZzgiLCI2MCIsImNjMzliNGU1NTU2YyIsZmFsc2Vd" style=3D"color:#10aeb4;text-dec=
oration:none!important"><img src=3D"https://www.farsight.co.uk/wp-content=
/plugins/mailpoet/assets/img/newsletter_editor/social-icons/03-circles/Tw=
itter.png" width=3D"32" height=3D"32" style=3D"width:32px;height:32px;-ms=
-interpolation-mode:bicubic;border:0;display:inline;outline:none;" alt=3D=
"twitter" /></a>&nbsp;
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
                    style=3D"height:45px;
                           width:144px;
                           v-text-anchor:middle;"
                    arcsize=3D"27%"
                    strokeweight=3D"0px"
                    strokecolor=3D"#0074a2"
                    fillcolor=3D"#10aeba">
                  <w:anchorlock/>
                  <center style=3D"color:#ffffff;
                    font-family:Lucida;
                    font-size:16px;
                    font-weight:bold;">Free CCTV Quote
                  </center>
                  </v:roundrect>
                  <![endif]-->
                  <!--[if !mso]><!-- -->
                  <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0"=
 role=3D"presentation" style=3D"border-collapse:separate;display:inline-b=
lock;mso-table-lspace:0;mso-table-rspace:0;width:144px" width=3D"144px">
                    <tr>
                      <td class=3D"mailpoet_table_button" valign=3D"middl=
e" role=3D"presentation" style=3D"border-collapse:collapse;mso-table-lspa=
ce:0;mso-table-rspace:0;display:block;text-decoration:none;text-align:cen=
ter;background-color:#10aeba;border-color:#0074a2;border-width:0px;border=
-radius:12px;border-style:solid;width:144px;line-height:45px;color:#fffff=
f;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;font-siz=
e:16px;font-weight:bold">
                        <a class=3D"mailpoet_button" style=3D"color:#ffff=
ff;text-decoration:none;display:block;line-height:45px" href=3D"https://w=
ww.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3D=
WyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsIjM5YTY5M=
WMwMDEzYSIsZmFsc2Vd" target=3D"_blank">Free CCTV Quote</a>
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
                    style=3D"height:45px;
                           width:144px;
                           v-text-anchor:middle;"
                    arcsize=3D"27%"
                    strokeweight=3D"0px"
                    strokecolor=3D"#0074a2"
                    fillcolor=3D"#10aeba">
                  <w:anchorlock/>
                  <center style=3D"color:#ffffff;
                    font-family:Lucida;
                    font-size:16px;
                    font-weight:bold;">Free Alarm Quote
                  </center>
                  </v:roundrect>
                  <![endif]-->
                  <!--[if !mso]><!-- -->
                  <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0"=
 role=3D"presentation" style=3D"border-collapse:separate;display:inline-b=
lock;mso-table-lspace:0;mso-table-rspace:0;width:144px" width=3D"144px">
                    <tr>
                      <td class=3D"mailpoet_table_button" valign=3D"middl=
e" role=3D"presentation" style=3D"border-collapse:collapse;mso-table-lspa=
ce:0;mso-table-rspace:0;display:block;text-decoration:none;text-align:cen=
ter;background-color:#10aeba;border-color:#0074a2;border-width:0px;border=
-radius:12px;border-style:solid;width:144px;line-height:45px;color:#fffff=
f;font-family:'Lucida Sans Unicode', 'Lucida Grande', sans-serif;font-siz=
e:16px;font-weight:bold">
                        <a class=3D"mailpoet_button" style=3D"color:#ffff=
ff;text-decoration:none;display:block;line-height:45px" href=3D"https://w=
ww.farsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3D=
WyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsIjEwNjhjM=
jljZTAzNCIsZmFsc2Vd" target=3D"_blank">Free Alarm Quote</a>
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
        <td class=3D"mailpoet_divider" valign=3D"top" bgColor=3D"#ffffff"=
 style=3D"border-collapse:collapse;background-color:#ffffff;padding:13px =
20px 13px 20px">
          <table width=3D"100%" border=3D"0" cellpadding=3D"0" cellspacin=
g=3D"0" style=3D"border-collapse:collapse;border-spacing:0;mso-table-lspa=
ce:0;mso-table-rspace:0">
            <tr>
              <td class=3D"mailpoet_divider-cell" style=3D"border-collaps=
e:collapse;border-top-width:3px;border-top-style:groove;border-top-color:=
#10aeb4">
             </td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_image mailpoet_padded_vertical mailpoet_pad=
ded_side" align=3D"center" valign=3D"top" style=3D"border-collapse:collap=
se;padding-top:10px;padding-bottom:10px;padding-left:20px;padding-right:2=
0px">
          <img src=3D"https://www.farsight.co.uk/wp-content/uploads/2025/=
03/as-featured-600-x-250-px.png" width=3D"187" alt=3D"" style=3D"height:a=
uto;max-width:100%;-ms-interpolation-mode:bicubic;border:0;display:block;=
outline:none;text-align:center" />
        </td>
      </tr>
      <tr>
        <td class=3D"mailpoet_header_footer_padded mailpoet_footer" style=
=3D"border-collapse:collapse;padding:10px 20px;line-height:19.2px;text-al=
ign:center;color:#222222;font-family:Arial, 'Helvetica Neue', Helvetica, =
sans-serif;font-size:12px">
          <strong><span style=3D"color: #b25088"><a href=3D"https://www.f=
arsight.co.uk?mailpoet_router&endpoint=3Dtrack&action=3Dclick&data=3DWyI5=
NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsImFiNmZkMzIyN=
mUwZCIsZmFsc2Vd" style=3D"color:#b25088;text-decoration:none">Unsubscribe=
</a> | <a href=3D"https://www.farsight.co.uk?mailpoet_router&endpoint=3Dt=
rack&action=3Dclick&data=3DWyI5NDA4IiwiMThhcmZwdno3MTM0d2cwa2t3MG84d2t3Yz=
RvMDR3ZzgiLCI2MCIsIjk4MzgxYWRhMDAyNCIsZmFsc2Vd" style=3D"color:#b25088;te=
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
2t3MG84d2t3YzRvMDR3ZzgiLCI2MCIsbnVsbCxmYWxzZV0" /></body>
</html>

----==_mimepart_68639f3e7b6b_1e50742ecc38822c4--
