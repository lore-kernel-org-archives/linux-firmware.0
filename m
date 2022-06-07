Return-Path: <SRS0=ASrI=WO=manjaro.org=strit@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8689BC43334
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Jun 2022 14:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D02CC385A5; Tue,  7 Jun 2022 14:28:20 +0000 (UTC)
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A2094C34114
	for <linux-firmware@kernel.org>; Tue,  7 Jun 2022 14:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A2094C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=manjaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=manjaro.org
From: Dan Johansen <strit@manjaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dan Johansen <strit@manjaro.org>
Subject: [PATCH 2/2] WHENCE: brcm: Add brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt
Date: Tue,  7 Jun 2022 16:27:16 +0200
Message-Id: <20220607142716.1934891-2-strit@manjaro.org>
In-Reply-To: <20220607142716.1934891-1-strit@manjaro.org>
References: <20220607142716.1934891-1-strit@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Dan Johansen <strit@manjaro.org>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index f634c12..6dcb5e9 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2913,6 +2913,7 @@ File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
 Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
 File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
+File: "brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt"
 File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
 Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
 File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
-- 
2.36.1

