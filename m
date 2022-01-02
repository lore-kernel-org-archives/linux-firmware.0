Return-Path: <SRS0=KIkc=RS=gmail.com=vijaikumar.kanagarajan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5045BC433F5
	for <linux-firmware@archiver.kernel.org>; Sun,  2 Jan 2022 18:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00349C36AEE; Sun,  2 Jan 2022 18:10:34 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 632FAC36AE7
	for <linux-firmware@kernel.org>; Sun,  2 Jan 2022 18:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 632FAC36AE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id w24so23498692ply.12
        for <linux-firmware@kernel.org>; Sun, 02 Jan 2022 10:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uc3GPIEPw97r08t47zS8HTg1r9WV9kH1iRDBYA0nyEE=;
        b=UfUUcDEgFK0gfBCt8Bzy4XIcq80FkugSreDhwtXbP58tCD9K5eTPUZarnzxFChaAOh
         paQ6TWKPk/t34rbPBJSmH9Pa0nPmajGfDgIPyGoGJooELAMEsgfCUzmMw+PLbQuHqZgG
         rggcSHJ8XyyA+uCiLznXMxgNiD1BCkzjuIythK3JWltWynhny7/S6rTZw+9t9qCo7RxV
         4XlhKHrPaTjEDL8qCd/joU7R1bemGMQn66zL8+yJ34iIazIHCC2SSCK5HLHZez4GL++B
         jyTCpmLKhKYdsHT7NR6qHhuLYq/iLiaWSd79lniBEcHSVzAsIDB2S0o87rmZ07D8zXtQ
         Y4sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uc3GPIEPw97r08t47zS8HTg1r9WV9kH1iRDBYA0nyEE=;
        b=GxXBb/Tx+xy8hkRZAmLADgOpr7x6HaBX/xQ2I8MClIYBZbgN4Q/3lKZO0sPgrdTc4b
         w3zfv3DVtQOJooZevHAQw4kpEujbOFBVwznZia9yAsqRI3wdLZTho59dF+VK/YBJ//ed
         q/lDuii/v7Z60Py7cfD5Hs51btVE5NuoCmZv0bmDb6KJSf7WmwIPtt4dHDgDNU5Hp73C
         XTmB+gyXQCVWjB26WeXdvFdoZozTCL1/LIz4O6IZmcI65I2i5AXAnMmRyvKh8gMU8Hvb
         0MwfaTpN5OeDbyj5SEKlVE7xf0sypng0YQbpn1YFroEDJtkbRBzKKeSCbainITc4Q1rj
         tb4Q==
X-Gm-Message-State: AOAM530pc+QDCISWDU3MjPNpolYudanuBxce4TQFf60RT/zQxXlNWsWX
	fSLaG+7vtrdGFfHk3/eF0FRdYb9f+NhpUQ==
X-Google-Smtp-Source: ABdhPJx32NJGGagguGLlZbE/zs3na7XTpd3/eu/J613orjORAGpHkIaEnelHgUe801vgsVXJCFQEaQ==
X-Received: by 2002:a17:90b:1c86:: with SMTP id oo6mr51465957pjb.165.1641147032646;
        Sun, 02 Jan 2022 10:10:32 -0800 (PST)
Received: from localhost.localdomain ([117.201.31.24])
        by smtp.gmail.com with ESMTPSA id v70sm29308564pgd.91.2022.01.02.10.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 10:10:32 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH] WHENCE: add missing symlink for NanoPi R1
Date: Sun,  2 Jan 2022 13:10:25 -0500
Message-Id: <20220102181025.95291-1-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NanoPi R1 uses the AP6212 Wi-Fi module.

Fixes the below error.

[   20.462895] brcmfmac mmc0:0001:1: firmware: direct-loading firmware
brcm/brcmfmac43430-sdio.bin
[   20.491441] brcmfmac mmc0:0001:1: firmware: failed to load
brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt (-2)
[   20.511459] brcmfmac mmc0:0001:1: Direct firmware load for
brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt failed with error -2
[   20.650227] brcmfmac mmc0:0001:1: firmware: failed to load
brcm/brcmfmac43430-sdio.txt (-2)
[   20.658804] brcmfmac mmc0:0001:1: Direct firmware load for
brcm/brcmfmac43430-sdio.txt failed with error -2

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index 8657d80..93f388a 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2883,6 +2883,7 @@ Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-plus.txt -> brcmfmac43430-sdio.AP6
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.txt
+Link: brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt -> brcmfmac43430-sdio.AP6212.txt
 File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
 File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
-- 
2.30.2

