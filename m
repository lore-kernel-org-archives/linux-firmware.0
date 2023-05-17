Return-Path: <SRS0=3Vlk=BG=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46601C7EE24
	for <linux-firmware@archiver.kernel.org>; Wed, 17 May 2023 02:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10C2EC4339C; Wed, 17 May 2023 02:51:55 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CDEAC433EF
	for <linux-firmware@kernel.org>; Wed, 17 May 2023 02:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CDEAC433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 34H2pdyF7027378, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 34H2pdyF7027378
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Wed, 17 May 2023 10:51:39 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 17 May 2023 10:51:48 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 17 May 2023 10:51:47 +0800
Received: from RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d]) by
 RTEXMBS04.realtek.com.tw ([fe80::e138:e7f1:4709:ff4d%5]) with mapi id
 15.01.2375.007; Wed, 17 May 2023 10:51:47 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "rtl8821cerfe2@gmail.com" <rtl8821cerfe2@gmail.com>
Subject: pull request: rtlwifi: update firmware v6.0 for RTL8192FU and v28.0 for RTL8188EU 
Thread-Topic: pull request: rtlwifi: update firmware v6.0 for RTL8192FU and
 v28.0 for RTL8188EU 
Thread-Index: AdmIahpavq8CU354RU2wXeaqoANnoQ==
Date: Wed, 17 May 2023 02:51:47 +0000
Message-ID: <97eb7e849c46445180f6e77d565f831b@realtek.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.21.69.188]
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback

Hi,

Update firmware for chips newly supported by rtl8xxxu.

Thank you
Ping-Ke

---
The following changes since commit 512909428e46953e4ade391387aef1305f52029c=
:

  Merge branch 'main' of https://github.com/CirrusLogic/linux-firmware (202=
3-05-15 13:24:26 -0400)

are available in the Git repository at:

  https://github.com/pkshih/linux-firmware.git HEAD

for you to fetch changes up to 08b854f020666a5df3d1987f6c01c8c2b780de7e:

  rtlwifi: Add firmware v6.0 for RTL8192FU (2023-05-17 10:09:36 +0800)

----------------------------------------------------------------
Bitterblue Smith (2):
      rtlwifi: Update firmware for RTL8188EU to v28.0
      rtlwifi: Add firmware v6.0 for RTL8192FU

 WHENCE                  |  23 ++++++++++++++---------
 rtlwifi/rtl8188eufw.bin | Bin 13904 -> 15262 bytes
 rtlwifi/rtl8192fufw.bin | Bin 0 -> 32416 bytes
 3 files changed, 14 insertions(+), 9 deletions(-)
 create mode 100644 rtlwifi/rtl8192fufw.bin

