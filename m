Return-Path: <SRS0=BgiW=J2=endlessos.org=jhp@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F01C43460
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Apr 2021 07:27:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 53BBA6143E; Thu, 29 Apr 2021 07:27:49 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFF2F6143D
	for <linux-firmware@kernel.org>; Thu, 29 Apr 2021 07:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFF2F6143D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=endlessos.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=jhp@endlessos.org
Received: by mail-pj1-f53.google.com with SMTP id z6-20020a17090a1706b0290155e8a752d8so2002883pjd.4
        for <linux-firmware@kernel.org>; Thu, 29 Apr 2021 00:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lG7fN/8t7j6+iLVQDFN6M3QfpChMwMgL2bDEqLa02Qg=;
        b=o60cTcFzKjZX8No9QlOUH0ywJR5DGB2ckobVxKGj1L3r3yyfwakt0O58LTrx85TMaW
         ALH1hf0SggjV3NhjAH7Rx2OVX25cLd+rmewdhEKcfD7X+aH1uquihIKdlsB06SM1jvQ+
         E7EIOPcGKx78e2lMjav+mliBO7ne05IjYkIQ02cCkNBleG2PSqrKOdtPgEXw9MohfzPG
         /08g4DLCOlEl+7kd1eIV3DivNXcZERo4zcmt4Z+ajuytA/VM0+zuIXgq2/4IusAmUtj8
         a99w+D6UTZFgkScfcqdNddLqV75Gi65qbPyG4JNHichuA5jbPR+iwuL63SiORK4wuc0g
         7LwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lG7fN/8t7j6+iLVQDFN6M3QfpChMwMgL2bDEqLa02Qg=;
        b=sRzeLC/nuJjoxEJoYNvA0jaLwL3je1HDsAqVHhJl4ojaq35dPkmRm74IBg0t6HusGV
         9dMWTv/pJLCdRgP7gZE0E32oBhVMdsgSI35aq7Ejp1X4HHegOePIqwvRykHt6KMfatz/
         VIUp8x+1Ug5GsM7bs4L4R5LuKFsCwgWutMxRB+kirv/wA3xzu/7vlntxkKx7HdasH6I/
         5ZCm3j+wm895CEphIMaWoPpQroB3CFP3tkRYN/t3wlrUmFXkCILqEc4ufXS3I5kBKIH5
         /F2r8pFibGQQ/AZRIDBLfnWfTkRzFJcaT3Rreh014PQ69MmQG6veD9HNA+v8nfYE4iD2
         bw/Q==
X-Gm-Message-State: AOAM531BE8wS9jt+8ra8vteYYCatm0FwrSavNwDguBgTF/xueyg8f2Vu
	upeNVAyy+aP0rjRm12ys7w3ESw==
X-Google-Smtp-Source: ABdhPJx4W5jNoRZhQiC9645r/h31OFGTNwljVCcUp6NkakGEw9IMReUvVm8qBOVVaZtRC9a9uoS/5Q==
X-Received: by 2002:a17:902:ec84:b029:ea:b28d:e53e with SMTP id x4-20020a170902ec84b02900eab28de53emr33378997plg.77.1619681268180;
        Thu, 29 Apr 2021 00:27:48 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.googlemail.com with ESMTPSA id m9sm1674753pgt.65.2021.04.29.00.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 00:27:47 -0700 (PDT)
From: Jian-Hong Pan <jhp@endlessos.org>
List-Id: <linux-firmware.lore.kernel.org>
To: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@endlessos.org,
	Jian-Hong Pan <jhp@endlessos.org>
Subject: [PATCH v2] brcm: Add a link to enable khadas VIM2's WiFi
Date: Thu, 29 Apr 2021 15:25:03 +0800
Message-Id: <20210429072502.4350-1-jhp@endlessos.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <c62e9f94-25fc-6791-c328-5454abc403b9@gmail.com>
References: <c62e9f94-25fc-6791-c328-5454abc403b9@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to kernel message on khadas VIM2 board equipped with BCM4356:

brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4356-sdio for chip BCM4356/2
usbcore: registered new interface driver brcmfmac
brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac4356-sdio.khadas,vim2.txt failed with error -2
brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac4356-sdio.txt failed with error -2

System needs the NVRAM file "brcmfmac4356-sdio.khadas,vim2.txt" to
enable the WiFi chip BCM4356. Found it can share with the same file
"brcmfmac4356-sdio.vamrs,rock960.txt" with a soft link as
"brcmfmac4356-sdio.khadas,vim2.txt". Both 2.4GHz and 5GHz WiFi are
enabled with the linked config.

This patch adds the link to brcmfmac4356-sdio.vamrs,rock960.txt for it.

Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
---
v2: Modified the commit description.

 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index 3c29304..5773020 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2780,6 +2780,7 @@ Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ Compute\
 File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
 File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
 File: brcm/brcmfmac4356-sdio.vamrs,rock960.txt
+Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.vamrs,rock960.txt
 
 Licence: GPLv2. See GPL-2 for details.
 
-- 
2.31.1

