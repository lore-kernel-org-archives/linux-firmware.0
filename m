Return-Path: <SRS0=6woB=XO=heitbaum.com=rudi@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265EEC433EF
	for <linux-firmware@archiver.kernel.org>; Sat,  9 Jul 2022 04:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BFBBAC3411E; Sat,  9 Jul 2022 04:33:49 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EBE7C341CB
	for <linux-firmware@kernel.org>; Sat,  9 Jul 2022 04:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4EBE7C341CB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=heitbaum.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
Received: by mail-pl1-f172.google.com with SMTP id c13so381670pla.6
        for <linux-firmware@kernel.org>; Fri, 08 Jul 2022 21:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=heitbaum.com; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=7vNWhzXZbc52zKZc0KcUusi3HFDhayGA1tE5LVUS0T8=;
        b=RYmXRHQCRhwABNYywGxR0pmk5Y6/y+WzDtZap5n0OGwjlZhTszX2Pq2mSDxT6uHtBB
         T71YioWsVAo2jItwyU7HjNnsJRV9Kol/81fd1c+8cehxSX22/DT/nHMh+76oBdBxe7uH
         hLI7rpfm+K0eDDQeEJ2Gu+wEnPaKnS91i9i80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7vNWhzXZbc52zKZc0KcUusi3HFDhayGA1tE5LVUS0T8=;
        b=fFIX+GLZNyR2a/0UpDFjI4/y4pULq3aQc9xiQf1F9fnaJfsgWzJQJnZUh1iDG0ALgu
         U1GeSTXNrNuSMugd+m6nlc4lo3s0ZtNXH/KGotMbgY3vhect9OC5tcgZGthkS4DjJDOY
         lNiCphof6BA4ixEAOH6DHSubPQg4N8ARoCR/hJ6zu/TeWNTssD2iaJUdEgK0VbgwRY58
         8v6b5R0lUbMPlKRx60kLyFXgRdK981GhRYlYfysoGMj/o3YoATu2rnC+RzKF+SliSbHT
         n+x+Y+fOyu+84vL69uuI0ix2FlfUPhGH1cyjzD9V0P6nrGPbV634Z1vkAPSa7FA41+7V
         Mcaw==
X-Gm-Message-State: AJIora9k//KKzMepYiCSaj9u6VED66JWtNq5t0/82RlZ6WNst+B0w/NA
	7DmaWbTjxpW4y52StFvPij5M7mOOgbQ1XA3e
X-Google-Smtp-Source: AGRyM1vCPrhpJpITpJhI4m20QQ/zmkVcNIh9qR6HyblE/QCoL8iqPnEnsIlirndBykrJcQ9PWRrL7g==
X-Received: by 2002:a17:90a:9bc5:b0:1ef:8084:ada1 with SMTP id b5-20020a17090a9bc500b001ef8084ada1mr3808899pjw.172.1657341224245;
        Fri, 08 Jul 2022 21:33:44 -0700 (PDT)
Received: from 0c7a33013940 ([203.220.223.63])
        by smtp.gmail.com with ESMTPSA id n12-20020a170902e54c00b00161a9df4de8sm351547plf.145.2022.07.08.21.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 21:33:43 -0700 (PDT)
Date: Sat, 9 Jul 2022 04:33:38 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: pbrobinson@gmail.com, jwboyer@kernel.org, rudi@heitbaum.com
Subject: [PATCH] Correct WHENCE entry for AW-CM256SM firmware
Message-ID: <20220709043338.GA316680@0c7a33013940>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The check_whence script doesn't fail, but installation of the firmware
is not successful because the link is reversed.

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 WHENCE | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/WHENCE b/WHENCE
index 14f3472..545fcd7 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2820,10 +2820,10 @@ Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6
 Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
 File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
-Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt
-Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinebook-pro.txt
-Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinephone-pro.txt
-Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,quartz64-b.txt
+Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,pinephone-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.pine64,quartz64-b.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 
 Licence: GPLv2. See GPL-2 for details.
 
-- 
2.25.1

