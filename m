Return-Path: <SRS0=FiWL=SD=realtek.com=pkshih@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8338ED5E141
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Nov 2024 06:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50C42C4CECF; Fri,  8 Nov 2024 06:52:39 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 042FAC4CECE
	for <linux-firmware@kernel.org>; Fri,  8 Nov 2024 06:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 042FAC4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4A86qWB011542025, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1731048753; bh=MbHzrPDlKUoQCIlKr9iv1mNHYBlS9S5PhFoVmuBgoo4=;
	h=From:To:CC:Subject:MIME-Version:Content-Type:Message-ID:Date;
	b=GLxeCJz1RSC+yttmx3+2JXucPpyM/grhhmXHxkR0LdO/7EmeaMhpKKMhUltfW//M2
	 l/VrS5q+bByLv5K4nJTq6ktpLNgM3Mepokq+ENEbw2dhpVh/7hEAy2odf2l/MJ5Yn3
	 bI6kOVNdwSdt49IrveIRXtoszcbXsLyvkqEeR82QjMfdGTETz+OWNAv0LmgFtPdPsX
	 Y6KjS6xI6OocnZYZ0rWuQHljB9YRveldaN7jPuW/EDJJxJHPrxKRpn2U094ac1fJ8B
	 g8Vs+P6i4l1VS7dTt1Ol8loeKcUT9Xkuhqb3TrRanN9JO1MBQc07119aX82Eiu9ofB
	 DujegCMD4+zhg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4A86qWB011542025
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Nov 2024 14:52:33 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 14:52:33 +0800
Received: from [127.0.1.1] (172.21.69.94) by RTEXMBS04.realtek.com.tw
 (172.21.6.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Fri, 8 Nov
 2024 14:52:31 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <gary.chang@realtek.com>
Subject: [RESEND v2] pull-request: rtw89: 8852a: update fw to v0.13.36.2
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <1082df9a-5d1f-4044-b679-b2308971fc47@RTEXMBS04.realtek.com.tw>
Date: Fri, 8 Nov 2024 14:52:31 +0800
X-Originating-IP: [172.21.69.94]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS04.realtek.com.tw (172.21.6.97)

Hi,

Update firmware of 8852a to v0.13.36.2

Sorry that I messed my script to send improper first pull-request.

Thank you
Ping-Ke

---

The following changes since commit e817e483c4b5bd0cd73a3d7e26c0a59c86b8c995:

  Merge branch 'rtw88' into 'main' (2024-11-07 13:29:19 +0000)

are available in the Git repository at:

  https://github.com/pkshih/linux-firmware.git tags/rtw-fw-2024-11-08

for you to fetch changes up to b6bfff1a5b0fad254a693b9d4275271d4dda7f03:

  rtw89: 8852a: update fw to v0.13.36.2 (2024-11-08 13:35:28 +0800)

----------------------------------------------------------------
Chih-Kang Chang (1):
      rtw89: 8852a: update fw to v0.13.36.2

 rtw89/rtw8852a_fw.bin | Bin 1423232 -> 1428272 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
