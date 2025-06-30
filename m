Return-Path: <SRS0=+DBX=ZN=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED42C7EE2A
	for <linux-firmware@archiver.kernel.org>; Mon, 30 Jun 2025 05:28:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1EB85C4CEEB; Mon, 30 Jun 2025 05:28:55 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12398C4CEE3
	for <linux-firmware@kernel.org>; Mon, 30 Jun 2025 05:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12398C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 55U5Snm264142727, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1751261329; bh=QcZCmqiwv9uwV7FWxUCDGMra4lTmfw9/hHPeBaFgafc=;
	h=From:To:CC:Subject:MIME-Version:Content-Type:Message-ID:Date;
	b=jPpNPSz6XhziekHOW8ywM8BHUqi916WOMtOMRaj93ekQejiIV2vNfNu0Ey4kWhVfG
	 FAiVvdTVeZHydKVRsYdMKIxfvHNpvFg1MQllPquur6KJ3Y6wVH7v1vOY1EVDinZOQJ
	 7Nrwuse5GsWoBo8UqjMtWBGjHnpp7T/Hc4f1VHs8v3jDlRQnZ+c/cPcvCL2DiEBUDG
	 n46BOkVWKh58d7QKb53nC1gU63DwUD5P3QSggWEm0QbcwefQubdlDH83QxRRrOAnSi
	 YTQbQ3ItEEVQd6DmOmCODxnsn7X38K8hMOPGkP4pLSXsw9wCFiQ3rk+rn2ECPGfIp4
	 g+cU4WOmMen3Q==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 55U5Snm264142727
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 13:28:49 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 30 Jun 2025 13:29:09 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Mon, 30 Jun
 2025 13:29:09 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <timlee@realtek.com>
Subject: pull-request: update rtw firmware rtw-fw-2025-06-30
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <eb81e590-2a34-4578-a9e4-e83b8bd6819d@RTEXMBS04.realtek.com.tw>
Date: Mon, 30 Jun 2025 13:29:09 +0800
X-Originating-IP: [172.21.69.94]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

Hi,

Update firmware of RTL8852C and RTL8922A for rtw89 WiFi driver.

Thank you
Ping-Ke

---

The following changes since commit f40eafe216833d083f4e5598b7f45e894c373ad1:

  Merge branch 'license' into 'main' (2025-06-27 11:45:29 +0000)

are available in the Git repository at:

  https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2025-06-30

for you to fetch changes up to 78478bfc44319c14eeb35d4098c3a84f55fc6bb5:

  rtw89: 8922a: update fw to v0.35.80.0 (2025-06-30 13:26:58 +0800)

----------------------------------------------------------------
Chin-Yen Lee (1):
      rtw89: 8852c: update fw to v0.27.128.0

Ping-Ke Shih (2):
      rtw89: 8852c: update fw to v0.27.129.1
      rtw89: 8922a: update fw to v0.35.80.0

 WHENCE                  |   1 +
 rtw89/rtw8852c_fw-2.bin | Bin 2444568 -> 2461176 bytes
 rtw89/rtw8922a_fw-4.bin | Bin 0 -> 1259006 bytes
 3 files changed, 1 insertion(+)
 create mode 100644 rtw89/rtw8922a_fw-4.bin
