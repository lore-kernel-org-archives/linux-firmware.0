Return-Path: <SRS0=Pkw9=GL=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A80AC433DB
	for <linux-firmware@archiver.kernel.org>; Fri,  8 Jan 2021 10:00:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0A702236FB; Fri,  8 Jan 2021 10:00:43 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71FF12368A;
	Fri,  8 Jan 2021 10:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71FF12368A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-wr1-f46.google.com with SMTP id d26so8357672wrb.12;
        Fri, 08 Jan 2021 02:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s8Z1LEKaD6ThRm7hzdAjceSm1n6WS8eCyyYajYIdV+0=;
        b=GvcBAzZvBApG7pCeuyStSjYa6tE6B1JtdKqeVGaCGCjCwRCpS4Gu9RGm6tci7Ut2Ny
         hUH0C6rxjORMBpF+BypgsUSsKQ30NR3EoXGP3x8BsRSbdHV3JGKmJd260FYSRiymgHlI
         Eot7vXs+7GZmlA6Iwv/+k4csGcaqDNYkIIRpfVHphPN8+RtmzhCfLfgHRDa1fHx4NYZ1
         GMIfVL1sexnQI3J/rsH3fkQr8ZycUIoYvJ1Xb1uXtaMnB5h8NwUguElu4tQJ6b2rgCcd
         4pkXlxv9jC/itp/Itkovh3fKJ0sNPfPCLsbLxc3OtpjVMGUlomacIQVz/tAPzHVbVT2M
         Nw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s8Z1LEKaD6ThRm7hzdAjceSm1n6WS8eCyyYajYIdV+0=;
        b=lX+Y1YZaNon31GE37LtSycjhQHvXAcYRVqA0jLKhIeJ0rNpPX9qVsofAHhP4h26V4j
         U8Yq6OGIlQSVy4AmkwAgBgTM8vf4tEBT+z+pg2nSadcKxEFJmhYfSLAPodaE92ZroS2X
         DMMHJRiDdcEUWr7zcgg/KgFpnWCnVE0N/jbMs1uFp6wf0CohTXMGqCigAAp3tcmiXphi
         TpikmKm7gaEhP3zu6fTDYLTjy9ghUxDzwrE6wjBBy3/co3f+cr4+8mnyZcY6omYZCiPg
         T6WowZ7yecVkrAU1vqPSw19+k/xTJ2RmPk9Ik5leAGHCMLycJzykfUrwQICkVLxe0aHC
         i3gQ==
X-Gm-Message-State: AOAM533TEpRhbq36Uwd2xdNvUonRicxaZvFpOCMzOU96OMBGhZJi6rMV
	z/mqogkg00u506eLt7yH0xHjzw04Gtw=
X-Google-Smtp-Source: ABdhPJysbA/6/SRMHQHUP0GYY9xG8CPVUgxjyBFjGeIAedr83qn66ub7uRSYc6D5OPv52N5cekfYMw==
X-Received: by 2002:a5d:6983:: with SMTP id g3mr2870167wru.168.1610100040692;
        Fri, 08 Jan 2021 02:00:40 -0800 (PST)
Received: from morpheus.roving-it.com.com (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
        by smtp.googlemail.com with ESMTPSA id i18sm12938184wrp.74.2021.01.08.02.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 02:00:39 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH] brcm: Update Raspberry Pi 3B+/4B NVRAM for downstream changes
Date: Fri,  8 Jan 2021 10:00:29 +0000
Message-Id: <20210108100029.715329-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi Foundation NVRAM files have been updated for a new
BT/WiFi coexistence parameter for firmwares newer than 177, now
we have new firmwares (7.45.221) from Cypress for the BCM43455
update the NVRAM for these parameters.

Update the RPi4B NVRAM boardflags3 parameter to match too, which
also happens to be what we already have for the RPi3B+.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>
---
 brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt | 1 +
 brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt      | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt b/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
index ba94f54..e8d6b19 100644
--- a/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
+++ b/brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
@@ -13,6 +13,7 @@ boardtype=0x6e4
 btc_mode=1
 btc_params1=0x7530
 btc_params8=0x4e20
+btc_params50=0x972c
 cbfilttype=1
 cckPwrIdxCorr=3
 cckTssiDelay=150
diff --git a/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt b/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
index 425d293..d5bd530 100644
--- a/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
+++ b/brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
@@ -7,12 +7,13 @@ aa5g=1
 AvVmid_c0=1,165,2,100,2,100,2,100,2,100
 boardflags=0x00480201
 boardflags2=0x40800000
-boardflags3=0x44200100
+boardflags3=0x48200100
 boardrev=0x1304
 boardtype=0x6e4
 btc_mode=1
 btc_params1=0x7530
 btc_params8=0x4e20
+btc_params50=0x972c
 cbfilttype=1
 cckPwrIdxCorr=3
 cckTssiDelay=150
-- 
2.29.2

