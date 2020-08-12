Return-Path: <SRS0=6/UC=BW=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EB0C433DF
	for <linux-firmware@archiver.kernel.org>; Wed, 12 Aug 2020 14:33:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 549902078B; Wed, 12 Aug 2020 14:33:27 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0863206DA;
	Wed, 12 Aug 2020 14:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2qiMTyq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0863206DA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-wm1-f46.google.com with SMTP id g75so2158692wme.4;
        Wed, 12 Aug 2020 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vcrAPHj0GHsnGWQU6Vq58qhkJ552hyNoC0m1BtgZIto=;
        b=j2qiMTyqNtFt1zby1mRxEtbwNUUer05rsfFqbeD6Gnw7lBGkN2gW2k5d1lhZdCRsyo
         MxfWzpa9EvxUFeYDpl87tEUedNcdHzmlMWd9rNHBdZR/WVo11I4dwsnEg6tTW/BJBVxT
         KHDAdz/t089DrKkoRqlFYEm8/Rp7EabHQQyl2hvSJbJpCApy8ZExV5jei/AXxlEl+1zq
         3a89l3MrD6Pqij+v951lpenyKgzNkvO7TDbasdpHodLhd116rkR1ueyu0m6pAO3FkEJE
         qQr8vNnV74Uf6CjXKMuns2+3eblikfhFgyNgCf+o4DtZaXk7sgH3hzoZlTPnLQBeYmkw
         3ZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vcrAPHj0GHsnGWQU6Vq58qhkJ552hyNoC0m1BtgZIto=;
        b=ef/HN0z65FwHJyR8sE1WtX+YZrlKcoJLvmKQbN41xWPEobHuk2udEOiSAm1ygjZGuV
         aB7xeq1tudGn6cbBieFHyA3lEeWtKn7L24kNiC4TonAhdyoELZDnM8Z1WkgSE+cPPtFr
         CHg3V0bwUGgpZFrIq+EbSm2LJOsTKgjLo1+gLEMv6++ylQRAVk0W8zQvkt+/tu4HE/JJ
         JFWOvd7egfaMUxAPCVSO/gw2+bj1aj9+u7k1Z8EvQPrrAd+bYLkfF0JE6KHy8i2H0R2h
         dvI8mhksrJMwt4mVfKyKXQESHMbFU8W1IeMB584J/3zmDM+nDZMDhPaR0IGeV5ANpH8Y
         wVAw==
X-Gm-Message-State: AOAM530kYlMKW1cE6z8HPTXyte+pNiOWkXtn8atHpJqXrVBwau4hY4+K
	4tA3TGG/YGYPlwA7+06aY/M3wnwGjSM=
X-Google-Smtp-Source: ABdhPJybsJwJAI4SIKCI+jfWMV0v3ytMDprAksslkT/NwCWaSArXw77BPHxR9he5i851UM0tiRYFCw==
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr48617wmh.39.1597242804608;
        Wed, 12 Aug 2020 07:33:24 -0700 (PDT)
Received: from morpheus.roving-it.com.com (2.e.6.5.c.a.a.1.a.8.0.3.1.e.3.c.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:c3e1:308a:1aac:56e2])
        by smtp.googlemail.com with ESMTPSA id p14sm4883717wrg.96.2020.08.12.07.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 07:33:24 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH] brcm: Add brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt symlink
Date: Wed, 12 Aug 2020 15:33:15 +0100
Message-Id: <20200812143315.1853427-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi 3A+ uses the same WiFi module and NVRAM as the 3B+ and
Raspbian uses the same file for both models so we can symlink the 3A+ to
the 3B+ to have WiFi work on those devices too.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index be8c390..8f74167 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2624,6 +2624,7 @@ File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
 File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
 File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
+Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
 File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
 File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
 File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"
-- 
2.26.2

