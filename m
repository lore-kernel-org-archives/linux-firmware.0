Return-Path: <SRS0=uw+e=WV=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E461AC433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Jun 2022 12:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE74DC3411B; Tue, 14 Jun 2022 12:53:27 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 38BAAC3411D;
	Tue, 14 Jun 2022 12:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 38BAAC3411D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id z9so4598953wmf.3;
        Tue, 14 Jun 2022 05:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kL8FjuMAKtYQM+QYc5zgGhVSUF4h0ohITXduW9DR2II=;
        b=d84sSGcCqPLQM57KDb7nzoASq1YBrzNX59YxCgUOVO7g6aAM9qNlt1arI8duPpA/PX
         F5tjSG9BnVNTGMaATH1l2oloIp9bue/l3se07X1B/dqjbk6ELh3YwggMwuersOBj2Rue
         UJGkWWbiZvEhNNwnxBJMZytXoc5lmdOP2MBmXKiQUdgWynrf6c9mSooJ5Ai8wS+Jo5Rj
         MPjyYbkh4HQnxnnFsg8sOTcGcDUOP8sGRHBGfxk4b0Sd1xttWMexTpyytKy9enV/X8Q3
         REaBSeZju9/zpevuOzuS9xOLOt+24ZripPztatr+aAw38vWuGO1SN3UWAzxGUSNWyjbQ
         zGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kL8FjuMAKtYQM+QYc5zgGhVSUF4h0ohITXduW9DR2II=;
        b=OW6LnLljEAtH59QbrP2CDqWZOpcerE4gm4eXvwDTU/kxBepXe8BbFeHUsSnvpVI+Jo
         w21Kp4HK7jA1KdMGcszd9eJqb60wuvlRx4sWfyjPt8zTT8I2Us6k3qHlMVSFOZoYVWKp
         H4iP8WcYRYZcTMj14zni3ah3/6TVt6XPTA/Xmch6m+V+RH1n9JVvHPTVo/nEA2qc2CN/
         TpQlG9HA+J+3ut5K3VDBlVr4yW/g/P/geWU2MxCZ9FsZI+Zf8kXi4Kp4iRmkalfM/Xgg
         NP3kDghQhYeCX7Elhg0hPUpKB2lyySTuK1+GYdca30pd7/B9m9NG7vf2oGjUhFUtPaoI
         +zfw==
X-Gm-Message-State: AOAM532NiNAMgILuTmGV6tEXqzA69RWBzVvkDdbTczgkfB9ROsqaV12Y
	9FrMugaVI3at6Fa2KswyP4epjSQRj80=
X-Google-Smtp-Source: ABdhPJxB9pnZyAK444I4r3WezYq55jWld9bEjnr05rXQprpfDZESyT60OIRcF3YcmExHV/M9XIG8qA==
X-Received: by 2002:a7b:c2aa:0:b0:39c:9039:e74b with SMTP id c10-20020a7bc2aa000000b0039c9039e74bmr4001914wmk.127.1655211205605;
        Tue, 14 Jun 2022 05:53:25 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id g16-20020a05600c4ed000b0039c5497deccsm3790002wmq.1.2022.06.14.05.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 05:53:25 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 2/2] Link some devices that ship with the AW-CM256SM
Date: Tue, 14 Jun 2022 13:53:21 +0100
Message-Id: <20220614125321.3949094-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220614125321.3949094-1-pbrobinson@gmail.com>
References: <20220614125321.3949094-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We know the BeagleBoneAI, Pine64 PinePhone Pro and Pine64 Quartz64
Model B all ship with a AW-CM256SM so link their known names so
the WiFi NVRAM is available to those devices.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 WHENCE | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/WHENCE b/WHENCE
index 084af41..098ac68 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2964,6 +2964,9 @@ Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6
 Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
 File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt
+Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinebook-pro.txt
+Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,quartz64-b.txt
 
 Licence: GPLv2. See GPL-2 for details.
 
-- 
2.36.1

