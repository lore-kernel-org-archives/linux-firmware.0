Return-Path: <SRS0=mAre=ER=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9792ECA0FE8
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Sep 2023 06:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4BFEEC433C8; Fri,  1 Sep 2023 06:52:39 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE6B1C433C9
	for <linux-firmware@kernel.org>; Fri,  1 Sep 2023 06:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DE6B1C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 24A034459E
	for <linux-firmware@kernel.org>; Fri,  1 Sep 2023 06:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1693551156;
	bh=gyh2FFL9X0OVUwoX28Wv78EyCKG5Md/cpWmk3YSIoAo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=UOg5s3R6EMfRe8Xv2+EtKy26JfrQD88trHpifyfyQSSuFGapig1PIdj5wGOoK96J8
	 gSAudRxFxQooqFcFeFblD/Caq+uCm/gl4cdhMXBgNqWkSjHFa/LXn1uviMrJ9nPvFN
	 yEijeSclTXZsaka5mnRiM4D3ODOnhf2JcTP30L5ZoNMN0QHhn4Wi7DBX8mmj7V24dR
	 SFkisY8GOfdFOxd2T9+Umbax5PSVYGREQqUJPgS9vuXgS1DuwuwIIuj9EoMwdOTz3j
	 9CQJ72qeHupfgo4dB52ACHFv/HHLrPIiHnc6ZOAh+UmOl15KZmvrrxJLN5pHZkBtgh
	 PRmEFK9qXojJA==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-401b8089339so10711695e9.3
        for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 23:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693551156; x=1694155956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyh2FFL9X0OVUwoX28Wv78EyCKG5Md/cpWmk3YSIoAo=;
        b=k8qAQsK9ysQ0ef8w0UCBDJbQVDWurU78Had3qoPXmutgqxAGW8LzzFFSB1NfryGrd1
         1Wwf7sY8SWtMZMPAzAijVnFI4cc2o1rwW1o0eM8C/UoqPzQw2prdCk9ky4aVfAIWjL0X
         Upop1/f72bos2s3Lzvk0deU1Y4vu+N9WazLAinK/zlpK7BhZFhzr+im9xzrV+YCXFfP+
         EsCfHyk5wH2eY2/bxorq46C2qUsO713lUvoCSCrLMS94+xJJ78+IpKeVpTAbafZwDvym
         vPKdyBPb4YV6aPrT+fLQKQV9ZA5rdWgv2Cbf8K417ZELWYbrlbo+oR9ltnO6aDIksk3q
         u1zw==
X-Gm-Message-State: AOJu0YyvinvQTvni8r8RvM5+nHJR0c7cIsp4cz6wm5Jw9fU9jmZvj0vP
	ncOuG6beDOvC6i15TbBXoI5Q491kO6K4mozxYuOKN1XiyoS9p9HBBf/HOUFfpVcWG4EcOQRUN53
	hnUmf+G2kTmH56XmcPpEICLnNM3sYgIzrAgNlcw==
X-Received: by 2002:a05:600c:2158:b0:401:bdd7:499d with SMTP id v24-20020a05600c215800b00401bdd7499dmr1041022wml.25.1693551155882;
        Thu, 31 Aug 2023 23:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3/7A4j1+QCvrU+V1BnAB4TTRUZa+rNVe4kaMFt734oSTZAWP2lTj6rbrzFF/MJ8xmt43prA==
X-Received: by 2002:a05:600c:2158:b0:401:bdd7:499d with SMTP id v24-20020a05600c215800b00401bdd7499dmr1041018wml.25.1693551155685;
        Thu, 31 Aug 2023 23:52:35 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id n17-20020a7bcbd1000000b003fee777fd84sm3900723wmi.41.2023.08.31.23.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 23:52:35 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: mario.limonciello@amd.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: juerg.haefliger@canonical.com,
	jwboyer@kernel.org,
	linux-firmware@kernel.org
Subject: [PATCH v2 2/3] WHENCE: amd-ucode: Use new RawFile keyword
Date: Fri,  1 Sep 2023 08:52:25 +0200
Message-Id: <20230901065226.13607-3-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901065226.13607-1-juerg.haefliger@canonical.com>
References: <41fb7957-98e8-4ad6-b958-1e673e7476e0@amd.com>
 <20230901065226.13607-1-juerg.haefliger@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace old File/Raw entries with a single RawFile entry now that
copy-firmware and check_whence supports that.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 WHENCE | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/WHENCE b/WHENCE
index 390a5689408e..852e88f55341 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3912,20 +3912,15 @@ License: Redistributable. See LICENSE.amd-sev for details
 
 Driver: microcode_amd - AMD CPU Microcode Update Driver for Linux
 
-File: amd-ucode/microcode_amd.bin
-Raw: amd-ucode/microcode_amd.bin
+RawFile: amd-ucode/microcode_amd.bin
 Version: 2013-07-10
-File: amd-ucode/microcode_amd_fam15h.bin
-Raw: amd-ucode/microcode_amd_fam15h.bin
+RawFile: amd-ucode/microcode_amd_fam15h.bin
 Version: 2018-05-24
-File: amd-ucode/microcode_amd_fam16h.bin
-Raw: amd-ucode/microcode_amd_fam16h.bin
+RawFile: amd-ucode/microcode_amd_fam16h.bin
 Version: 2014-10-28
-File: amd-ucode/microcode_amd_fam17h.bin
-Raw: amd-ucode/microcode_amd_fam17h.bin
+RawFile: amd-ucode/microcode_amd_fam17h.bin
 Version: 2023-07-19
-File: amd-ucode/microcode_amd_fam19h.bin
-Raw: amd-ucode/microcode_amd_fam19h.bin
+RawFile: amd-ucode/microcode_amd_fam19h.bin
 Version: 2023-08-08
 File: amd-ucode/README
 
-- 
2.39.2

