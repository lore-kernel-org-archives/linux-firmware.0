Return-Path: <SRS0=gyaM=7R=chelsio.com=vishal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF1CC433E0
	for <linux-firmware@archiver.kernel.org>; Thu,  4 Jun 2020 05:15:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C9E6D20772; Thu,  4 Jun 2020 05:15:39 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2093.outbound.protection.outlook.com [40.107.92.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C1212074B
	for <linux-firmware@kernel.org>; Thu,  4 Jun 2020 05:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chelsious.onmicrosoft.com header.i=@chelsious.onmicrosoft.com header.b="wYDzwDWW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C1212074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chelsio.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=vishal@chelsio.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WS+z9WHbl+IwsJIMwEKScdsYcLbNFM1pLX7hp2WLME2cyj6SpY2nyy6mUPWDFbf+UNVI0humF6cDZnJQtbWwFkiWMnY19mF+QiVS3P30ccSTWBlfMwATOGA1F9xFzqnCcknjGupoXRH2cLPgaLGPQbSGJoa4W4CpceWCUfUvhjVz37LhC7s6zsHnyUd+SbsXRp/YHZ+FJym9ICoGaniSVXtC+8+0+d1/8A7lLYG2NFWSloefDI2k6Os7pQif/kzlNooMgQ0AsuPFTNb9I0Oh7M+qZ/ByFIofQASs9BNBIvi/T4MSKj4pIN/Cn6Uv0azl6xYK6MwsIf8TiWb21gs7QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chn4AsZ7qGi1YJzhI+smAUM8G27PUMoAz3N0KUtsTNc=;
 b=a4F7NLnHEk9OeJox9KkLMXvs8DJRpr+SqZbwY5MZIVsd3/UiS4PTNcd6vNi8IbZUfkLqpexXgfD4Py8fIdcZjzIF1wrERIpHK8VZWaWECpIHlI1lduStbLMe65BpAdySES2lieZPEf0CrH7FsO/dSP76vic25dUl+NwYdfNUS+HFEALBi8qUa6Nf6CfWYEvtlZU4lrrX+wIxz+FtTUd9KIQvUYsZSirhtIoum7zxyXgZgl/0q+yvui2RTcZtQrvHxpzcL9F2FrP4vn5Bik3p8nOSbxaQg5unqCqI3xa75IdzmzubeqRdbAlqqnubYxFGv6BWAaLJlydSfMTrzf+b0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chelsio.com; dmarc=pass action=none header.from=chelsio.com;
 dkim=pass header.d=chelsio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chelsious.onmicrosoft.com; s=selector2-chelsious-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chn4AsZ7qGi1YJzhI+smAUM8G27PUMoAz3N0KUtsTNc=;
 b=wYDzwDWWhs7XB4NN/AJ4gWx9LXR0atJtBDSa63yGfUlC/p/F7qXJtDGJsGJkzlsYnJWH/Up1y98rVS+y6IEHt0hSCF4w0CgvXmcW6AEo5CZbpNXCKu72vx7XtkQ78DahaYz26/amcGnRBp60JrNYoi7NP8YOgTGgJ8lmY9UGnxA=
Received: from MN2PR12MB4344.namprd12.prod.outlook.com (2603:10b6:208:26e::11)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 4 Jun
 2020 05:15:37 +0000
Received: from MN2PR12MB4344.namprd12.prod.outlook.com
 ([fe80::9943:3ac8:1a6b:5e56]) by MN2PR12MB4344.namprd12.prod.outlook.com
 ([fe80::9943:3ac8:1a6b:5e56%5]) with mapi id 15.20.3066.019; Thu, 4 Jun 2020
 05:15:37 +0000
From: Vishal Kulkarni <vishal@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Nirranjan Kirubaharan <nirranjan@chelsio.com>
Subject: cxgb4: Update firmware to revision 1.24.17.0
Thread-Topic: cxgb4: Update firmware to revision 1.24.17.0
Thread-Index: AQHWOaOHN3tHcHnG2U6pQ0AZ0B1P4A==
Date: Thu, 4 Jun 2020 05:15:36 +0000
Message-ID:
 <MN2PR12MB4344EBDF8DDE1BBD06DFDA81CB880@MN2PR12MB4344.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=chelsio.com;
x-originating-ip: [111.93.130.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cb9e1bc-4622-4ca7-561f-08d8084650eb
x-ms-traffictypediagnostic: MN2PR12MB4424:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <MN2PR12MB4424C779E15AA4427D2CEFE9CB890@MN2PR12MB4424.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-forefront-prvs: 04244E0DC5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 C6dGs/Is4auycm8OH83iZ6uOJFIFPGrMlQx/Z6AboCfw2/KaLoRnXhD7RMKqQQEyVu44h1jg9J1kQjydDrXkhBPnFtcViBC1bvhW6CdvsKzo+R6qvP1QIh3IkPKNgr1BeSbXjUtLp1iHNsVvsbBdhbznyguFamqVEfjiVTmW9HwO4NIcwrgDU+/7DZFYHYhjSuze+hbDV7A9i6XMNlIhkLDCV+lYlfcCuFIElLh+pjoBCXDOC4XZj03KYcOWzE+ehFr+M1qq3jcQphEWBKZzoseJo4+1R5Lrl9puKvx0I4fuIhYGoF2/9rsP9Z1jPYENTLRJ9kLKEkwXwIlUffQM5A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4344.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(39830400003)(376002)(366004)(396003)(64756008)(6506007)(7696005)(52536014)(508600001)(33656002)(2906002)(4326008)(316002)(15650500001)(6916009)(5660300002)(71200400001)(26005)(8676002)(186003)(91956017)(66446008)(66556008)(66476007)(66946007)(76116006)(83380400001)(55016002)(8936002)(9686003)(19627405001)(86362001)(107886003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata:
 FoX8+MrqOr384rZlWxMCtvxaQEXPJCBTEiSLqjVHozYfw7/uSD9VMIPYf09R77MpdlK4qQemJFvmrD9yX8M3AtPyClwws72NJrui4eY0gk0u+XV5uMgSdJMuNBhiLseeg1GPFK/blZM6yTSLdDjeqvZPZ9qmOKKaaOcJeRVx/jPceWw0BdetP3JIuMzgBeF1kNrA1gufiR0rHQh0OQR9TgOJ2xli7c8MI99DBrBi5nafqZZuPurM2/tnIagE4H3jLnGiSB2bNdZGKGtyKHM8zCYn2V4Y09OsjAGLfmDb2FazBrgf1+QUQi3xe1zwKibqzFDkRKoCLSu6zmLUNdpvwRHwJ+1YULP96RVzsBfpq2WGdSGMla6a6qO+IPYmydFuJLVj2E/4ouW6oxzg9giU3ayp/C+XlmZxBfQJFysk5yMu8ENjDEBm0cnKxwb0XBYX+q6swefj1xSrJzbVUQVJD+XM2j50wT3FNEUbWZkGeFtVGBNZP9jqu3uI7+dUkall
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB4344EBDF8DDE1BBD06DFDA81CB880MN2PR12MB4344namp_"
MIME-Version: 1.0
X-OriginatorOrg: chelsio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb9e1bc-4622-4ca7-561f-08d8084650eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2020 05:15:37.0212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 065db76d-a7ae-4c60-b78a-501e8fc17095
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZAw0kq58IdyaJO73CoBtlzt14yf5ElrYnPTFhfkuFGkRIO9CxfWYV4Hl1RcvE8yEvtFUOSqO6adq3vrlfrJUSPc9g4VYUckyvLUp96tjOfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424

--_000_MN2PR12MB4344EBDF8DDE1BBD06DFDA81CB880MN2PR12MB4344namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

 Hi,

Kindly pull the new firmware from the following URL:
git://git.chelsio.net/pub/git/linux-firmware.git for-upstream

Thanks,
Vishal

The following changes since commit 8ba6fa665c52093ddc0d81137fc3c82cee2c5ef8=
:

  Merge tag 'iwlwifi-fw-2020-05-19' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/iwlwifi/linux-firmware (2020-05-19 07:28:12 -0400)

are available in the git repository at:


  git://git.chelsio.net/pub/git/linux-firmware.git for-upstream

for you to fetch changes up to 51a773df9020b053bf35adf16751aea0f1ca0bcf:

  cxgb4: Update firmware to revision 1.24.17.0 (2020-06-03 05:33:43 -0700)

----------------------------------------------------------------
Vishal Kulkarni (1):
      cxgb4: Update firmware to revision 1.24.17.0

 WHENCE                              |  12 ++++++------
 cxgb4/configs/t6-config-default.txt |   4 ++--
 cxgb4/t4fw-1.24.14.0.bin            | Bin 568832 -> 0 bytes
 cxgb4/t4fw-1.24.17.0.bin            | Bin 0 -> 568832 bytes
 cxgb4/t5fw-1.24.14.0.bin            | Bin 672256 -> 0 bytes
 cxgb4/t5fw-1.24.17.0.bin            | Bin 0 -> 672768 bytes
 cxgb4/t6fw-1.24.14.0.bin            | Bin 726016 -> 0 bytes
 cxgb4/t6fw-1.24.17.0.bin            | Bin 0 -> 727040 bytes
 8 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 cxgb4/t4fw-1.24.14.0.bin
 create mode 100644 cxgb4/t4fw-1.24.17.0.bin
 delete mode 100644 cxgb4/t5fw-1.24.14.0.bin
 create mode 100644 cxgb4/t5fw-1.24.17.0.bin
 delete mode 100644 cxgb4/t6fw-1.24.14.0.bin
 create mode 100644 cxgb4/t6fw-1.24.17.0.bin


--_000_MN2PR12MB4344EBDF8DDE1BBD06DFDA81CB880MN2PR12MB4344namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><span>&nbsp;Hi,<br>
</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>
<div><br>
</div>
<div>Kindly pull the new firmware from the following URL:<br>
</div>
<div>git://git.chelsio.net/pub/git/linux-firmware.git for-upstream<br>
</div>
<div><br>
</div>
<div>Thanks,<br>
</div>
<span>Vishal</span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>The following changes since commit 8ba6fa665c52093ddc0d81137fc3c82cee=
2c5ef8:<br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div><br>
</div>
<div>&nbsp; Merge tag 'iwlwifi-fw-2020-05-19' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/iwlwifi/linux-firmware (2020-05-19 07:28:12 -0400)<br>
</div>
<div><br>
</div>
<div>are available in the git repository at:<br>
</div>
<div><br>
</div>
<div><br>
</div>
<div>&nbsp; git://git.chelsio.net/pub/git/linux-firmware.git for-upstream<b=
r>
</div>
<div><br>
</div>
<div>for you to fetch changes up to 51a773df9020b053bf35adf16751aea0f1ca0bc=
f:<br>
</div>
<div><br>
</div>
<div>&nbsp; cxgb4: Update firmware to revision 1.24.17.0 (2020-06-03 05:33:=
43 -0700)<br>
</div>
<div><br>
</div>
<div>----------------------------------------------------------------<br>
</div>
<div>Vishal Kulkarni (1):<br>
</div>
<div>&nbsp; &nbsp; &nbsp; cxgb4: Update firmware to revision 1.24.17.0<br>
</div>
<div><br>
</div>
<div>&nbsp;WHENCE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| &nbsp;12 &#43;&#43;&#43;&#=
43;&#43;&#43;------<br>
</div>
<div>&nbsp;cxgb4/configs/t6-config-default.txt | &nbsp; 4 &#43;&#43;--<br>
</div>
<div>&nbsp;cxgb4/t4fw-1.24.14.0.bin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| Bin 568832 -&gt; 0 bytes<br>
</div>
<div>&nbsp;cxgb4/t4fw-1.24.17.0.bin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| Bin 0 -&gt; 568832 bytes<br>
</div>
<div>&nbsp;cxgb4/t5fw-1.24.14.0.bin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| Bin 672256 -&gt; 0 bytes<br>
</div>
<div>&nbsp;cxgb4/t5fw-1.24.17.0.bin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| Bin 0 -&gt; 672768 bytes<br>
</div>
<div>&nbsp;cxgb4/t6fw-1.24.14.0.bin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| Bin 726016 -&gt; 0 bytes<br>
</div>
<div>&nbsp;cxgb4/t6fw-1.24.17.0.bin &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;| Bin 0 -&gt; 727040 bytes<br>
</div>
<div>&nbsp;8 files changed, 8 insertions(&#43;), 8 deletions(-)<br>
</div>
<div>&nbsp;delete mode 100644 cxgb4/t4fw-1.24.14.0.bin<br>
</div>
<div>&nbsp;create mode 100644 cxgb4/t4fw-1.24.17.0.bin<br>
</div>
<div>&nbsp;delete mode 100644 cxgb4/t5fw-1.24.14.0.bin<br>
</div>
<div>&nbsp;create mode 100644 cxgb4/t5fw-1.24.17.0.bin<br>
</div>
<div>&nbsp;delete mode 100644 cxgb4/t6fw-1.24.14.0.bin<br>
</div>
<div>&nbsp;create mode 100644 cxgb4/t6fw-1.24.17.0.bin<br>
</div>
<span></span><br>
</div>
</body>
</html>

--_000_MN2PR12MB4344EBDF8DDE1BBD06DFDA81CB880MN2PR12MB4344namp_--
