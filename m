Return-Path: <SRS0=DSCP=6E=chelsio.com=vishal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08EFC3815B
	for <linux-firmware@archiver.kernel.org>; Mon, 20 Apr 2020 10:59:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 90C3320735; Mon, 20 Apr 2020 10:59:58 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2102.outbound.protection.outlook.com [40.107.220.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F107A20724
	for <linux-firmware@kernel.org>; Mon, 20 Apr 2020 10:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chelsious.onmicrosoft.com header.i=@chelsious.onmicrosoft.com header.b="oy0BvMYO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F107A20724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chelsio.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=vishal@chelsio.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZCNvJohYkoVFFkMF8lizmEeH2WX8RSKzdx2NsM5eQpxAr/JjziMZkgYp92E3Q91C1Psis9v/j1EnnJ7NIO422nIjA0V/FRa9yk4Or9hHDITWeqsyJU2Puk3jMTpyAAK5v15uj7VjcoxCWA5NgC7EVTqFpRVJHQI2BdEuKe726vdZAGxQImNG17pvRlQLTF1Se/TtiYC6gOlMX80NG+D0/ZakXB72SdvymFItYvaYASGpuMSmnBmXD+sK+UlSYBAxCvv5IJwTWhc0/Ce18rD3YqVLakrz61RmIuHjpzs22Zk24ZOTnE9sssYvx93GPlP3pEhM/BFsHd90hjxmLTgcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeRms2KOpejdVP+dUZTb8OgPbrWGiG7KIpGdhqQr8e4=;
 b=ePVEv9TxWX3rv6KYGjDKoqt8ru9A0nFVy7DcZU+98OmgYY2zgJScr1irXuuwDCvj2YEm1jwA7N0PsE9IwysfyNHSjKhduKlDN/z/2G3XSDa3InU7RochBuNyURaN/M5K5WxygwZO+xNvCs7rfRsEx8n6NaCjFnc5eLujIk5rSCeKBdFarFuOv5nfvh0TwdEbhC0n5pH0ucI3nWJMb1fWfDjfj8xDvIwUSPwbS5nZ2glYDh+pu2xenod8dY53uiUASstEDYdjpAgOkM6BxRq9eEtLXydi1aYbJ8VKkVDV8jw/t8GCRaK5h7Ib5j6JK+fDIdC+ssL68rzffX3TdTR4Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chelsio.com; dmarc=pass action=none header.from=chelsio.com;
 dkim=pass header.d=chelsio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chelsious.onmicrosoft.com; s=selector2-chelsious-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeRms2KOpejdVP+dUZTb8OgPbrWGiG7KIpGdhqQr8e4=;
 b=oy0BvMYOlUxlh9/vSbdURTut3luHjGezMsQFdyIDW3juk8oc2hco2nBBK/qtqFzIKvQyvy72tACPale/ibSPFHot31C5YXAH0+hwZVrkSLZINJ15ypccsMAYR3u34Na/lxw1S3eVbJMIaBfUcn8vSUjdznZH2mDqpelvBU+3vy0=
Received: from BYAPR12MB3558.namprd12.prod.outlook.com (2603:10b6:a03:aa::31)
 by BYAPR12MB2951.namprd12.prod.outlook.com (2603:10b6:a03:138::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Mon, 20 Apr
 2020 10:59:55 +0000
Received: from BYAPR12MB3558.namprd12.prod.outlook.com
 ([fe80::184:f60d:212:8132]) by BYAPR12MB3558.namprd12.prod.outlook.com
 ([fe80::184:f60d:212:8132%7]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 10:59:55 +0000
From: Vishal Kulkarni <vishal@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Nirranjan Kirubaharan <nirranjan@chelsio.com>, dt <dt@chelsio.com>
Subject: pull request: Linux-firmware: Update cxgb4 firmware config file
Thread-Topic: pull request: Linux-firmware: Update cxgb4 firmware config file
Thread-Index: AQHWFuZwmXoxoEBvb0aK4tganBFXJQ==
Date: Mon, 20 Apr 2020 10:59:54 +0000
Message-ID:
 <BYAPR12MB355881E9A7D373596FDE0B59CBD40@BYAPR12MB3558.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vishal@chelsio.com; 
x-originating-ip: [171.48.27.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 493bc355-5eaa-41a4-12e4-08d7e519f580
x-ms-traffictypediagnostic: BYAPR12MB2951:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <BYAPR12MB2951862B385600F6442ACEE0CBD40@BYAPR12MB2951.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3558.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(396003)(39830400003)(136003)(376002)(366004)(346002)(8676002)(508600001)(4744005)(81156014)(86362001)(8936002)(91956017)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(33656002)(52536014)(71200400001)(5660300002)(6506007)(54906003)(26005)(19627405001)(186003)(316002)(2906002)(55016002)(9686003)(4326008)(6916009)(7696005)(107886003)(15650500001);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: chelsio.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 XJCZxRmNmRQY+dn5xlq6IwxIvCQc41WV2CizC0c54ww/tFpkIrw/CPH7yoqt3EcAWON/i3oL/POqso2ScOfDAxwmpsIl9m5ngAXP8ZTJLYgcXEayrO2g16kwmNoGv++YUke51DrDA8XgNsTU9icy85APFcHzw8RxoV0UkRuDUxgR/y/bRRISWKgoaRelYBR76DOGGM9drNZMzzAtp9ce2TX/ECIm8mgvvp7Um5oKokBbE0Uc5T8AQxSxn1O4mq90XE6ZpZf0kbIBVzVDyzci66qKSg5p6D5yjy2tKw8N7cD5fhLKuSDF+zse90HW6iYYN0KUqFCCWM3E19kc4O9aeSbldaLi/Rc+mnaXMz5lKGQXT3vm5oRSxY0HZ1u0Iiby++9SegD5tZJXvJfX9RmFrLi3bLVtkUdXEbSxUf7F/GnfHbFMI0fKXaG3cEPUJTL1
x-ms-exchange-antispam-messagedata:
 pvMRB4tZOGxiMZBfBixX58Kae+uFgLOh7ViW2dDgg9H0D6ltqECw0RW/7YtiorVq9DmP68ye0leC+dzV/dtlzXgPz5mOw2/k9UFR8Q50dG+PPi1Nrbl53tNUtptaxR1Ek6xZhIQ80626KfT/QYUjiA==
Content-Type: multipart/alternative;
	boundary="_000_BYAPR12MB355881E9A7D373596FDE0B59CBD40BYAPR12MB3558namp_"
MIME-Version: 1.0
X-OriginatorOrg: chelsio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 493bc355-5eaa-41a4-12e4-08d7e519f580
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 10:59:55.0489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 065db76d-a7ae-4c60-b78a-501e8fc17095
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IhpbyDuGdggCidIS2/CQvMfhHYz2t0DSZLYZoorR32WsaGGFaFAfAvHaUCGqXZApC0+4I0HfIJ2QfiGhbY4OmH+iFbr381e/3YwRHSg4sok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2951

--_000_BYAPR12MB355881E9A7D373596FDE0B59CBD40BYAPR12MB3558namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Kindly pull latest firmware config file from below URL.
git://git.chelsio.net/pub/git/linux-firmware.git for-upstream

Thanks,
Vishal Kulkarni

The following changes since commit 6314fa0cada1b052c973ef3f78c9689305554bd9=
:

  amdgpu: update vega20 firmware for 20.10 (2020-04-17 11:26:39 -0400)

are available in the git repository at:

  git://git.chelsio.net/pub/git/linux-firmware.git for-upstream

for you to fetch changes up to 8aa36f57ec443f390a17373df40537abf28e1fe6:

  cxgb4: Update T6 config file (2020-04-20 00:27:18 -0700)

----------------------------------------------------------------
Vishal Kulkarni (1):
      cxgb4: Update T6 config file

 cxgb4/configs/t6-config-default.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


--_000_BYAPR12MB355881E9A7D373596FDE0B59CBD40BYAPR12MB3558namp_
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
<div><span>Hi,</span></div>
<div><span><br>
</span></div>
<div><span>Kindly pull latest firmware config file from below URL.</span></=
div>
<div><span><font size=3D"2"><span style=3D"font-size:11pt">git://git.chelsi=
o.net/pub/git/linux-firmware.git for-upstream</span></font><br>
</span></div>
<div><span><br>
</span></div>
<div><span>Thanks,<br>
</span></div>
<div><span>Vishal Kulkarni<br>
</span></div>
<div><span><br>
</span></div>
<div><span>The following changes since commit 6314fa0cada1b052c973ef3f78c96=
89305554bd9:</span></div>
<div><span></span></div>
<span></span>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div><br>
</div>
<div>&nbsp; amdgpu: update vega20 firmware for 20.10 (2020-04-17 11:26:39 -=
0400)<br>
</div>
<div><br>
</div>
<div>are available in the git repository at:<br>
</div>
<div><br>
</div>
<div>&nbsp; git://git.chelsio.net/pub/git/linux-firmware.git for-upstream<b=
r>
</div>
<div><br>
</div>
<div>for you to fetch changes up to 8aa36f57ec443f390a17373df40537abf28e1fe=
6:<br>
</div>
<div><br>
</div>
<div>&nbsp; cxgb4: Update T6 config file (2020-04-20 00:27:18 -0700)<br>
</div>
<div><br>
</div>
<div>----------------------------------------------------------------<br>
</div>
<div>Vishal Kulkarni (1):<br>
</div>
<div>&nbsp; &nbsp; &nbsp; cxgb4: Update T6 config file<br>
</div>
<div><br>
</div>
<div>&nbsp;cxgb4/configs/t6-config-default.txt | 8 &#43;&#43;&#43;&#43;----=
<br>
</div>
<div>&nbsp;1 file changed, 4 insertions(&#43;), 4 deletions(-)<br>
</div>
<span></span><br>
</div>
</body>
</html>

--_000_BYAPR12MB355881E9A7D373596FDE0B59CBD40BYAPR12MB3558namp_--
