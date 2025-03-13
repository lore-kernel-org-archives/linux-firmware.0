Return-Path: <SRS0=jw21=WA=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC47C28B28
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Mar 2025 03:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EFB7CC4CEEB; Thu, 13 Mar 2025 03:02:06 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A79F8C4CEDD
	for <linux-firmware@kernel.org>; Thu, 13 Mar 2025 03:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A79F8C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 52D31tqxE427077, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1741834915; bh=3lB2CeSPev5Z/NoS7+29BuH9Uc/oIdbpXuOX/XjWe6c=;
	h=From:To:CC:Subject:MIME-Version:Content-Type:Message-ID:Date;
	b=Q7/KcXL1e7TtARKLus3jyW4kNK1kTy14FGfZNyamVMQvk4GD1tFuoePdSg8tGZ4q0
	 Ro6T4Az0zc4rDgllOo+BPfcFtbuKTpfVsWD/N7eTUEOwX9ewRlNSWDpxiE50H34Et1
	 WpkSyd21XJeTgL3Ntrgyo5DopeX67X4WL16lFQEFRVblE/n6xeHz1tKl5pxN7sPf9e
	 TJ9krEvKIg1gPvJmZcm5fyskTMF+j29ZfxhbWGrgNGY/X0wlx+bSJKj5zxP5BP05th
	 OZ2BwnRlfQTKAjEHn+6V+s5boqOC1ZS/YnaJ2m/ykTL2/ILlfDKb+5f59WcBUpzBGE
	 P/Wm0ROiwHffg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 52D31tqxE427077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 11:01:55 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Mar 2025 11:01:55 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 13 Mar
 2025 11:01:54 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <damon.chen@realtek.com>
Subject: pull-request: update rtw89 fw for RTL8852C and RTL8922A
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <6784cbe4-7afe-48ca-8d74-e30339c72ca9@RTEXMBS04.realtek.com.tw>
Date: Thu, 13 Mar 2025 11:01:54 +0800
X-Originating-IP: [172.21.69.94]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

Hi,

Update firmware of rtw89 divers including RTL8852C and RTL8922A with
support of secure boot.

Thank you
Ping-Ke

---

The following changes since commit 89ba9b7ce05c8dac3b659b6a0ebc87a601fc35b1:

  Merge branch 'robot/pr-0-1741722400' into 'main' (2025-03-12 13:09:10 +0000)

are available in the Git repository at:

  https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2025-03-13

for you to fetch changes up to da086994b2ad7ca25167baa78cd0a5385092c584:

  rtw89: 8922a: update fw to v0.35.64.0 (2025-03-13 10:58:03 +0800)

----------------------------------------------------------------
Kuan-Chung Chen (1):
      rtw89: 8922a: update fw to v0.35.64.0

Ping-Ke Shih (2):
      rtw89: 8852c: update fw to v0.27.125.0
      rtw89: 8922a: update fw to v0.35.63.0

 rtw89/rtw8852c_fw-1.bin | Bin 2375560 -> 2399272 bytes
 rtw89/rtw8922a_fw-3.bin | Bin 1725278 -> 1188926 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)
