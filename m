Return-Path: <SRS0=0CiI=EW=realtek.com=hildawu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4D3C55ABD
	for <linux-firmware@archiver.kernel.org>; Mon, 16 Nov 2020 05:54:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D0A4F222EA; Mon, 16 Nov 2020 05:54:53 +0000 (UTC)
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A018522280;
	Mon, 16 Nov 2020 05:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A018522280
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=hildawu@realtek.com
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0AG5smmxF013662, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb04.realtek.com.tw[172.21.6.97])
	by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0AG5smmxF013662
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 16 Nov 2020 13:54:48 +0800
Received: from localhost.localdomain (172.21.132.41) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Mon, 16 Nov 2020 13:54:47 +0800
From: <hildawu@realtek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <jwboyer@kernel.org>, <Larry.Finger@lwfinger.net>, <max.chou@realtek.com>,
        <alex_lu@realsil.com.cn>, <hsinyu_chang@realtek.com>,
        <kidman@realtek.com>
Subject: [PATCH] rtl_bt: Update RTL8822C BT(UART I/F) FW to 0x059A_25CB
Date: Mon, 16 Nov 2020 13:54:38 +0800
Message-ID: <20201116055438.6048-1-hildawu@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.21.132.41]
X-ClientProxiedBy: RTEXMB03.realtek.com.tw (172.21.6.96) To
 RTEXMB04.realtek.com.tw (172.21.6.97)

From: Hilda Wu <hildawu@realtek.com>

This firmware patch update for Realtek RTL8822C BT controller.(UART I/F)

Release Version:0x059A_25CB

Signed-off-by: Hilda Wu <hildawu@realtek.com>
---
 rtl_bt/rtl8822cs_fw.bin | Bin 58640 -> 60956 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/rtl_bt/rtl8822cs_fw.bin b/rtl_bt/rtl8822cs_fw.bin
index bd92ad58c9feeb03378e1bbb49cb1f75e0c9e3b7..cf51ee96fe4bb6f9ed371c6f411c1556b4989724 100644
GIT binary patch
delta 8354
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
bTd59si=zBvOBHz33!J)JLsPFYPyYG8wwg4E

delta 5981
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
Rc+5mz+ijq!*~+IM|1Wm?_A>wg

-- 
2.17.1

