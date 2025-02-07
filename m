Return-Path: <SRS0=MiXK=U6=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49688C0219D
	for <linux-firmware@archiver.kernel.org>; Fri,  7 Feb 2025 23:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06927C4CEE2; Fri,  7 Feb 2025 23:16:52 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9DB6C4CED1
	for <linux-firmware@kernel.org>; Fri,  7 Feb 2025 23:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9DB6C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-307325f2436so23923421fa.0
        for <linux-firmware@kernel.org>; Fri, 07 Feb 2025 15:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738970208; x=1739575008; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=02Jd8QVWuVvQ0AHCWiJzwJrZsIxrfhyVzSlW8tcQoiw=;
        b=k2yed7x+qwAUmpI2gJglwbL0Q2NF/qECT+Iif5hg0dmS0Jayg11SkEUvQ49vIBWhmk
         pMwWRGdCTXYf8FGn17/Eju3C1ePD5dEZtYLuXJcrg6Gwuz2K+KXWaSQ2h0S17DyXTLVA
         UL7nfwEhFyVxKPgoXgYUsTKOWqEH5s+zT4o8Qltrk1J+JEqW9AVQ/bOq7GPnTG8Lv1Ax
         JSi8cDn3SjOq68DLROtaGKzA6viYyL8OTlyMzsYFeb7PKRfvLDl9ZQee/lNB7iIR3UEp
         MOah87ZEq4SX7GKMnfsSd6yC2/KLa3P2KFf2D5XxdHWVv18/k8mMDmf/2CZUKyeRLMe3
         FLiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738970208; x=1739575008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=02Jd8QVWuVvQ0AHCWiJzwJrZsIxrfhyVzSlW8tcQoiw=;
        b=LoAGn8FUCVENhcgGKJ/+mt7vmeQGa5avXgZILMRsuUfj4QGIRsSAF8Ytopg1eRF/hX
         9gX+qqgsRs1/2iXc1Nod2MOwmx7JiLPYNDp9VI2t64s9K5h4Q43HdwlfIGbzd4ZcCeRQ
         oIlFUozUWrrmnCWkW5PTbb8qiPKyHmge1jhT66NcvnKeblg/LprLr94y/jw4A8HcUmSi
         Q+rCdSwctGwtuxHVK2SnkFM2EvRfGxnl/vF3d5QKZr+qZNqLKbmunChpX0YB1G/JxgjC
         /0AnZzKcro9cm59CsrB27T8FPWV0Qtmr6HvnAy+diX/jxiCRYFJJ6XEIkeRZlZ5bRBYl
         QUEg==
X-Gm-Message-State: AOJu0YzKt2cEE5FA49bgiry6kE+s4Or3WP8qyfpPNhDbxpIMGlgQQOur
	0uNDWmPxQ3hCtXBRH/YVSIBAIEeCW2JsSdtCS2OCjlQRS9i1+2QgOB9fWTiwYFa5iuHJzBdqoEb
	N/lA=
X-Gm-Gg: ASbGnct40J9B4OHu72XK9jmuN3CgwDKWLjW+hmPhS1G/2R89j/E4jGv9Y41xFx0B97h
	B3ksa4ahWbI8gYqfpgLqOyucABBrfhVM/mXfs+HKRcR4i3zj8a3+3UdaAQP8ZYoCmaq7y7fNi99
	VjdYp4deHxX4krX5vCxMBvBIU8vyBMEjH3dorqdqI+YTBLa1J9o7REe2pXoh40kkbo+tuPfUGkU
	yANMlDq9kImxlq6eMzQu6RWA6ydGK5ATuTdqAiwZOL46N7dEm7IAzyqiuvbmmu7kOSstIRG5G5C
	I+YnWjzTkpr+7X/OQHxF1ZvqzKTGlFyxUXZJhZc3LNYqs65R3apaSztb
X-Google-Smtp-Source: AGHT+IENDXyB/TgdkO68W2D/RnjDDsTYz9HJ25nxbvce2wDStf1emu5JWTrki5FKQu9ZdoivW7Q2tQ==
X-Received: by 2002:a2e:be11:0:b0:2ff:cb47:3c77 with SMTP id 38308e7fff4ca-307e586a4a5mr14310531fa.26.1738970208481;
        Fri, 07 Feb 2025 15:16:48 -0800 (PST)
