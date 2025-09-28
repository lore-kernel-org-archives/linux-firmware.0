Return-Path: <SRS0=i1fk=4H=gmail.com=xose.vazquez@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE64CAC5BB
	for <linux-firmware@archiver.kernel.org>; Sun, 28 Sep 2025 17:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB2BFC4CEF7; Sun, 28 Sep 2025 17:32:38 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E519BC4CEF0
	for <linux-firmware@kernel.org>; Sun, 28 Sep 2025 17:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E519BC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e3c73fb4aso1200205e9.2
        for <linux-firmware@kernel.org>; Sun, 28 Sep 2025 10:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759080756; x=1759685556; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gZpfDa1LyEfLRHt6pylVChVVp0uO3/fPa6/etQzY1rE=;
        b=aTPm70/3NtjFXSjmdU0PFHqhHo1MDBb+blP4dFF3DeMjyMby7UR5N9YhdfmN8EYhHi
         dHh7l9DRwRJYUmv0ipDlrFwuoLGhNp/qWSTmBjQJCXqvMj2r7uvYMO+l1KEU5yd7WzgQ
         KBznXDjI6KytGLsEhe8EVJ0jnb3PcD+OSHkfjadk6RcUdJaGD3H9ODJxcR/q0JIzJq/Y
         PfF1mnouB0nK4GfkYCuOf4o49PdSlm1+FdXh2vT8KssNpjc3kD4t+w8snrYF7vy6DfVH
         XQZctkLO2edSs7C6dgHay+VT641d0bMx69qsZwgrq+JsbD7IbXsdtSrC2lAIGnXYzU4K
         l13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759080756; x=1759685556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZpfDa1LyEfLRHt6pylVChVVp0uO3/fPa6/etQzY1rE=;
        b=BgDsN/iqsOdhRj46UQpP6cyYDmRAN7CTqBxDwZyBnimk0XLSThJIG/I3ZqK1UVHZQJ
         znXtVzWA9OtaxyfxitzwFToWTt/UjUbfKRBZcKyrM/t8SN91XGbKpMrJ5cMGXDutzL0h
         DWoy4HaUZESskzpuIIk1DeS1iX4jWVc4kXJDFsk1XFDCzA5Fddamno7bjtEX1Dct0woz
         3A/UsKBk9wLFmUa9MVtsDaysx5Xjf4Uy8cd9y8bqbYQ2a6w6KuY8LDP3rqLHuNBC7+aC
         o1JcCSSx3+y0vq0TbQLC2dp2Bf/gCnKSyqfT/dP7JO1ggS17wn1hF7Wrx3dXLf2RIWph
         DBKg==
X-Forwarded-Encrypted: i=1; AJvYcCVaxnVJ5OsS97uwwcWETsh8BkSMt5evKzmPCGMlID766PLl1wfU1akWGg2xNRNP94u3+484BXjgXxSO7rpvug==@kernel.org
X-Gm-Message-State: AOJu0YwmziCMHw7BMKWB1nsgXJNbU7ud1s8TEmh/yrJotBMqxWThb663
	CTaH8JSF/whoqP/GoXMZDH2BP2HrxDL+FUjXRb7jUFXQqPPaFEpxqhg=
X-Gm-Gg: ASbGncs3XmTxEzE8NwvHDQhp9hXDHfEKSAyKOSjYjQu23KYZzBD5m7gjH+EGKHD0YNO
	WNEmmmvlHO8SxaN3cQnOdOe+BYVX9K8UNid6xoSil3voyVBPR/MTL421b5JcK4yugW1o3V5pVxk
	Dh41kp5smNrN7FGByT8r7wicCQc5TF0CijqKcREH2GJ4P43cXHDIzVCJO1RgYKvdf4cTDx5bNou
	hujzSuHNiKQM0/xWpU5V/oNUZXslzgi+DrvxHz8eT4dPg18BpsSprFFCKhJh1cR77b/NGDqQepS
	jBhmixy3t0rr/mgqk9INgLR8IzmpnMENt9v9aDqx0B8MAJbwQnuBArzN9GJqboa8MV3O3dJ8H4E
	5GYDQMMORB59MJaPUkiGg1QhWTR9GZUMIAccUOcW+o3glvV1jRkdSg71MA4qIZrVZW/xMOxw=
X-Google-Smtp-Source: AGHT+IF9ctIc1w7pYuurOOtSQnBLKY1kKaYNPxwyS5j92ZGHx79Esox1Ll1Fj6se/C5JsV2BZGeBow==
X-Received: by 2002:a05:600c:8711:b0:45c:b6d8:d82a with SMTP id 5b1f17b1804b1-46e32a16999mr66566055e9.6.1759080755805;
        Sun, 28 Sep 2025 10:32:35 -0700 (PDT)
Received: from localhost (20.red-80-39-32.staticip.rima-tde.net. [80.39.32.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a996d7dsm205793335e9.4.2025.09.28.10.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 10:32:35 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
List-Id: <linux-firmware.lore.kernel.org>
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	QLOGIC-ML <GR-QLogic-Storage-Upstream@marvell.com>,
	SCSI-ML <linux-scsi@vger.kernel.org>,
	FIRMWARE-ML <linux-firmware@kernel.org>
Subject: [PATCH] linux-firmware: WHENCE: identify Qlogic firmware
Date: Sun, 28 Sep 2025 19:32:33 +0200
Message-ID: <20250928173234.233947-1-xose.vazquez@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

Info from:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1bfa11db712cbf4af1ae037cd25fd4f781f0c215

Cc: James E.J. Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Martin K. Petersen <martin.petersen@oracle.com>
Cc: QLOGIC-ML <GR-QLogic-Storage-Upstream@marvell.com>
Cc: SCSI-ML <linux-scsi@vger.kernel.org>
Cc: FIRMWARE-ML <linux-firmware@kernel.org>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
If anyone is interested in this, NetBSD has different/newer versions:
https://github.com/NetBSD/src/tree/trunk/sys/dev/microcode/isp
---
 WHENCE | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/WHENCE b/WHENCE
index bc807bd2..bf35f40e 100644
--- a/WHENCE
+++ b/WHENCE
@@ -70,8 +70,11 @@ Found in hex form in kernel source.
 Driver: qla1280 - Qlogic QLA 1240/1x80/1x160 SCSI support
 
 File: qlogic/1040.bin
+Version: 7.65.06 Initiator/Target (14:38 Jan 07, 2002)
 File: qlogic/1280.bin
+Version: 8.15.11 Initiator (10:20 Jan 02, 2002)
 File: qlogic/12160.bin
+Version: 10.04.42 Initiator (15:44 Apr 18, 2003)
 
 Licence: Redistributable. See LICENCE.qla1280 for details
 
@@ -1590,6 +1593,7 @@ Licence: Redistributable. See LICENSE.conexant for details.
 Driver: qlogicpti - PTI Qlogic, ISP Driver
 
 File: qlogic/isp1000.bin
+Version: 1.31.00 Initiator
 
 Licence: Unknown
 
-- 
2.51.0

