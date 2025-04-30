Return-Path: <SRS0=yyOD=XQ=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A90C369D9
	for <linux-firmware@archiver.kernel.org>; Wed, 30 Apr 2025 06:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5250FC4CEEA; Wed, 30 Apr 2025 06:09:38 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B62AC4CEE9
	for <linux-firmware@kernel.org>; Wed, 30 Apr 2025 06:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B62AC4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 53U69XF602529431, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1745993373; bh=nysZutRqDRdmf9N/VPWFSQ+OAhGUZMFDZ8JWw8/9GOg=;
	h=From:To:CC:Subject:MIME-Version:Content-Type:Message-ID:Date;
	b=tQVvyRf94wFu5SEeSN/gQvJYHkm6uJuTRXPdQfg1pWpKjCDZPQwMmr6Lbxj5GbJ+p
	 mMzazDYsy60Ic0TwncjdaTunM1+Tts5J0jgZ3L4ey36XMSAlbzmXFNroud/Y1oWP7R
	 BjP2LoFqjxHELnRFrWrlglgsrkSXTVyT7aPVhKQwgFx6+IHo7nM8wfa8uwXamEFRQB
	 8XGtTnc4KKOMhUTRVxN+maEIhzjNc2FoYMyuXw7KNZ3Iv+Xo02Nt8SzZCTil3j5LkL
	 luw95NUdm/uV3ij8gcqvUse/kdmB/2oLy6jkoZ3Kg/FrsP0E9gj/F7Ma9/FtaVW7TY
	 7ejS987pMyH9g==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 53U69XF602529431
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 14:09:33 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Apr 2025 14:09:33 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 30 Apr
 2025 14:09:33 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <damon.chen@realtek.com>
Subject: pull-request: update firmware for rtw89 driver along with tag rtw-fw-2025-04-30
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <35d55e0b-8cc9-41f4-b48b-08d7e9f39f97@RTEXMBS04.realtek.com.tw>
Date: Wed, 30 Apr 2025 14:09:33 +0800
X-Originating-IP: [172.21.69.94]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

Hi,

Update firmware to fix problem of disconnection from AP, and add table
for DAG mechanism.

Thank you
Ping-Ke

---

The following changes since commit 0d104598cd5bfff9e1f1a3d0eb86568710cfb4a7:

  Merge branch 'rock-pi-x' into 'main' (2025-04-28 13:14:38 +0000)

are available in the Git repository at:

  https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2025-04-30

for you to fetch changes up to f56a4436ffe343c5e605050dd174a988950f0699:

  rtw89: 8852c: add tables for dynamic antenna TXPWR (2025-04-30 14:00:05 +0800)

----------------------------------------------------------------
Kuan-Chung Chen (2):
      rtw89: 8922a: update fw to v0.35.71.0
      rtw89: 8852c: add tables for dynamic antenna TXPWR

 rtw89/rtw8852c_fw-2.bin | Bin 2411688 -> 2444568 bytes
 rtw89/rtw8922a_fw-3.bin | Bin 1224798 -> 1238542 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)
