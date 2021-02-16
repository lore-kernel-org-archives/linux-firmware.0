Return-Path: <matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13EEC433DB
	for <linux-firmware@archiver.kernel.org>; Tue, 16 Feb 2021 19:35:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A1B2764DCF; Tue, 16 Feb 2021 19:35:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDF03614A5;
	Tue, 16 Feb 2021 19:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613504130;
	bh=S7WKe6yKniykHe6zi6CQKnVrPy3WgHjB2aXWea1Y5P0=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=oVP9GgKXXheV+Xzzjd58oz/MQFhlbVHNCu66XJQuA04pKTLSnBZ16Z8fre+1bq8jp
	 cNP8DPqaeYcqPaZx4YPH3NAuEzTHnLzYlwTmP1jScJNtRAryg/+0SBapZJpAwkz07I
	 qo79liEHy3kmLZeARJLKB1+dDC/C7H49Dm770Wb0/TxS8VIn9WF5X3CjkYL89FNdIC
	 bFYMIjUdNQgvwrgyhGb0H/dtfdSLpMhlHIPpYCRz+4XOK2XF/De7+P9NnZ9sKrqF14
	 GbaJikCO1G5DHJSYPXN79MZuxfkn1D5aKWe1JCVg5hG4YDRlXOKeWBIvVd/ahTKkED
	 VdS1Q4SsI4DgQ==
From: matthias.bgg@kernel.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	ruud@veniogames.com,
	pbrobinson@gmail.com,
	nsaenzjulienne@suse.de,
	matthias.bgg@kernel.org,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH] brcm: Fix Raspberry Pi 4B NVRAM file
Date: Tue, 16 Feb 2021 20:35:23 +0100
Message-Id: <20210216193523.32321-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthias Brugger <mbrugger@suse.com>

NVRAM file set's boarflags3 to 0x48200100 which indicates the firmware
that an external LPO is present. But on the RPi4 no external LPO exists.

Fixes: 870b805 ("brcm: Update Raspberry Pi 3B+/4B NVRAM for downstream changes")
Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt b/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
index d5bd530..8dda168 100644
--- a/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+++ b/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
@@ -7,7 +7,7 @@ aa5g=1
 AvVmid_c0=1,165,2,100,2,100,2,100,2,100
 boardflags=0x00480201
 boardflags2=0x40800000
-boardflags3=0x48200100
+boardflags3=0x44200100
 boardrev=0x1304
 boardtype=0x6e4
 btc_mode=1
-- 
2.30.0

