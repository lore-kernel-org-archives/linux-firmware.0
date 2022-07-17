Return-Path: <SRS0=PCXl=XW=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E201C43334
	for <linux-firmware@archiver.kernel.org>; Sun, 17 Jul 2022 16:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55E32C341C0; Sun, 17 Jul 2022 16:07:04 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94B4EC3411E;
	Sun, 17 Jul 2022 16:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 94B4EC3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id e15so8475171wro.5;
        Sun, 17 Jul 2022 09:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LpYk20Y+e+qwUPx5b2Bwf1Oy+e4BtGKtDCbjfKP13Do=;
        b=KLkAthWBNDJDmzoDTN3kMSct7njXgoXhbh5pCmzHTnuuGv2/n2gg0MP5ULLTZZdZdT
         sYPNrIjs4RCdiR+vijL6XGaMlYiYKLEIEtYFK9iH4KtpDsrVRkBkadm5v2A8Y2NFeeSm
         8Y3FvEIXmzdzj9KxJWCSKVzfY8hNHD1zUNy0jTcO4txgTKa7nNOKyWE9MHGSqpm+yByy
         3JN/cQIATwATEjdUCgMDVPjgE3KRxD5GUKWHY8TOtrPAfSE7b29JjFzCrBYDcHs+n9/j
         zNIVISm7bggMZjYExywaMMqzoKDG9WITVLNlHyQWk6tWhzXUl93nX+hLW6ySXWY6SoAl
         NPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LpYk20Y+e+qwUPx5b2Bwf1Oy+e4BtGKtDCbjfKP13Do=;
        b=G6DmAlYXW4eH/qbYHylXPnNmu3mL/9o+TFCb4KjUpHmaHE1EpQ2OeWDEp+tMqv/JPV
         e0HJDGHujXV1EUYKqHkGb78cHLfhY3ir3+9Gy4V/QYJF1R7YdinnZxz62sMlv9h/e4SK
         VAFfiaPYqHUcgbwgASpWu1h5+ydiUWuVhY5Sk+gUFHhPER+P68k1wUB7kQSQwrigDXBQ
         MUtnp1LeS2tZAds7B2qqsYvZXAr1aol8SEIkV0tNYa8rFCnBsJ9SfXAi1RLXAJ2W9y/8
         IY2UE6KIZJCGlSnBU+RxcJ0cfzJ3rRE31e4Ggd0YWhG1EA+FPNpFyxFNYH45FJnLEqJT
         7uCQ==
X-Gm-Message-State: AJIora/oBzXTUDRd5aH3HcitgSj5CLJHbWQDrneC9ROC+RpJ2sYIoaLr
	pNPrj2OhM53a0fR8Z1Cwwuzd4BJBjHg=
X-Google-Smtp-Source: AGRyM1soCUmRHrFs6LiP9SlvfC5PaeyiQrlVGjwoPdjq0yLScEdydQQgA/HVyceITEkam1mazbhuug==
X-Received: by 2002:a5d:4f02:0:b0:21d:63f6:380c with SMTP id c2-20020a5d4f02000000b0021d63f6380cmr19823087wru.635.1658074021632;
        Sun, 17 Jul 2022 09:07:01 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id m26-20020a05600c3b1a00b003a31b79dc0esm1081948wms.1.2022.07.17.09.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 09:07:01 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] WHENCE: Fix the dangling symlinks fix
Date: Sun, 17 Jul 2022 17:06:56 +0100
Message-Id: <20220717160656.2151872-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The directories were incorrect when creating the links. Fix
them so they end up in the right location.

Fixes: dfa2931 ("WHENCE: Correct dangling symlinks")
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
---
 WHENCE | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/WHENCE b/WHENCE
index 14d0a87..545fcd7 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2820,10 +2820,10 @@ Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6
 Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
 File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
-Link: brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
-Link: brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
-Link: brcmfmac43455-sdio.pine64,pinephone-pro.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
-Link: brcmfmac43455-sdio.pine64,quartz64-b.txt -> brcm/brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 
 Licence: GPLv2. See GPL-2 for details.
 
-- 
2.37.1

