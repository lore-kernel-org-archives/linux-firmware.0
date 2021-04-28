Return-Path: <SRS0=i6i7=JZ=endlessos.org=jhp@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650CDC433B4
	for <linux-firmware@archiver.kernel.org>; Wed, 28 Apr 2021 08:37:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 187CC613DA; Wed, 28 Apr 2021 08:37:00 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8225B613B1
	for <linux-firmware@kernel.org>; Wed, 28 Apr 2021 08:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8225B613B1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=endlessos.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=jhp@endlessos.org
Received: by mail-pl1-f175.google.com with SMTP id h7so3842286plt.1
        for <linux-firmware@kernel.org>; Wed, 28 Apr 2021 01:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fjUF9BpvK4r1iz57hM3EhPDHjFmt6yk1iQHfr+k3qbM=;
        b=OvLuvuwpiN9oVC4fXH86kG3mjF1qXle7T+jN//aJrJPmJtvAtZsgd3itGUvr7V5H+z
         Q7gBgtKmYFwNRu9lVApPHSbXPD0Md2l0xKeKMS7KTzDsPmw9C4kk9+GX3jVPdGZAUJDQ
         AvFoRvJjmf5vBYK2fbgFNUTRR0XIoRA4+VjYYUPEkYMMDhRyVSRnYSu4xhAZ5nsJYUW7
         sy2qeWQxhJJP6jPAi+9yYhILRg4mBErAQyuXVKUnxBqVTSDU99g78cjh5iyQCX9yzni2
         mPlLZv3nSANzvNYqKpP+tdJAUWKkQVhP6mEzNlBOEShDF/FIvOOefM1dY628B3nN9XPP
         AQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fjUF9BpvK4r1iz57hM3EhPDHjFmt6yk1iQHfr+k3qbM=;
        b=A4Mde4k988hGCZJu1FJOs0/eIuim1SgJi1hBcU2Z7fWFghdr0v64zmu+YsMczA03Xo
         QgEwhDUCvtqTkApu1Ez04UYciArnNNPGc2ci0Es++Q6o48HVlnuT2dLu+DHsUaL4AQVZ
         ghbGbHQrNzRHgh7rdjn1PGFoDquwHv9SLKivZcRwZ3agRjStNvp8SJNtkcojJUZ2Xn27
         fm8cRBONR0djDQ/xct2SBE4y3yS7/a4x2WDHXuJPYbP2uzN7FeLdk8B/DasryuBUx0zZ
         hNKTpimaCX8Z8nCOuXFzGFM27/8DA4bqayjgwp2frullmZzWyWZWen7F1l4W7PwXYudb
         m2xw==
X-Gm-Message-State: AOAM533F/JSOGNbSem8DV8Ans5pFfGQbfXcjOAafgA91n1C16cshD7J6
	iVoexvNw+2TfV1tbQFLA2PC0ejXCaITq11+o3Zg09v3BSYoxTerNLwC4gWh8c49DgZbVAxG019N
	Q4Fgh/k4O3zyL/0rvyK+NuR9p1sTSTUv7g+PDIxVefvrX0XGQ46nMjaQB9aoroWZNXJrzZieVKg
	==
X-Google-Smtp-Source: ABdhPJw+pSzP+7mqH91TiZSleK8DJBgT6+VeuQSagoS0iZQRgwYUticLT6u5Zvx8pHT8CCv8f+oPMQ==
X-Received: by 2002:a17:90a:af8b:: with SMTP id w11mr31564179pjq.149.1619599018459;
        Wed, 28 Apr 2021 01:36:58 -0700 (PDT)
Received: from starnight.endlessm-sf.com (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.googlemail.com with ESMTPSA id f18sm4498493pfe.49.2021.04.28.01.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 01:36:58 -0700 (PDT)
From: Jian-Hong Pan <jhp@endlessos.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@endlessos.org,
	Jian-Hong Pan <jhp@endlessos.org>
Subject: [PATCH] brcm: Add a link to enable khadas VIM2's WiFi
Date: Wed, 28 Apr 2021 16:32:31 +0800
Message-Id: <20210428083230.8137-1-jhp@endlessos.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to kernel message on khadas VIM2 board equipped with BCM4356:

brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4356-sdio for chip BCM4356/2
usbcore: registered new interface driver brcmfmac
brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac4356-sdio.khadas,vim2.txt failed with error -2
brcmfmac mmc0:0001:1: Direct firmware load for brcm/brcmfmac4356-sdio.txt failed with error -2

System needs the NVRAM file "brcmfmac4356-sdio.khadas,vim2.txt" to enable
the WiFi. After test, found it can share with the same file
"brcmfmac4356-sdio.vamrs,rock960.txt".

This patch adds the link to brcmfmac4356-sdio.vamrs,rock960.txt for it.

Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
---
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

