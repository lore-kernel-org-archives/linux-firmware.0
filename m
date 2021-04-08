Return-Path: <SRS0=uX9G=JF=arm.com=jeremy.linton@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E980C433B4
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Apr 2021 03:26:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6B52D61184; Thu,  8 Apr 2021 03:26:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 01A9461181;
	Thu,  8 Apr 2021 03:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01A9461181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jeremy.linton@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 346CA1063;
	Wed,  7 Apr 2021 20:26:12 -0700 (PDT)
Received: from u200856.usa.arm.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1E7B3F792;
	Wed,  7 Apr 2021 20:26:11 -0700 (PDT)
From: jlinton <jeremy.linton@arm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Jeremy Linton <jeremy.linton@arm.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Josh Boyer <jwboyer@kernel.org>
Subject: [PATCH] brcm: Link CM4's WiFi firmware with DMI machine name.
Date: Wed,  7 Apr 2021 22:25:54 -0500
Message-Id: <20210408032554.5836-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Linton <jeremy.linton@arm.com>

The kernel when booted in ACPI mode with SMBIOS/DMI
data uses the DMI data to set the machine
manufacture/model.

The WiFi driver uses the machine string to select the
correct firmware image. Because of this, an additional
link to select the correct firmware is needed.

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Cc: Josh Boyer <jwboyer@kernel.org>
Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index aa96404..1eaee0b 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2723,6 +2723,7 @@ File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
 Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
 File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
 Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
 File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
 File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
 File: brcm/brcmfmac4356-sdio.vamrs,rock960.txt
-- 
2.29.2

