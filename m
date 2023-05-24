Return-Path: <SRS0=fZ7M=BN=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07E2C7EE29
	for <linux-firmware@archiver.kernel.org>; Wed, 24 May 2023 00:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DFEEC433D2; Wed, 24 May 2023 00:44:55 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C06D8C433EF
	for <linux-firmware@kernel.org>; Wed, 24 May 2023 00:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C06D8C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 34O0iXQy9011346, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 34O0iXQy9011346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Wed, 24 May 2023 08:44:33 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 24 May 2023 08:44:44 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 24 May 2023 08:44:44 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Wed, 24 May 2023 08:44:44 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: pull request [v2]: rtw89: 8851b: add firmware v0.29.41.0
Thread-Topic: pull request [v2]: rtw89: 8851b: add firmware v0.29.41.0
Thread-Index: AdmN2K1wMvVRYge3Ts2HesAmQ7eBCg==
Date: Wed, 24 May 2023 00:44:44 +0000
Message-ID: <bb354783d5c6464a87a3e2d90a0a13bd@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

Hi,

Add initial firmware of rtw89 driver for newly supported chip 8851BE.

Add the missing WHENCE by v2.

Thank you
Ping-Ke

---
The following changes since commit 1ba3519eab0fbc3cedf6b423ea0470461b902c1b=
:

  Merge branch 'dev-queue' of git://git.kernel.org/pub/scm/linux/kernel/git=
/tnguy/firmware (2023-05-23 13:07:29 -0400)

are available in the Git repository at:

  https://github.com/pkshih/linux-firmware.git HEAD

for you to fetch changes up to d0ea9ba17f908b3976cd37f81a68747e811a4fcf:

  rtw89: 8851b: add firmware v0.29.41.0 (2023-05-24 08:39:48 +0800)

----------------------------------------------------------------
Ping-Ke Shih (1):
      rtw89: 8851b: add firmware v0.29.41.0

 WHENCE                |   1 +
 rtw89/rtw8851b_fw.bin | Bin 0 -> 1090544 bytes
 2 files changed, 1 insertion(+)
 create mode 100644 rtw89/rtw8851b_fw.bin

