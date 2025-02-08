Return-Path: <SRS0=2cwK=U7=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEB5C02198
	for <linux-firmware@archiver.kernel.org>; Sat,  8 Feb 2025 10:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5D5CC4CEE0; Sat,  8 Feb 2025 10:30:46 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB32AC4CED6
	for <linux-firmware@kernel.org>; Sat,  8 Feb 2025 10:30:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB32AC4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5439a6179a7so3065858e87.1
        for <linux-firmware@kernel.org>; Sat, 08 Feb 2025 02:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739010643; x=1739615443; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SjkGc70VpxFfpw4l9I0t7v7E5MnKqX1qvkePlFOF5iU=;
        b=PiMbXgA3mm7abAJvnLc5hWhQU0fLSQ1MnWhxvNqSLjHNpKUtaOBwRbRdLwSDk5GlQL
         EYvOR3r+nvxH2pyAlszNeMJ7EYger8/6dCSEox/UTSzMukII5UCtMpxPhBwrEjoIWhOn
         2kH9YAxh2MhMcA1eE38fFUSk/ppkzNWdxWtGNw/nYM8sLmAPFDwUR1xx9K9Bavyx1etV
         2xlnu0cxtIF9FE9IOf2R0E9BjWAI8EUzzsTa1V6xKzgwXkURc0bPXcTSI+1saVs0Kcxt
         TlKhhRjaa8VEQigwT+xqZa6A6gS5wCL73vFa+obmnI4N9LkDjL4XptaWLKP+WcmC4JQD
         g/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739010643; x=1739615443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SjkGc70VpxFfpw4l9I0t7v7E5MnKqX1qvkePlFOF5iU=;
        b=v5guPvriJR5C2ywAbHq1UW42twYVLHBk267dpJermkNeI37AyDgWizCvMu7vAlUdMy
         z2DgyiHy62uG7AWsBleEdMrkVFQL6NuH4yFMU4VSiuQoPckl0Gj8Qip4BPBzkbTcYv2M
         DutD9xay2tAtgLq0xm/NvHGXe1sT8ae1mzKJ1ZHr1ip8MGiOS6NDjiPSeesowlm2Kmiq
         8zD3rlldlLhzmIrg9a+g68hqwhTgXBGPkwCh2tcRpd29bJXWBlvzllLdH6FWjCoEdRdM
         8/fsIGbAl3Pbu7gKf/TkgkJfGUb/d/jaOWPqxKP9/KPdHR8Xs1Gfz+8ynkLeaTRxcZHf
         TTOQ==
X-Gm-Message-State: AOJu0Yxp0EHQDLdsKY2mCYDAid645g58xk2Urf04ieUQ+JwU9no+dKiI
	lTjVxd3KxjjNGqhhx+vaIWtOiCVhPylXc+IN3nl8cWpn8nM4pNMsr4r7aMZh/OxQcGd9PqxwIUf
	PyRc=
X-Gm-Gg: ASbGnctFWciScY1V/Zac1gz7euK8HCHYb5qhFsYJM5+z6mQAb0zKqmYn/JKIzapF1Yk
	Ri15P/lXseBitEEnAOw9IMuabghVpFWAansTBomdRrKiReao8jtTYEcSkzmdtDic0zj5RChuSjN
	/FC4Ku+FlVNvrluvT8a5rCxTRPdCmE9B8IKNAOf0Sf0o3jcwGOxAzU4dRjG+curA/Q9+3UxA2uD
	qJG8ihPT2byMMGZdnQpJNPCIVebQ95sygwe/83Nqsxrfy+t9S0MREc6wJ00uVU57TP2N8pehIVG
	K/S8l7jXIA97906cEwAIzspwGb8ut35hXs2bymcfrWv/VA1+Ds5c1cW6
X-Google-Smtp-Source: AGHT+IHReR5Y3NmdMliN5J8XoFwa7R7NF4+YdNtHS0z4t4b8qK3lpLmQWRmPUJaD3YryJiZOoo8kzA==
X-Received: by 2002:a05:6512:15a8:b0:540:2247:ac4e with SMTP id 2adb3069b0e04-5440e6319ebmr3784685e87.7.1739010643204;
        Sat, 08 Feb 2025 02:30:43 -0800 (PST)
Received: from rohan.lan (82-128-213-148.bb.dnainternet.fi. [82.128.213.148])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105559a3sm700556e87.77.2025.02.08.02.30.40
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 02:30:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: [PATCH] WHENCE: qca: add missing version information
Date: Sat,  8 Feb 2025 12:30:40 +0200
Message-ID: <20250208103040.69125-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Version strings for USB and serial-attached QCA61x4 serial firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 WHENCE | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/WHENCE b/WHENCE
index d2ccfbb29866..73e0cc58efb8 100644
--- a/WHENCE
+++ b/WHENCE
@@ -4730,9 +4730,12 @@ File: qca/nvm_usb_00000302.bin
 File: qca/rampatch_usb_00000200.bin
 File: qca/rampatch_usb_00000201.bin
 File: qca/rampatch_usb_00000300.bin
+Version: BTFM.RM.2.2.c3-00031-QCABTFMSWP-1
 File: qca/rampatch_usb_00000302.bin
+Version: BTFM.RM.4.4.1-00028-QCABTFMSWP-1
 File: qca/nvm_usb_00000302_eu.bin
 File: qca/rampatch_usb_00130200.bin
+Version: BTFW.HSP.2.0.0-00609-USB_PATCHZ-1
 File: qca/nvm_usb_00130200.bin
 File: qca/nvm_usb_00130200_0104.bin
 File: qca/nvm_usb_00130200_0105.bin
@@ -4741,6 +4744,7 @@ File: qca/nvm_usb_00130200_0107.bin
 File: qca/nvm_usb_00130200_0109.bin
 File: qca/nvm_usb_00130200_0110.bin
 File: qca/rampatch_usb_00130201.bin
+Version: BTFW.HSP.2.1.0-00650-USB_PATCHZ-1
 File: qca/nvm_usb_00130201.bin
 File: qca/nvm_usb_00130201_010a.bin
 File: qca/nvm_usb_00130201_010b.bin
@@ -4750,6 +4754,7 @@ File: qca/nvm_usb_00130201_gf_010a.bin
 File: qca/nvm_usb_00130201_gf_010b.bin
 File: qca/nvm_usb_00130201_gf_0303.bin
 File: qca/rampatch_usb_00190200.bin
+Version: BTFW.HAMILTON.2.0.0-00515-USB_PATCHZ-2
 File: qca/nvm_usb_00190200.bin
 File: qca/nvm_usb_00190200_010e.bin
 File: qca/nvm_usb_00190200_0112.bin
@@ -4761,12 +4766,16 @@ Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt
 Driver: btqca - Qualcomm Atheros Bluetooth support for QCA61x4 serial chips
 
 File: qca/rampatch_00130300.bin
+Version: BTFM.RM.2.2.c3-00031-QCABTFMSWP-1
 File: qca/rampatch_00130302.bin
+Version: BTFM.RM.2.2.c3-00031-QCABTFMSWP-1
 File: qca/rampatch_00230302.bin
+Version: QCA6174_DEV.BLD.0111
 File: qca/nvm_00130300.bin
 File: qca/nvm_00130302.bin
 File: qca/nvm_00230302.bin
 File: qca/rampatch_00440302.bin
+Version: BTFM.RM.4.4.1-00028-QCABTFMSWP-1
 File: qca/nvm_00440302.bin
 File: qca/nvm_00440302_eu.bin
 File: qca/nvm_00440302_i2s_eu.bin
-- 
2.47.2

