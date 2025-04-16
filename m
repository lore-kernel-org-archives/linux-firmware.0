Return-Path: <SRS0=xL7Z=XC=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D35CC369B1
	for <linux-firmware@archiver.kernel.org>; Wed, 16 Apr 2025 04:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 487C0C4CEEA; Wed, 16 Apr 2025 04:27:34 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73533C4CEE2
	for <linux-firmware@kernel.org>; Wed, 16 Apr 2025 04:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73533C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 53G4RLI202654510, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1744777641; bh=Kpgm09SXsoz/y1kAt/Rzt4dek2OpeksRdFLqEQXIy7M=;
	h=From:To:CC:Subject:MIME-Version:Content-Type:Message-ID:Date;
	b=ERY2HfjuE6ZmQXIcy1iowUIghzIG9lywCEaxV2POqS/LpEKsPlhyB6Mb4f7PD5f3q
	 Bd8X6RyvrHo/TiUFQs5qooQEqhpLAaGueJtGSIKOJQXiqwkW3Hm3v4mNAg86AYDB7S
	 YANr5Ic0GPry0GLRLh9AADGKUE7McTDECeU0UO2Yo4fRULSntnJrle5e9UvrMBDa3G
	 +fQ7xDtZqHJLwBFvmm9Gzy0HoXzFhln+Rry3075BrkujA4KwExiltmgkYIC0ygdqra
	 Qt0zU3AwyRNXZq5SCTsJ6nmMKkai9wco5UrEpBTxD81EL4CYgpSx5MQv/o2jBxcXBk
	 jbGYui28Nfqdw==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 53G4RLI202654510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 12:27:21 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Apr 2025 12:27:22 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 16 Apr
 2025 12:27:22 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <kevin_yang@realtek.com>,
        <kevin_yang@realtek.com>
Subject: pull-request: update rtw89 firmware with rtw-fw-2025-04-16
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <27ec817e-4b99-445e-8bd5-f61a38b4746c@RTEXMBS04.realtek.com.tw>
Date: Wed, 16 Apr 2025 12:27:22 +0800
X-Originating-IP: [172.21.69.94]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

Hi,

Because firmware v0.27.125.0 for RTL8852C changes the format, old driver
can't recognize the new changes, causing failed to probe. To fix this,
move the version from rtw89/rtw8852c_fw-1.bin to rtw89/rtw8852c_fw-2.bin.

Others are to update elements related to TX power.

Thank you
Ping-Ke

---

The following changes since commit 6a006cef10cebfaa282100a81cb45ad3a9212721:

  Merge branch 'intel/guc_70441' into 'main' (2025-04-10 20:59:06 +0000)

are available in the Git repository at:

  https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2025-04-16

for you to fetch changes up to 4eeab443621fc045fa094b2f69de1cb8025aa414:

  rtw89: 8922a: update element RF TXPWR to R40 (2025-04-16 09:41:56 +0800)

----------------------------------------------------------------
Ping-Ke Shih (2):
      Revert "rtw89: 8852c: update fw to v0.27.125.0"
      rtw89: 8852c: add fw v0.27.125.0 with format version 2

Zong-Zhe Yang (2):
      rtw89: 8852c: update element RF TXPWR to R78
      rtw89: 8922a: update element RF TXPWR to R40

 WHENCE                  |   1 +
 rtw89/rtw8852c_fw-1.bin | Bin 2399272 -> 2375560 bytes
 rtw89/rtw8852c_fw-2.bin | Bin 0 -> 2411688 bytes
 rtw89/rtw8922a_fw-3.bin | Bin 1188926 -> 1224798 bytes
 4 files changed, 1 insertion(+)
 create mode 100644 rtw89/rtw8852c_fw-2.bin
