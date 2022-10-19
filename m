Return-Path: <SRS0=2ppL=2U=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4B7C433FE
	for <linux-firmware@archiver.kernel.org>; Wed, 19 Oct 2022 01:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86D89C433B5; Wed, 19 Oct 2022 01:49:34 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by smtp.kernel.org (Postfix) with ESMTP id D793CC433C1
	for <linux-firmware@kernel.org>; Wed, 19 Oct 2022 01:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D793CC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 29J1mcwP7028999, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 29J1mcwP7028999
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Wed, 19 Oct 2022 09:48:38 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 19 Oct 2022 09:49:10 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 19 Oct 2022 09:49:09 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::add3:284:fd3d:8adb]) by
 RTEXMBS04.realtek.com.tw ([fe80::add3:284:fd3d:8adb%5]) with mapi id
 15.01.2375.007; Wed, 19 Oct 2022 09:49:09 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Subject: pull request: rtlwifi: Add firmware v4.0 for RTL8188FU
Thread-Topic: pull request: rtlwifi: Add firmware v4.0 for RTL8188FU
Thread-Index: AdjjW++tFCB/oTmxTDOyoYxH6CssYg==
Date: Wed, 19 Oct 2022 01:49:09 +0000
Message-ID: <fabce04424f945a7a51cc466919d4a01@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2022/10/18_=3F=3F_11:53:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

Hi,

Add firmware 4.0 for RTL8188FU based on Bitterblue's patch [0], but revise
WHENCE and commit message to reflect name from original SDK. Also, I have
confirmed the firmware content is expected.=20

Thank you
Ping-Ke

[0] https://lore.kernel.org/linux-firmware/CA+5PVA4gbbVsKN6bB8ktod4hPTeiKPS=
kJrmKVjtoagpz2XAYbQ@mail.gmail.com/

---
The following changes since commit 48407ffd7adb9511701547068b1e6f0956bd1c94=
:

  cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)

are available in the Git repository at:

  https://github.com/pkshih/linux-firmware.git HEAD

for you to fetch changes up to 9aa8db1ccb9a83eeb3f5daf71e4206d218648c49:

  rtlwifi: Add firmware v4.0 for RTL8188FU (2022-10-19 09:36:55 +0800)

----------------------------------------------------------------
Bitterblue Smith (1):
      rtlwifi: Add firmware v4.0 for RTL8188FU

 WHENCE                  |   6 ++++++
 rtlwifi/rtl8188fufw.bin | Bin 0 -> 21020 bytes
 2 files changed, 6 insertions(+)
 create mode 100644 rtlwifi/rtl8188fufw.bin

