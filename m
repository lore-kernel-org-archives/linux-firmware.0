Return-Path: <SRS0=WwW1=CH=canonical.com=aaron.ma@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB04FD5F8F
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Apr 2026 08:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A52EC2BCB0; Wed,  8 Apr 2026 08:28:51 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A42D6C2BCAF
	for <linux-firmware@kernel.org>; Wed,  8 Apr 2026 08:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A42D6C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4F1173F641
	for <linux-firmware@kernel.org>; Wed,  8 Apr 2026 08:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1775636921;
	bh=9OMLVfCeNH88ckffX+i86NuvZe/V2MVLWaoLc4wWbfM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=LVgKxBy/o3dKjo3Gvr0nTTon8V7FJi9BEoGmSgcEh77h0ziKXN7/5wuEW/l2CVodo
	 mpZP4FSbzokTtXfSkupn/qTEj9vCsIZZyQaPVKXoo9fdO8woTfExdPg9ANsb+DiiGa
	 OSJpl6WHgjjgSz4fFRLu76UsvEQp9c075AP2VYM8K3veRA6EzwPFLb61U5/xUtUCt/
	 GL0CvYUDnWweaFy8QFJbBoajGliEn3fZ2DGBqf8sTHTi9BOABbHrHAjzoJNnDhfK4k
	 WvPhKi07lh4UQBZ8m/1M/PF+TR1YDsNLwGKjWzcv1LNUo6pr0xcZjxHSqsGier8Rxp
	 z0fKUoiNLvmS1KhoQF3XRhgh5Ckcdf32W1nynTz5facECb1P4kY7ogCATt3/+PEzrE
	 ljK9YXO+JNkkky52LiRf9ddN/jVzW6kKYIO9r7EjarMBgIrX50roafuRvrAt6tXRgj
	 eY+Uf2TOxb8vac/3pA7HFS9sCaZG/JG1Inemd19BO38+83iy04Hm9hc4e6JYDZHHmG
	 Hotfjf4zs9GWl72YlB3obaA3M2CGMNnpWhN3y0ajRpwP5ESrEspHmnyuFqOVqCnM/O
	 6FT/JmxwwVF1tTVd1VJCyvbKmqNmOewUtQS9EG3sKdgsnz3m/4eHHJ/s8mMLecDaPs
	 GLDsZqrDTZNhPwcDLiDf+XoA=
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76fff22e60so2142615a12.1
        for <linux-firmware@kernel.org>; Wed, 08 Apr 2026 01:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775636920; x=1776241720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OMLVfCeNH88ckffX+i86NuvZe/V2MVLWaoLc4wWbfM=;
        b=P7PMptWNINXWYUGvMnd6wkSkigSZb8+Bix7w7k7Znt5Jq19Ovr2ZOh+sGf5p/+y6N3
         aPE+0m6itiB9v4WyLwRODbaZQGuoWLXC8w1k9j7lFSgyDHfMtuNMj2o5Sq1fSyH4prrx
         PgMDG9aIfT0nImPqtJpol5cZSC7Xmd1ekcJohSYIlzz/rEsqCcQAcoRsNf6X2WHYHX0+
         aV3JWDYRqwprhHfTXs7xGHMmIwey/ERk96NRCnIdMiFS7WL7I+lOurOohoA2xUz7wSBW
         G+j3ZmkzMZ0NmoeosyBG4x2Puacgd7uDg5sTCtfUDHQa+5HvdanliKZyGMp9VhCEJ7IN
         rmKw==
X-Gm-Message-State: AOJu0Yz6ILIg4QLppgfCK3SeC4B528NqHWh2ODjmkvQwssIfJ+HxdIua
	yw/vnjfg4U1k3IPam7n/yn5qJA8VD/ZbWkXn2FOkvkrlJMojABKvdh9iGpe4bmfc9cZlysogeO3
	sVVYBXh+I07kFw+22uv+jJPSdfg8esacZo4BvdkKngwyLtuNXdqLUEtH89HGEu0ujA92VIJK1op
	IX2d+9si58VA==
