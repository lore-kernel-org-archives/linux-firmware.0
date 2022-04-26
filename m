Return-Path: <SRS0=4Nik=VE=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F795C4332F
	for <linux-firmware@archiver.kernel.org>; Tue, 26 Apr 2022 08:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0FACDC385AC; Tue, 26 Apr 2022 08:49:16 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CC608C385A0
	for <linux-firmware@kernel.org>; Tue, 26 Apr 2022 08:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CC608C385A0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 23Q8mWQH1023105, This message is accepted by code: ctloc85258
Received: from mail.realtek.com ([172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 23Q8mWQH1023105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 26 Apr 2022 16:48:32 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 26 Apr 2022 16:48:32 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 26 Apr 2022 16:48:32 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::34e7:ab63:3da4:27c6]) by
 RTEXMBS04.realtek.com.tw ([fe80::34e7:ab63:3da4:27c6%5]) with mapi id
 15.01.2308.021; Tue, 26 Apr 2022 16:48:32 +0800
From: Pkshih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: pull request: rtw89: 8852c: add new firmware v0.27.20.0 for RTL8852C
Thread-Topic: pull request: rtw89: 8852c: add new firmware v0.27.20.0 for
 RTL8852C
Thread-Index: AdhZShpfxc33S+KyTZ2GMd7kA2xhSg==
Date: Tue, 26 Apr 2022 08:48:32 +0000
Message-ID: <40254b0dabfd4b0c8f345d345325853e@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2022/4/26_=3F=3F_04:38:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled

Hi,

RTL8852C has been supported by rtw89 driver, so send a corresponding firmwa=
re.

Thank you
Ping-Ke

---
The following changes since commit e7d3d08c72abd1a2e57cf93b626b5b835b262dca=
:

  rtw89: 8852c: add new firmware v0.27.20.0 for RTL8852C (2022-04-26 16:15:=
42 +0800)

are available in the Git repository at:

  https://github.com/pkshih/linux-firmware.git

for you to fetch changes up to e7d3d08c72abd1a2e57cf93b626b5b835b262dca:

  rtw89: 8852c: add new firmware v0.27.20.0 for RTL8852C (2022-04-26 16:15:=
42 +0800)

----------------------------------------------------------------

