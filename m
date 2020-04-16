Return-Path: <SRS0=T9+/=6A=chelsio.com=vishal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D99C2BB55
	for <linux-firmware@archiver.kernel.org>; Thu, 16 Apr 2020 11:36:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6AC7421D7F; Thu, 16 Apr 2020 11:36:30 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2133.outbound.protection.outlook.com [40.107.236.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B651B20656
	for <linux-firmware@kernel.org>; Thu, 16 Apr 2020 11:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chelsious.onmicrosoft.com header.i=@chelsious.onmicrosoft.com header.b="lkk6jdb1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B651B20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chelsio.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=vishal@chelsio.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnoTRqh+QDVQh+ltHLu/a4cdAZkDZXASzgE+7BmvS7DKAULK1dT9hwoVluJPm7jhiSdbT2hvckDBK5+oZLAMw2og6nJY7zGEHFdFB9AZIKQp6US+E7s5pWB6P93VFL6ardjPrkEVAA9zLQxPukE4tyPE+fSO/hrjbDUUSaHGJwyBV7y/DZ3PAUuX2450T6wnDA8K8m0hH9e5Iq0czwiBgUObAkzBi5L7IqWWS+Z39o52HszU1KQdEZ9BdFucBJv6FbQKdOb7/MDzCvwKmnSPZv32TjFeUPf8qpPUvLdBwEdYvLEB/QFna775YAZfWn9sapVIRZjpEcnhEbak4RAyDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUSbw7N1rOPXg3u7K8i11Iao9rCpDPj1em8rllVH8qY=;
 b=B4R0ymRN9FJnQUzMFTqKevWaRr+qiItz1eCC2x9JqMjQ63Xy8CjKrydYx0tN8t4rX5RQSFKgA2GVagOMnfoBjhvOBIUkZbJ7Lm7uwkRUvu+TCjKmdgGdRU2P/ABd58v7HY+fAWgQjpmV8Gn5YmT2rY0AQQNJN65gy1z2HylB8ms8ZsSvnlUohVMLjGOl+0uRQi3qqQpU9ynXgCzKIWNPheMFFmiyTDgypB0o32lSfaT/voTUmdU9EyF8+UcdFr2dn4zsZH5J3/oKy4dqLHB8wu4GXDTLC2wEP5RcW8EEphtt/SL3a+FXa02V5gon/F2FZWEd2V4QNzY+0vLGqWcUlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chelsio.com; dmarc=pass action=none header.from=chelsio.com;
 dkim=pass header.d=chelsio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chelsious.onmicrosoft.com; s=selector2-chelsious-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUSbw7N1rOPXg3u7K8i11Iao9rCpDPj1em8rllVH8qY=;
 b=lkk6jdb1WTm3W07BPrmQpREqb6CQGqGe7l9IALF2C/DKl4PhaDuVEqEch/C7pkVsjYCwXEzcaFioCPpEBQWTQn0w5SatFMGScXpO+VRCMDqOIxtNQIe9j0foVpH4I4ZdZcO4KHvryE/n/KfWuhIIvzahPQuLnDdWPddKqp0mdgc=
Received: from BYAPR12MB3558.namprd12.prod.outlook.com (2603:10b6:a03:aa::31)
 by BYAPR12MB2726.namprd12.prod.outlook.com (2603:10b6:a03:66::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26; Thu, 16 Apr
 2020 11:36:26 +0000
Received: from BYAPR12MB3558.namprd12.prod.outlook.com
 ([fe80::184:f60d:212:8132]) by BYAPR12MB3558.namprd12.prod.outlook.com
 ([fe80::184:f60d:212:8132%7]) with mapi id 15.20.2900.028; Thu, 16 Apr 2020
 11:36:26 +0000
From: Vishal Kulkarni <vishal@chelsio.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: Nirranjan Kirubaharan <nirranjan@chelsio.com>, dt <dt@chelsio.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: pull request: Linux-firmware: Update cxgb4 firmware
Thread-Topic: pull request: Linux-firmware: Update cxgb4 firmware
Thread-Index: AQHWE+KbaaoQHtjmwEWyHBgYyIlV3g==
Date: Thu, 16 Apr 2020 11:36:26 +0000
Message-ID:
 <BYAPR12MB3558BCAE7FC75EE3173002A6CBD80@BYAPR12MB3558.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vishal@chelsio.com; 
x-originating-ip: [122.167.42.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17dfd33f-00c3-4bbd-fe63-08d7e1fa662f
x-ms-traffictypediagnostic: BYAPR12MB2726:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs:
 <BYAPR12MB2726E42AFB992EEE6D031DE0CBD80@BYAPR12MB2726.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-forefront-prvs: 0375972289
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3558.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(39830400003)(376002)(346002)(396003)(136003)(366004)(5660300002)(508600001)(33656002)(86362001)(966005)(186003)(55016002)(4326008)(19627405001)(9686003)(7696005)(8936002)(2906002)(76116006)(71200400001)(52536014)(66946007)(64756008)(66446008)(81156014)(8676002)(15650500001)(6916009)(6506007)(26005)(66556008)(54906003)(66476007)(316002)(91956017);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: chelsio.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 z0HgVc3yBpgC26Aq7MXJaFDnRaz8pICI8CR2BQFPEtqgEBfuoysZ6C++kTJwzKO5OkYqoeIu6tiIClR+pgghqGKl7wbKfRQjWHg2SEgCuFtF89XuO8XSFe2VZNvqrpJiCHlSJyB6yy8Cjlnl9wKa5scIcYiGOrKoHWQJE29wRAaonEoC+MQ4xtJLutvskTo8yNpBas/1Bhc5r0Xeg62t6uFv5JLdDhjwxD70xHwg8QQqBjk3KFEgYvCJ1NePuIuNP4tFVG1l/muwwLoV9V0cVD0tmsFhIC6neLhEYUo3XhirE4EdgakuR05rl2XTmJzg0TXg9K7rjahTsLVbzlwNzpks2aAhJ7iRf6BmtOxG8ZWisXEpti9SQsn+YLu8tgw+eyt4qI62KatwWLnegbS5m5Js/Lt6SQLfBeC7WnGfmOIYFfAvK5uoc6xWQfcqqcxKZ491QiyN0gCt7zp6rOk6qGjy84ashM9u3cotUkgNnKt+Cc4upzxfla3G/8+mGTY54w/0nLADRTmdAFAIRm3r4A==
x-ms-exchange-antispam-messagedata:
 R8re8upIuCPDMumLeSjFa5bnSe2f+De7chAYYcH2nZGag82bISGc9SkrSKBdidSTN1Kk7ivMK9MRLo5TQ5WYyDOdL0rALXBGDh1XldlIZ0Fgn1rM41HYoK+nNasonrT1+gch5aXwcJgTZT3FokXhPw==
Content-Type: multipart/alternative;
	boundary="_000_BYAPR12MB3558BCAE7FC75EE3173002A6CBD80BYAPR12MB3558namp_"
MIME-Version: 1.0
X-OriginatorOrg: chelsio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17dfd33f-00c3-4bbd-fe63-08d7e1fa662f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2020 11:36:26.6930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 065db76d-a7ae-4c60-b78a-501e8fc17095
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kSSeNm3QYiaZkAMv72KrJ71jOMXGHp1dWBGdw75iQAoeYJSRV0ZCDcsz60KjkpJ5bJL80PGs2YuYpiO3wSeUUxzRHg3RqA/R4feZz0bTQsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2726

--_000_BYAPR12MB3558BCAE7FC75EE3173002A6CBD80BYAPR12MB3558namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Kindly pull the new firmware from the following URL:
git://git.chelsio.net/pub/git/linux-firmware.git for-upstream

Thanks,
Vishal

The following changes since commit 64dba0fedb22eae32f76dcd4534b3f416db178de=
:

  Merge branch 'a630-zap' of https://github.com/andersson/linux-firmware (2=
020-04-13 08:17:58 -0400)

are available in the git repository at:


  git://git.chelsio.net/pub/git/linux-firmware.git for-upstream

for you to fetch changes up to 3afe520b4493c8a562cc9ee91842f252b1004c1b:

  cxgb4: Update firmware to revision 1.24.14.0 (2020-04-16 04:03:18 -0700)

----------------------------------------------------------------
Vishal Kulkarni (1):
      cxgb4: Update firmware to revision 1.24.14.0

 WHENCE                   |  12 ++++++------
 cxgb4/t4fw-1.24.11.0.bin | Bin 568832 -> 0 bytes
 cxgb4/t4fw-1.24.14.0.bin | Bin 0 -> 568832 bytes
 cxgb4/t5fw-1.24.11.0.bin | Bin 673280 -> 0 bytes
 cxgb4/t5fw-1.24.14.0.bin | Bin 0 -> 672256 bytes
 cxgb4/t6fw-1.24.11.0.bin | Bin 727552 -> 0 bytes
 cxgb4/t6fw-1.24.14.0.bin | Bin 0 -> 726016 bytes
 7 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 cxgb4/t4fw-1.24.11.0.bin
 create mode 100644 cxgb4/t4fw-1.24.14.0.bin
 delete mode 100644 cxgb4/t5fw-1.24.11.0.bin
 create mode 100644 cxgb4/t5fw-1.24.14.0.bin
 delete mode 100644 cxgb4/t6fw-1.24.11.0.bin
 create mode 100644 cxgb4/t6fw-1.24.14.0.bin


--_000_BYAPR12MB3558BCAE7FC75EE3173002A6CBD80BYAPR12MB3558namp_
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
<font size=3D"2"><span style=3D"font-size:11pt">Hi,<br>
</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
Kindly pull the new firmware from the following URL:<br>
git://git.chelsio.net/pub/git/linux-firmware.git for-upstream<br>
<br>
Thanks,<br>
Vishal<br>
</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>The following changes since commit 64dba0fedb22eae32f76dcd4534b3f416d=
b178de:<br>
</span>
<div><br>
</div>
<div>&nbsp; Merge branch 'a630-zap' of https://github.com/andersson/linux-f=
irmware (2020-04-13 08:17:58 -0400)<br>
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
<div>for you to fetch changes up to 3afe520b4493c8a562cc9ee91842f252b1004c1=
b:<br>
</div>
<div><br>
</div>
<div>&nbsp; cxgb4: Update firmware to revision 1.24.14.0 (2020-04-16 04:03:=
18 -0700)<br>
</div>
<div><br>
</div>
<div>----------------------------------------------------------------<br>
</div>
<div>Vishal Kulkarni (1):<br>
</div>
<div>&nbsp; &nbsp; &nbsp; cxgb4: Update firmware to revision 1.24.14.0<br>
</div>
<div><br>
</div>
<div>&nbsp;WHENCE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; | &nbsp;12 &#43;&#43;&#43;&#43;&#43;&#43;------<br>
</div>
<div>&nbsp;cxgb4/t4fw-1.24.11.0.bin | Bin 568832 -&gt; 0 bytes<br>
</div>
<div>&nbsp;cxgb4/t4fw-1.24.14.0.bin | Bin 0 -&gt; 568832 bytes<br>
</div>
<div>&nbsp;cxgb4/t5fw-1.24.11.0.bin | Bin 673280 -&gt; 0 bytes<br>
</div>
<div>&nbsp;cxgb4/t5fw-1.24.14.0.bin | Bin 0 -&gt; 672256 bytes<br>
</div>
<div>&nbsp;cxgb4/t6fw-1.24.11.0.bin | Bin 727552 -&gt; 0 bytes<br>
</div>
<div>&nbsp;cxgb4/t6fw-1.24.14.0.bin | Bin 0 -&gt; 726016 bytes<br>
</div>
<div>&nbsp;7 files changed, 6 insertions(&#43;), 6 deletions(-)<br>
</div>
<div>&nbsp;delete mode 100644 cxgb4/t4fw-1.24.11.0.bin<br>
</div>
<div>&nbsp;create mode 100644 cxgb4/t4fw-1.24.14.0.bin<br>
</div>
<div>&nbsp;delete mode 100644 cxgb4/t5fw-1.24.11.0.bin<br>
</div>
<div>&nbsp;create mode 100644 cxgb4/t5fw-1.24.14.0.bin<br>
</div>
<div>&nbsp;delete mode 100644 cxgb4/t6fw-1.24.11.0.bin<br>
</div>
<div>&nbsp;create mode 100644 cxgb4/t6fw-1.24.14.0.bin<br>
</div>
<span></span><br>
</div>
</body>
</html>

--_000_BYAPR12MB3558BCAE7FC75EE3173002A6CBD80BYAPR12MB3558namp_--
