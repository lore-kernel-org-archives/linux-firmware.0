Return-Path: <SRS0=m7AD=GI=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98C5FC433DB
	for <linux-firmware@archiver.kernel.org>; Tue,  5 Jan 2021 16:05:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 73C8522C9E; Tue,  5 Jan 2021 16:05:04 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04AE522C9D;
	Tue,  5 Jan 2021 16:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04AE522C9D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-wm1-f45.google.com with SMTP id n16so1719464wmc.0;
        Tue, 05 Jan 2021 08:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NeG/llOXwHMLQA3NhCWzThHEDH+7y0fvfLtYbLAgaBc=;
        b=p4z4k7TAyRh+gs7wo8LupwZmDOXgv1T1+flxeLvwaOQc+HfFL2dMa4gCcD+SUHSvA8
         eGURTRkes1MxNkGsCiYUwPQ6t/bZq6Kxwo4nGaAhLF3qyfJWQf7Qobr5u3+v8sdhCPqQ
         jt5LEMHnFQDFIBsv6XC1YQeXulgTlanmraDFb0sJR4geLifDQ3j3AksF3fIYEN5gvOci
         OFO4bbZDMT4FNYFBxrPKtrSsAj33yX074Yrn4ijnuY35vZNsH1C4t1RwL2CZiLPLLlEE
         7OYVg68O0ybZoHQvrqfAsKwNdNyM6oikBuSCx/V+grAPVFBeyx62lWwv29Exbx2eOiMq
         iBOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NeG/llOXwHMLQA3NhCWzThHEDH+7y0fvfLtYbLAgaBc=;
        b=LYTYeZspbOkIWxoR+72Q6h4TMc5lh9QzSfADie7wTOxFrVxQUSZt7CmSaJnNutEsoX
         1YepDa4VntyC6afn/7C2F5FRRpcFGtd/Ti+4z8GslGSEDbaG6hzbpjbI9Rij3UEfZ9fo
         WAgXW/REvsaxxTIKpCLidpQdONldn4p1GbWh4ZGkpzLs5SbMPb58uAehkb0lJar9ua1W
         CUYnoIidLCko0XzHxRlL64HGa00Uwwr2B0fJChjbSPJKS8owHcbsGpHNrvoiQS2GssDP
         VU5/5OAs8tgqX0mHc96R3SnU0I50uma+fAGAOZ8QnbVoFK8Ce91MugVqVeEk2SgLKfvj
         1+gg==
X-Gm-Message-State: AOAM533+9qvTm9J6KhZdd2DdbQOzCW5/lh4vzNqw6Jb/3mBQoG+WJgN6
	qIwQ8ImRWvrBvcyjw/W7TyneQGM0250=
X-Google-Smtp-Source: ABdhPJzgkuWotYVmJHyMOBjwwRIpjAi2bhqQnT0fpyT/Ftyu52Mcet77A9LSFlnrOIxNKqS3lQD5nA==
X-Received: by 2002:a1c:8d:: with SMTP id 135mr4081364wma.177.1609862702549;
        Tue, 05 Jan 2021 08:05:02 -0800 (PST)
Received: from morpheus.roving-it.com.com (f.c.9.1.f.e.c.d.1.e.0.0.2.b.5.5.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:55b2:e1:dcef:19cf])
        by smtp.googlemail.com with ESMTPSA id o3sm234758wrc.93.2021.01.05.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 08:05:01 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Chi-Hsien Lin <chi-hsien.lin@cypress.com>
Subject: [PATCH 2/2] cyprus: Link the new cyprus firmware to the old brcm files
Date: Tue,  5 Jan 2021 16:04:42 +0000
Message-Id: <20210105160443.156995-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By linking the new firmware to the old file it allows exisiting
kernels to make use of the new firmware and make use of the
newer firmware with all the associated fixes.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Chi-Hsien Lin <chi-hsien.lin@cypress.com>
---
 WHENCE | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/WHENCE b/WHENCE
