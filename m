Return-Path: <SRS0=LcvX=GL=arm.com=jeremy.linton@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41D1C433E0
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Jan 2021 23:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8A00123A9B; Fri,  8 Jan 2021 23:22:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 2248C23A7C;
	Fri,  8 Jan 2021 23:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2248C23A7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jeremy.linton@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7031E31B;
	Fri,  8 Jan 2021 15:22:05 -0800 (PST)
Received: from mammon-tx2.austin.arm.com (mammon-tx2.austin.arm.com [10.118.28.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 60FC43F70D;
	Fri,  8 Jan 2021 15:22:05 -0800 (PST)
From: Jeremy Linton <jeremy.linton@arm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: pbrobinson@gmail.com,
	hdegoede@redhat.com,
	jwboyer@kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v2] brcm: Link rpi4's wifi with newer DMI string
Date: Fri,  8 Jan 2021 17:21:59 -0600
Message-Id: <20210108232159.1725540-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rpi4 when booted with a full featured
firmware reports a machine id from SMBIOS/DMI.
Since that is used to select the firmware we
need to add a new symlink.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index cbde48d..abda387 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2711,6 +2711,7 @@ File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
 File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
 Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
 File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
+Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
 File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
 File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
 
-- 
2.26.2

