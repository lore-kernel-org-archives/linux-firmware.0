Return-Path: <SRS0=CB0d=WO=canonical.com=dimitri.ledkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C3FC433EF
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Jun 2022 16:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BFCCC34114; Tue,  7 Jun 2022 16:56:58 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 301E0C385A5
	for <linux-firmware@kernel.org>; Tue,  7 Jun 2022 16:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 301E0C385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 94F0F3F4BF
	for <linux-firmware@kernel.org>; Tue,  7 Jun 2022 16:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1654621007;
	bh=w9asna/9/x3dZ5SacKbQuT6j8jr9bI/1PkpATuroqdI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=HU+QhtzjVumIF11OwDEqv7y5hHP+c4qiVNDIkh/2myJx2R1VsWl+rsCsbGu8JliBC
	 GKwnUsBDP4kjEyFtbBnRX1XWYE/QgwJhzXlynkCPv6cTfTLNMt0ErxtZNGJ7ODoWCu
	 3IKuQ9h149eZQvaAGysCmqu6pBbuFvQyONDBYKboDKIDOVQr9/vPnuUmehHIpGCN6k
	 CED7KYykiJdHvvJ4ec800n+e2luZqNhTgbj8n6+qyTscPH4s/LKswThJvHO1dRP+F4
	 CWoi0y8+g3RZnnsEYrJYB38J1NBiSDolKEC3TmZrkdMag7EGuUGM4i9pwk3gsmTe4g
	 21AmFZAdzmS4g==
Received: by mail-wm1-f71.google.com with SMTP id c125-20020a1c3583000000b003978decffedso13005824wma.5
        for <linux-firmware@kernel.org>; Tue, 07 Jun 2022 09:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w9asna/9/x3dZ5SacKbQuT6j8jr9bI/1PkpATuroqdI=;
        b=cARj0yDYROFDxPVcMfRDbtFwiTQ8cScFSowkzrSY/YSETTTKBmD3pirLXAFP1WumLF
         OUBEx1UOQXv9t6nOKtpq9XGPrdOdsjGUXGWbHHaJoZ0ss1qY/VpxijTr665YInJpxv7k
         T4LCzufcuTtDkSM/diUwqkBFcnRvNAC9lDtTexoPGh6s7el0AUcqMPtPTYGbJSJoozp3
         phcJoy91SU+7VxLRghE2a5JUPtcuHvdfl8FCWYcJL5qlJ9MBHvfg2M4jkkktuOF8aXjO
         Eb1k+xdU3sCP36PG32sI7pLE9gtS+oUaRHrXqH/qSg+h+p3tkkQzR8YkQtn9I8qeijeC
         4Mjg==
X-Gm-Message-State: AOAM533XB6Y38czIxWEtofuGaowyvuDO6M5A0Agq9kJqQmJA41xOXdLz
	pmCFBgAs+wU53Y9vWWg75O+RuAMS+WStmSLZ23PGrdPDlXzYpAznQTz/IRlMpe018q4ML7XoH5x
	uo5xHpHb2bIEd6J+g/SCYXXiX6ygLd66hMNDYKA==
X-Received: by 2002:adf:f14b:0:b0:213:b98e:c0df with SMTP id y11-20020adff14b000000b00213b98ec0dfmr24480956wro.79.1654621006905;
        Tue, 07 Jun 2022 09:56:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOSjLWBe/YpktX00kIIK6rK13A+B0DsPq3BQTjfNhsYKyEsKFYMUxrRk0jrpAX1b63FtcJeg==
X-Received: by 2002:adf:f14b:0:b0:213:b98e:c0df with SMTP id y11-20020adff14b000000b00213b98ec0dfmr24480929wro.79.1654621006663;
        Tue, 07 Jun 2022 09:56:46 -0700 (PDT)
Received: from localhost ([2a01:4b00:85fd:d700:1a2e:5bbf:d277:c925])
        by smtp.gmail.com with ESMTPSA id bg16-20020a05600c3c9000b0039763d41a48sm22148887wmb.25.2022.06.07.09.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 09:56:46 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.renner.berthing@canonical.com
Subject: [PATCH] WHENCE: add symlinks for StarFive based boards
Date: Tue,  7 Jun 2022 17:56:41 +0100
Message-Id: <20220607165641.104182-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

StarFive VisionFive v1, BeagleV Starlight & Starlight r0 boards use
AP6212 Wi-Fi module.

BugLink: https://bugs.launchpad.net/bugs/1977872

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 WHENCE | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/WHENCE b/WHENCE
index f634c12a2f..0841afa1ab 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2908,6 +2908,9 @@ Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt -> brcmfmac43430-sdio.AP6212.txt
+Link: brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt -> brcmfmac43430-sdio.AP6212.txt
+Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100.txt -> brcmfmac43430-sdio.AP6212.txt
+Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-r0.txt -> brcmfmac43430-sdio.AP6212.txt
 File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
 File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
-- 
2.32.0