X-Gm-Gg: AeBDies5xvFgtKiImgpuLu25BFJr/2qH7mvqpERdIpf4/W9/FmrtZw3svFN93PD6zAS
	u7FGMTd/Yp1cQSp4GthqCXBuSbJzKgH6YEyWYTx7muN6caG/nHSz8vuumHwDy3SeaVGdtad5D7L
	EOb3AzZjA9/kCx54AzLUkmPQ1OQ9ezEgZa4RYrdcC9leoilse6nUeIApAdBi3vKRk0zs/n1ON1M
	WcQ/8Q9bqZsI17i+6cfmXY0L2k2eiYNV1MPh4p40e8HW1p8JZ6kzSmmp62papxvoWJBqn+ke6ry
	anxRQ9mIc/BfMV94H1L4Cigf5Xr/DQlbdD3L3qQX6DSrnR56avnDZ00AcH+mfGptA0FKWaFLfwS
	q6YGtRu9BeCy8S/hki+qjO6ZT4/oOqWlGvELZgQ==
X-Received: by 2002:a05:6a20:7fa4:b0:366:2447:6778 with SMTP id adf61e73a8af0-39f2f11b01emr23815786637.53.1775636919771;
        Wed, 08 Apr 2026 01:28:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa4:b0:366:2447:6778 with SMTP id adf61e73a8af0-39f2f11b01emr23815764637.53.1775636919363;
        Wed, 08 Apr 2026 01:28:39 -0700 (PDT)
Received: from localhost.localdomain ([103.155.100.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c657dfb7sm17345839a12.24.2026.04.08.01.28.37
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 01:28:39 -0700 (PDT)
From: Aaron Ma <aaron.ma@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: [PATCH] WHENCE: Fix ISH firmware symlink prefix for Lenovo PTL systems
Date: Wed,  8 Apr 2026 16:28:34 +0800
Message-ID: <20260408082834.94540-1-aaron.ma@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on ThinkPad X1 2-in-1 Gen 11 (21V9SIT260) with kernel 7.0-rc6:
renaming the symlink to ish_ptl_53c4ffad_bc3e29f7.bin loads the firmware
successfully (v5.8.1.7782) and all three HID sensor hubs enumerate.

Fixes: 87a7d3c72b19 ("Add LENOVO ISH firmware v5.8.1.7720 for X1 Carbon (Gen 14) and X1 2-in-1 (Gen 11)")
Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
---
 WHENCE | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/WHENCE b/WHENCE
index b243fee39..c46dc429b 100644
--- a/WHENCE
+++ b/WHENCE
@@ -9928,9 +9928,9 @@ Info: product_family - "ThinkPad X9-15 Gen 1"
 Version: 5.8.0.7720
 
 File: LENOVO/ish/ish_ptl_lenovo_X1_2026_5.8.1.7782.bin
-Link: intel/ish/ish_lnlm_53c4ffad_bc3e29f7.bin -> ../../LENOVO/ish/ish_ptl_lenovo_X1_2026_5.8.1.7782.bin
+Link: intel/ish/ish_ptl_53c4ffad_bc3e29f7.bin -> ../../LENOVO/ish/ish_ptl_lenovo_X1_2026_5.8.1.7782.bin
 Info: product_family - "ThinkPad X1 2-in-1 Gen 11"
-Link: intel/ish/ish_lnlm_53c4ffad_75d6ebe2.bin -> ../../LENOVO/ish/ish_ptl_lenovo_X1_2026_5.8.1.7782.bin
+Link: intel/ish/ish_ptl_53c4ffad_75d6ebe2.bin -> ../../LENOVO/ish/ish_ptl_lenovo_X1_2026_5.8.1.7782.bin
 Info: product_family - "ThinkPad X1 Carbon Gen 14"
 Version: 5.8.1.7782
 
-- 
2.43.0

