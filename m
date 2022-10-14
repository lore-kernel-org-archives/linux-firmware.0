Return-Path: <SRS0=Z/4w=2P=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EB6C433FE
	for <linux-firmware@archiver.kernel.org>; Fri, 14 Oct 2022 06:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4CF4BC433D7; Fri, 14 Oct 2022 06:48:20 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by smtp.kernel.org (Postfix) with ESMTP id 02536C433D6
	for <linux-firmware@kernel.org>; Fri, 14 Oct 2022 06:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02536C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=tempfail smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 29E6l01t9027528, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 29E6l01t9027528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Fri, 14 Oct 2022 14:47:00 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 14 Oct 2022 14:47:30 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 14 Oct 2022 14:47:30 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::402d:f52e:eaf0:28a2]) by
 RTEXMBS04.realtek.com.tw ([fe80::402d:f52e:eaf0:28a2%5]) with mapi id
 15.01.2375.007; Fri, 14 Oct 2022 14:47:30 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: pull request: rtw89: 8852b: add initial fw v0.27.32.0
Thread-Topic: pull request: rtw89: 8852b: add initial fw v0.27.32.0
Thread-Index: AdjfmJWWptE39e6CTBSbwIhk5ddXWA==
Date: Fri, 14 Oct 2022 06:47:29 +0000
Message-ID: <16127c1d65f44d37a125f6000f4b9714@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2022/10/14_=3F=3F_03:18:00?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

Hi,

Add first 8852B firmware of rtw89 driver, and update WHENCE as well.

Thank you
Ping-Ke

---
The following changes since commit 49fccf689a13c0d49bc2f911247d51a4435a7eaa=
:

  Merge tag 'iwlwifi-fw-2022-13-10' of http://git.kernel.org/pub/scm/linux/=
kernel/git/iwlwifi/linux-firmware (2022-10-13 08:34:06 -0400)

are available in the Git repository at:

  https://github.com/pkshih/linux-firmware.git HEAD

for you to fetch changes up to e497757a948697838d7d56bf0cf94831b3655d6f:

  rtw89: 8852b: add initial fw v0.27.32.0 (2022-10-14 14:36:08 +0800)

----------------------------------------------------------------
Ping-Ke Shih (1):
      rtw89: 8852b: add initial fw v0.27.32.0

 WHENCE                |   3 ++-
 rtw89/rtw8852b_fw.bin | Bin 0 -> 1029056 bytes
 2 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 rtw89/rtw8852b_fw.bin


