Return-Path: <SRS0=iTVJ=W4=canonical.com=dimitri.ledkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490F2C433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Jun 2022 13:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A69EC341C4; Tue, 21 Jun 2022 13:49:40 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B226AC3411C
	for <linux-firmware@kernel.org>; Tue, 21 Jun 2022 13:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B226AC3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 78BD23F334
	for <linux-firmware@kernel.org>; Tue, 21 Jun 2022 13:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1655819367;
	bh=WDfXoUSih8DYHwCoB+z8yw9muq58JjoMxgpYlSzdtys=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=S+0Za231tdGDtiNZc83ru03IJxoiH/IiA6OOaxzuJirNgX2mERQo/dlZkTDBafnYL
	 Mi8T/e9841hZvf+FtfRYJ8ljHDtqUomu1cj/d0xJadNtHiceZMRlq7qsvle/Vko9Nr
	 kgS2lod6y/o2JQnVfKpt93+vAs7GpM9qxRV1VzCDWk0AXxL4wgmUmHrxh+wfLBWHUO
	 3E495b9M8rd0Rd7KUHq/pWok6AYbOnjJ1fwMorswN2sClUFzHA4Rbg3GuAuMZrPacC
	 INyPb2+6eMlstgYX76wtTbL8VgUJQKlMWWC7Vtd8e1KCckEOgNaxWDURoYiEZc2tCV
	 mpLMZPTKswecQ==
Received: by mail-wm1-f69.google.com with SMTP id k34-20020a05600c1ca200b0039c7db490c8so6433747wms.1
        for <linux-firmware@kernel.org>; Tue, 21 Jun 2022 06:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WDfXoUSih8DYHwCoB+z8yw9muq58JjoMxgpYlSzdtys=;
        b=CtdW0n5ieZGrrqvvB0VxELXgABOCpKr/9m01xL9ZVQEWoIcM3oPZaaecBrx7HSTiLp
         wgKG9x37OSuyp4gpgFxdsFcsLEaUKnXT6PVU1DnFt9w1BAp8YjRoUndvlL7/CXWUt1ZI
         FyskYBy11YDSB25YUDtXm1R7Y/Iw07zvEfaWbV38+rfifDft+Oalsk2B/VHdvtUa1q9V
         rW4M7vGoBJgY/kHBbsxEnFDljUaKWGhnFUgbofy0X8JpF+1lTF2DOfIC6ESPWJo+/WCj
         IuFghHIYFnEElrjhHqKoHdSd5L9xsiW6BjL9AicfFfvuJnWv4dINOy7vwo75lwQZtvvV
         9PiQ==
X-Gm-Message-State: AJIora/FBsZXsz0yiviWTjwspMGA7zmFKdnjty/aSuOCgP0EvXX31N0b
	3GWVhXa9wDwtW0ZKNNtXTSUH2m30TFg4NgOFhm1XuCPKexPQxxq62VHpr+RTNdR8IgU1Y+QATnd
	KyUYsITrQecI0vjDjuDSfW6vChLT7z35Yn42UwA==
X-Received: by 2002:a5d:660d:0:b0:21b:899f:5d69 with SMTP id n13-20020a5d660d000000b0021b899f5d69mr14215117wru.688.1655819365938;
        Tue, 21 Jun 2022 06:49:25 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tLXnv6tOfSIpBeZtBzruYpsF42W1FSOGJBwFokR1PP4WuEfZJxod08JPhz+qx8geLuVfjhUg==
X-Received: by 2002:a5d:660d:0:b0:21b:899f:5d69 with SMTP id n13-20020a5d660d000000b0021b899f5d69mr14215054wru.688.1655819365029;
        Tue, 21 Jun 2022 06:49:25 -0700 (PDT)
Received: from localhost ([2001:67c:1562:8007::aac:415c])
        by smtp.gmail.com with ESMTPSA id f10-20020adfe90a000000b0021b9504cc83sm3235549wrm.31.2022.06.21.06.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 06:49:24 -0700 (PDT)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.renner.berthing@canonical.com,
	drew@beagleboard.org,
	huan.feng@starfivetech.com,
	chi-hsien.lin@infineon.com,
	arend.vanspriel@broadcom.com
Subject: [PATCH] brcm: Add BCM43430A1 bluetooth firmware for StarFive boards
Date: Tue, 21 Jun 2022 14:49:09 +0100
Message-Id: <20220621134909.101137-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This firmware file was shared from StarFive in Slack. It is likely to
be covered by the Cypress licence. This firmware file is known to work
correctly on multiple versions/releases of the StarFive boards,
however it is unknown if it is the latest version of it and/or has
security vulnerabilities patched. It would be nice to get confirmation
from starfive/cypress/broadcom as to which firmware files should be
used on StarFive boards.

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 brcm/BCM43430A1.starfive,visionfive-v1.hcd | Bin 0 -> 36657 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 brcm/BCM43430A1.starfive,visionfive-v1.hcd

diff --git a/brcm/BCM43430A1.starfive,visionfive-v1.hcd b/brcm/BCM43430A1.starfive,visionfive-v1.hcd
new file mode 100644
index 0000000000000000000000000000000000000000..77ddeb8d2ac8a2b6563959c891049276d5e0acfb
GIT binary patch
literal 36657
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

literal 0
HcmV?d00001

-- 
2.32.0

