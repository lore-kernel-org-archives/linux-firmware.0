Return-Path: <SRS0=EhRP=TI=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D81DC433F5
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Feb 2022 02:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06E2FC340F4; Fri, 25 Feb 2022 02:34:35 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8C04C340EB
	for <linux-firmware@kernel.org>; Fri, 25 Feb 2022 02:34:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8C04C340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 21P2YOSf8024636, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 21P2YOSf8024636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 25 Feb 2022 10:34:24 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 25 Feb 2022 10:34:24 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 25 Feb 2022 10:34:23 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::35e4:d9d1:102d:605e]) by
 RTEXMBS04.realtek.com.tw ([fe80::35e4:d9d1:102d:605e%5]) with mapi id
 15.01.2308.020; Fri, 25 Feb 2022 10:34:23 +0800
From: Pkshih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        Timlee
	<timlee@realtek.com>
Subject: RE:  pull request: rtw89: 8852a: update fw to v0.13.35.0
Thread-Topic: pull request: rtw89: 8852a: update fw to v0.13.35.0
Thread-Index: Adgp7vGtLqktCzGJRcuQp3Ifswi/4gAAQdYA
Date: Fri, 25 Feb 2022 02:34:23 +0000
Message-ID: <1f1012ed29384933b7040a562d43e424@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2022/2/25_=3F=3F_12:23:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled

Hi,=20

Sorry, I mistype address of wireless mailing list, so resend it again.

Ping-Ke
---
The following changes since commit c784d7a3e3c2a83e3911fd3dd0e105911a323a5f=
:

  rtw89: 8852a: update fw to v0.13.35.0 (2022-02-25 10:04:46 +0800)

are available in the Git repository at:

  https://github.com/pkshih/linux-firmware.git

for you to fetch changes up to c784d7a3e3c2a83e3911fd3dd0e105911a323a5f:

  rtw89: 8852a: update fw to v0.13.35.0 (2022-02-25 10:04:46 +0800)

----------------------------------------------------------------


> -----Original Message-----
> From: Pkshih
> Sent: Friday, February 25, 2022 10:30 AM
> To: 'linux-firmware@kernel.org' <linux-firmware@kernel.org>
> Cc: 'wireless@vger.kernel.org' <wireless@vger.kernel.org>; timlee@realtek=
.com
> Subject: pull request: rtw89: 8852a: update fw to v0.13.35.0
>=20
> Hi,
>=20
> Update firmware of rtw89 driver to 0.13.35.0
>=20
> Thank you
> Ping-Ke
>=20
> ---
>=20
> The following changes since commit c784d7a3e3c2a83e3911fd3dd0e105911a323a=
5f:
>=20
>   rtw89: 8852a: update fw to v0.13.35.0 (2022-02-25 10:04:46 +0800)
>=20
> are available in the Git repository at:
>=20
>   https://github.com/pkshih/linux-firmware.git
>=20
> for you to fetch changes up to c784d7a3e3c2a83e3911fd3dd0e105911a323a5f:
>=20
>   rtw89: 8852a: update fw to v0.13.35.0 (2022-02-25 10:04:46 +0800)
>=20
> ----------------------------------------------------------------