index 1bd5085..354d52a 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2651,26 +2651,47 @@ Licence: Redistributable. See LICENCE.broadcom_bcm43xx for details.
 
 File: brcm/brcmfmac4373.bin
 File: cypress/cyfmac43012-sdio.bin
+Link: cypress/cyfmac43012-sdio.bin -> ../brcm/brcmfmac43012-sdio.bin
 File: cypress/cyfmac43012-sdio.clm_blob
+Link: cypress/cyfmac43012-sdio.clm_blob -> ../brcm/brcmfmac43012-sdio.clm_blob
 File: cypress/cyfmac43340-sdio.bin
+Link: cypress/cyfmac43340-sdio.bin -> ../brcm/brcmfmac43340-sdio.bin
 File: cypress/cyfmac43362-sdio.bin
+Link: cypress/cyfmac43362-sdio.bin -> ../brcm/brcmfmac43362-sdio.bin
 File: cypress/cyfmac4339-sdio.bin
+Link: cypress/cyfmac4339-sdio.bin -> ../brcm/brcmfmac4339-sdio.bin
 File: cypress/cyfmac43430-sdio.bin
+Link: cypress/cyfmac43430-sdio.bin -> ../brcm/brcmfmac43430-sdio.bin
 File: cypress/cyfmac43430-sdio.clm_blob
+Link: cypress/cyfmac43430-sdio.clm_blob -> ../brcm/brcmfmac43430-sdio.clm_blob
 File: cypress/cyfmac43455-sdio.bin
+Link: cypress/cyfmac43455-sdio.bin -> ../brcm/brcmfmac43455-sdio.bin
 File: cypress/cyfmac43455-sdio.clm_blob
+Link: cypress/cyfmac43455-sdio.clm_blob -> ../brcm/brcmfmac43455-sdio.clm_blob
 File: cypress/cyfmac4354-sdio.bin
+Link: cypress/cyfmac4354-sdio.bin -> ../brcm/brcmfmac4354-sdio.bin
 File: cypress/cyfmac4354-sdio.clm_blob
+Link: cypress/cyfmac4354-sdio.clm_blob -> ../brcm/brcmfmac4354-sdio.clm_blob
 File: cypress/cyfmac4356-pcie.bin
+Link: cypress/cyfmac4356-pcie.bin -> ../brcm/brcmfmac4356-pcie.bin
 File: cypress/cyfmac4356-pcie.clm_blob
+Link: cypress/cyfmac4356-pcie.clm_blob -> ../brcm/brcmfmac4356-pcie.clm_blob
 File: cypress/cyfmac4356-sdio.bin
+Link: cypress/cyfmac4356-sdio.bin -> ../brcm/brcmfmac4356-sdio.bin
 File: cypress/cyfmac4356-sdio.clm_blob
+Link: cypress/cyfmac4356-sdio.clm_blob -> ../brcm/brcmfmac4356-sdio.clm_blob
 File: cypress/cyfmac43570-pcie.bin
+Link: cypress/cyfmac43570-pcie.bin -> ../brcm/brcmfmac43570-pcie.bin
 File: cypress/cyfmac43570-pcie.clm_blob
+Link: cypress/cyfmac43570-pcie.clm_blob -> ../brcm/brcmfmac43570-pcie.clm_blob
 File: cypress/cyfmac4373-sdio.bin
+Link: cypress/cyfmac4373-sdio.bin -> ../brcm/brcmfmac4373-sdio.bin
 File: cypress/cyfmac4373-sdio.clm_blob
+Link: cypress/cyfmac4373-sdio.clm_blob -> ../brcm/brcmfmac4373-sdio.clm_blob
 File: cypress/cyfmac54591-pcie.bin
+Link: cypress/cyfmac54591-pcie.bin -> ../brcm/brcmfmac54591-pcie.bin
 File: cypress/cyfmac54591-pcie.clm_blob
+Link: cypress/cyfmac54591-pcie.clm_blob -> ../brcm/brcmfmac54591-pcie.clm_blob
 
 Licence: Redistributable. See LICENCE.cypress for details.
 
-- 
2.29.2

