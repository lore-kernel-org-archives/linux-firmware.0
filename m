Return-Path: <SRS0=1/HE=WP=canonical.com=dimitri.ledkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3174C43334
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Jun 2022 13:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88590C3411D; Wed,  8 Jun 2022 13:35:15 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39A7AC34116
	for <linux-firmware@kernel.org>; Wed,  8 Jun 2022 13:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39A7AC34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 24C513F0EC
	for <linux-firmware@kernel.org>; Wed,  8 Jun 2022 13:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1654695312;
	bh=16X09g6yyyydabMFH/jYkyfc3P8Z/FcgkVhO+TyodK8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=qSdB3fNkzbXI7YQqUg9YnSO9eUcFVNkmm+fALlFBxugmADkQyhscvUD8BtYJqhx2A
	 9FtADZTVYogJ3iWduh9Ut50SIEdUnibgW1ZshVBaZMiGM9H09m3V9qJmxi0K227ov+
	 awLW9V1jqDoEOBWNyS7wE+ArqNUlLJ3zMFdVfJk/ExhRlg2rw6Ki+0ZHj9Yudk1ngb
	 z5GeVw2w861ZqrGjM8AoyVqapJyKIDdiiEOHPTm+3M3sPA9B/f+yELqHjNzPIwnJ8o
	 W12qmaCmfwTFWUO0fwy/I/y5WOavzj5511kPJdhe2UP2xfBUsjxrTDqWzRiQo704HU
	 4MwZZvuXGYW4A==
Received: by mail-wm1-f69.google.com with SMTP id u12-20020a05600c19cc00b0038ec265155fso14422646wmq.6
        for <linux-firmware@kernel.org>; Wed, 08 Jun 2022 06:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=16X09g6yyyydabMFH/jYkyfc3P8Z/FcgkVhO+TyodK8=;
        b=vvIBilgWOlfl5iowgulW+BqyInAxqUcLbssX5gtIzxpDpShFxKLJ5/AoLiPDmm8VMY
         8Q59N9uurx5E/RMhAiEc4uW9ztYxZ965NwEChR4bJd+BlvEt84psSXB/hxagmE30V7mx
         C+t7KrwGbWgBiHhfyoILCb/iTvrt/np8ywxKlDHHKCGXiCX7AgoI3Uj2M5WAl2Ce3+BQ
         7Q61TMIbT21jbsfGJ7UtBTFnrr6/Ds4MNw2v/+QE05O2BQrlxO4FjGjjVZ4RQTu3KCpy
         DFuem4mDb3JxGoAhGVKQ2skaIeJlOW9EC0uC/za+gZC4hKAcIxsh5Hq/SnuWsc89X1xx
         7ruQ==
X-Gm-Message-State: AOAM533Fh+R8f+9m+8ZBkfjB+rHu3wwe3pZSwE5xB+QKDTif/TMvkYib
	3/O+PelCN5XJ4NB8BnBgbRBvz2Cf9tdlCJAAW2XxRKYELvgO2noechLVvk3NmBAHnQXg2hqyADq
	XgP1LSZxA3eg0EzL8zBZdiZR8zMk/m1Gk61a1yg==
X-Received: by 2002:a05:6000:1446:b0:218:5a5d:6cb5 with SMTP id v6-20020a056000144600b002185a5d6cb5mr5141270wrx.629.1654694600652;
        Wed, 08 Jun 2022 06:23:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4hY8+2NfxRwZGj0rGNREpVyic4ctGB6GVkM4JGJnNwq6gxcioyD0sQ0plz+IXdDXhaU4zKQ==
X-Received: by 2002:a05:6000:1446:b0:218:5a5d:6cb5 with SMTP id v6-20020a056000144600b002185a5d6cb5mr5141253wrx.629.1654694600453;
        Wed, 08 Jun 2022 06:23:20 -0700 (PDT)
Received: from localhost ([2a01:4b00:85fd:d700:a401:d8c8:f814:ca15])
        by smtp.gmail.com with ESMTPSA id o14-20020a05600c378e00b003974d0d981dsm26540628wmr.35.2022.06.08.06.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 06:23:19 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.renner.berthing@canonical.com
Subject: [PATCH v2] WHENCE: add symlinks for StarFive based boards
Date: Wed,  8 Jun 2022 14:23:16 +0100
Message-Id: <20220608132316.178115-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

StarFive VisionFive v1, BeagleV Starlight a1 & r0 boards use AP6212
Wi-Fi module.

BugLink: https://bugs.launchpad.net/bugs/1977872

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---

 Changes since v1:
 - correct the name of the a1 board

 WHENCE | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/WHENCE b/WHENCE
index f634c12a2f..828eeeef2c 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2908,6 +2908,9 @@ Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt -> brcmfmac43430-sdio.AP6212.txt
+Link: brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt -> brcmfmac43430-sdio.AP6212.txt
+Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt -> brcmfmac43430-sdio.AP6212.txt
+Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-r0.txt -> brcmfmac43430-sdio.AP6212.txt
 File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
 File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
-- 
2.32.0