Received: from rohan.lan (82-128-213-148.bb.dnainternet.fi. [82.128.213.148])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307dde4a0f1sm5703751fa.0.2025.02.07.15.16.46
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 15:16:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: [PATCH] WHENCE: qca: add missing version information
Date: Sat,  8 Feb 2025 01:16:45 +0200
Message-ID: <20250207231645.50980-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Version strings for most QCA serial firmware.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 WHENCE | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/WHENCE b/WHENCE
index a8df012d4b4c..d2ccfbb29866 100644
--- a/WHENCE
+++ b/WHENCE
@@ -4793,7 +4793,9 @@ Licence: Redistributable. See LICENSE.qcom and qca/NOTICE.txt for details
 Driver: qca - Qualcomm Atheros Bluetooth support for WCN3988 chips
 
 File: qca/apbtfw10.tlv
+Version: BTFM.CHE.2.0.0-00082-QCACHROMZ-1
 File: qca/apbtfw11.tlv
+Version: BTFM.CHE.2.1.3-00357-QCACHROMZ-1
 File: qca/apnv10.bin
 File: qca/apnv11.bin
 
@@ -4804,8 +4806,10 @@ Licence: Redistributable. See LICENSE.qcom and qca/NOTICE.txt for details
 Driver: qca - Qualcomm Atheros Bluetooth support for WCN399x chips
 
 File: qca/crbtfw21.tlv
+Version: BTFM.CHE.2.1.3.c7-00024-QCACHROM-1
 File: qca/crnv21.bin
 File: qca/crbtfw32.tlv
+Version: BTFM.CHE.3.2.0.c2-00044-QCACHROMZ-1
 File: qca/crnv32.bin
 File: qca/crnv32u.bin
 
@@ -4816,7 +4820,9 @@ Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt
 Driver: qca - Qualcomm Atheros Bluetooth support for WCN6750 chips
 
 File: qca/msbtfw11.mbn
+Version: BTFW.MOSELLE.1.1.3-00069-MSL_PATCHZ-1
 File: qca/msbtfw11.tlv
+Version: BTFW.MOSELLE.1.1.3-00069-MSL_PATCHZ-1
 File: qca/msnv11.bin
 File: qca/msnv11.b0a
 File: qca/msnv11.b09
@@ -4828,6 +4834,7 @@ Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt
 Driver: qca - Qualcomm Atheros Bluetooth support for QCA2066 chips
 
 File: qca/hpbtfw21.tlv
+Version: BTFW.HSP.2.1.0-00641-VER_PATCHZ-1
 File: qca/hpnv21.bin
 File: qca/hpnv21g.bin
 File: qca/hpnv21.301
@@ -4866,6 +4873,7 @@ Licence: Redistributable. See LICENSE.QualcommAtheros_ath10k and qca/NOTICE.txt
 Driver: qca - Qualcomm Atheros Bluetooth support for QCA6390 chips
 
 File: qca/htbtfw20.tlv
+Version: BTFM.HST.2.0.0-00943-QCACHROM-1
 File: qca/htnv20.bin
 
 Licence: Redistributable. See LICENSE.qcom and qca/NOTICE.txt for details
@@ -4875,6 +4883,7 @@ Licence: Redistributable. See LICENSE.qcom and qca/NOTICE.txt for details
 Driver: qca - Qualcomm Atheros Bluetooth support for WCN7850 chips
 
 File: qca/hmtbtfw20.tlv
+Version: BTFW.HAMILTON.2.0.1-00349-WOS_PATCHZ-2
 File: qca/hmtnv20.b10f
 File: qca/hmtnv20.b112
 File: qca/hmtnv20.bin
@@ -4886,6 +4895,7 @@ Licence: Redistributable. See LICENSE.qcom and qca/NOTICE.txt for details
 Driver: qca - Qualcomm Atheros Bluetooth support for QCA6698AQ chips
 
 File: qca/QCA6698/hpbtfw21.tlv
+Version: BTFW.HSP.2.1.2-00035-PATCHZ-1
 File: qca/QCA6698/hpnv21.b206
 File: qca/QCA6698/hpnv21.b207
 File: qca/QCA6698/hpnv21.bin
-- 
2.47.2

