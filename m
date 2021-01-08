Return-Path: <SRS0=LcvX=GL=arm.com=jeremy.linton@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35998C433E0
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Jan 2021 20:44:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 10D8123A75; Fri,  8 Jan 2021 20:44:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by mail.kernel.org (Postfix) with ESMTP id 8590523A68;
	Fri,  8 Jan 2021 20:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8590523A68
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jeremy.linton@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ADAD11063;
	Fri,  8 Jan 2021 12:44:25 -0800 (PST)
Received: from mammon-tx2.austin.arm.com (mammon-tx2.austin.arm.com [10.118.28.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A609F3F66E;
	Fri,  8 Jan 2021 12:44:25 -0800 (PST)
From: Jeremy Linton <jeremy.linton@arm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Jeremy Linton <jeremy.linton@arm.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
	Josh Boyer <jwboyer@kernel.org>
Subject: [BUG] cypress: Fix link direction
Date: Fri,  8 Jan 2021 14:44:20 -0600
Message-Id: <20210108204420.1724179-1-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It appears the link direction was incorrect resulting
in dangling symlinks. This also causes the brcm devices
to be unable to find their firmware

Fixes: 060ad8b3d505e ("cypress: Link the new cypress firmware to the old brcm files")
Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
Cc: Peter Robinson <pbrobinson@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Chi-Hsien Lin <chi-hsien.lin@cypress.com>
Cc: Josh Boyer <jwboyer@kernel.org>
---
 WHENCE | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/WHENCE b/WHENCE
index 676bb18..cbde48d 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2651,47 +2651,47 @@ Licence: Redistributable. See LICENCE.broadcom_bcm43xx for details.
 
 File: brcm/brcmfmac4373.bin
 File: cypress/cyfmac43012-sdio.bin
-Link: cypress/cyfmac43012-sdio.bin -> ../brcm/brcmfmac43012-sdio.bin
+Link: brcm/brcmfmac43012-sdio.bin -> ../cypress/cyfmac43012-sdio.bin
 File: cypress/cyfmac43012-sdio.clm_blob
-Link: cypress/cyfmac43012-sdio.clm_blob -> ../brcm/brcmfmac43012-sdio.clm_blob
+Link: brcm/brcmfmac43012-sdio.clm_blob -> ../cypress/cyfmac43012-sdio.clm_blob
 File: cypress/cyfmac43340-sdio.bin
-Link: cypress/cyfmac43340-sdio.bin -> ../brcm/brcmfmac43340-sdio.bin
+Link: brcm/brcmfmac43340-sdio.bin -> ../cypress/cyfmac43340-sdio.bin
 File: cypress/cyfmac43362-sdio.bin
-Link: cypress/cyfmac43362-sdio.bin -> ../brcm/brcmfmac43362-sdio.bin
+Link: brcm/brcmfmac43362-sdio.bin -> ../cypress/cyfmac43362-sdio.bin
 File: cypress/cyfmac4339-sdio.bin
-Link: cypress/cyfmac4339-sdio.bin -> ../brcm/brcmfmac4339-sdio.bin
+Link: brcm/brcmfmac4339-sdio.bin -> ../cypress/cyfmac4339-sdio.bin
 File: cypress/cyfmac43430-sdio.bin
-Link: cypress/cyfmac43430-sdio.bin -> ../brcm/brcmfmac43430-sdio.bin
+Link: brcm/brcmfmac43430-sdio.bin -> ../cypress/cyfmac43430-sdio.bin
 File: cypress/cyfmac43430-sdio.clm_blob
-Link: cypress/cyfmac43430-sdio.clm_blob -> ../brcm/brcmfmac43430-sdio.clm_blob
+Link: brcm/brcmfmac43430-sdio.clm_blob -> ../cypress/cyfmac43430-sdio.clm_blob
 File: cypress/cyfmac43455-sdio.bin
-Link: cypress/cyfmac43455-sdio.bin -> ../brcm/brcmfmac43455-sdio.bin
+Link: brcm/brcmfmac43455-sdio.bin -> ../cypress/cyfmac43455-sdio.bin
 File: cypress/cyfmac43455-sdio.clm_blob
-Link: cypress/cyfmac43455-sdio.clm_blob -> ../brcm/brcmfmac43455-sdio.clm_blob
+Link: brcm/brcmfmac43455-sdio.clm_blob -> ../cypress/cyfmac43455-sdio.clm_blob
 File: cypress/cyfmac4354-sdio.bin
-Link: cypress/cyfmac4354-sdio.bin -> ../brcm/brcmfmac4354-sdio.bin
+Link: brcm/brcmfmac4354-sdio.bin -> ../cypress/cyfmac4354-sdio.bin
 File: cypress/cyfmac4354-sdio.clm_blob
-Link: cypress/cyfmac4354-sdio.clm_blob -> ../brcm/brcmfmac4354-sdio.clm_blob
+Link: brcm/brcmfmac4354-sdio.clm_blob -> ../cypress/cyfmac4354-sdio.clm_blob
 File: cypress/cyfmac4356-pcie.bin
-Link: cypress/cyfmac4356-pcie.bin -> ../brcm/brcmfmac4356-pcie.bin
+Link: brcm/brcmfmac4356-pcie.bin -> ../cypress/cyfmac4356-pcie.bin
 File: cypress/cyfmac4356-pcie.clm_blob
-Link: cypress/cyfmac4356-pcie.clm_blob -> ../brcm/brcmfmac4356-pcie.clm_blob
+Link: brcm/brcmfmac4356-pcie.clm_blob -> ../cypress/cyfmac4356-pcie.clm_blob
 File: cypress/cyfmac4356-sdio.bin
-Link: cypress/cyfmac4356-sdio.bin -> ../brcm/brcmfmac4356-sdio.bin
+Link: brcm/brcmfmac4356-sdio.bin -> ../cypress/cyfmac4356-sdio.bin
 File: cypress/cyfmac4356-sdio.clm_blob
-Link: cypress/cyfmac4356-sdio.clm_blob -> ../brcm/brcmfmac4356-sdio.clm_blob
+Link: brcm/brcmfmac4356-sdio.clm_blob -> ../cypress/cyfmac4356-sdio.clm_blob
 File: cypress/cyfmac43570-pcie.bin
-Link: cypress/cyfmac43570-pcie.bin -> ../brcm/brcmfmac43570-pcie.bin
+Link: brcm/brcmfmac43570-pcie.bin -> ../cypress/cyfmac43570-pcie.bin
 File: cypress/cyfmac43570-pcie.clm_blob
-Link: cypress/cyfmac43570-pcie.clm_blob -> ../brcm/brcmfmac43570-pcie.clm_blob
+Link: brcm/brcmfmac43570-pcie.clm_blob -> ../cypress/cyfmac43570-pcie.clm_blob
 File: cypress/cyfmac4373-sdio.bin
-Link: cypress/cyfmac4373-sdio.bin -> ../brcm/brcmfmac4373-sdio.bin
+Link: brcm/brcmfmac4373-sdio.bin -> ../cypress/cyfmac4373-sdio.bin
 File: cypress/cyfmac4373-sdio.clm_blob
-Link: cypress/cyfmac4373-sdio.clm_blob -> ../brcm/brcmfmac4373-sdio.clm_blob
+Link: brcm/brcmfmac4373-sdio.clm_blob -> ../cypress/cyfmac4373-sdio.clm_blob
 File: cypress/cyfmac54591-pcie.bin
-Link: cypress/cyfmac54591-pcie.bin -> ../brcm/brcmfmac54591-pcie.bin
+Link: brcm/brcmfmac54591-pcie.bin -> ../cypress/cyfmac54591-pcie.bin
 File: cypress/cyfmac54591-pcie.clm_blob
-Link: cypress/cyfmac54591-pcie.clm_blob -> ../brcm/brcmfmac54591-pcie.clm_blob
+Link: brcm/brcmfmac54591-pcie.clm_blob -> ../cypress/cyfmac54591-pcie.clm_blob
 
 Licence: Redistributable. See LICENCE.cypress for details.
 
-- 
2.26.2

