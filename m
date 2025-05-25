Return-Path: <SRS0=/7Tw=YJ=googlemail.com=martin.blumenstingl@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DB7C54E90
	for <linux-firmware@archiver.kernel.org>; Sun, 25 May 2025 13:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 350F2C4CEEF; Sun, 25 May 2025 13:16:18 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53A5BC4CEEA
	for <linux-firmware@kernel.org>; Sun, 25 May 2025 13:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53A5BC4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-600210e4219so4760721a12.0
        for <linux-firmware@kernel.org>; Sun, 25 May 2025 06:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1748178974; x=1748783774; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6XvbA2aTkiZgmp2lOvkDpO+rhf2MkQsZDHy97frCbs8=;
        b=eOR3+hqkA9o20DXY4GkqVr4ztjN/myxfxMOC002+unRywlrFO+036xF4Qq/+JbXsI2
         ij8lJZ9e/lizKZub71phdbP4GHyduwj7WHyxdWQfNXxPS1rJemmbVwicq7w/HrCoYbVt
         BHx6grcjPZG2xAShS9KtVp74+K+n6gmT391e7WsePFY6ld5PrlbFfOVpvOXTT6zmervt
         O1oEte+x4Nry8c96KDqGHhRQ3N04u6QmzcQcNRcSyWLX3RCcAjVXOxSsi8fYGfNKf7wc
         jZGnhZ6jJir+7+x5RShfeJ4DYiMapRc+Q8i5ly1woaiUfvYaQuaHPX18+sF96zpb82zL
         jVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748178974; x=1748783774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XvbA2aTkiZgmp2lOvkDpO+rhf2MkQsZDHy97frCbs8=;
        b=ObRTTB7LT3BqlzSjl7p6dM5pjwEz6lhmaK2PS1q1ZtJq2afLdkZkrN4MS0gkOc9v/a
         ibjq9S7HR0nHWg43xqZihi8cOPa7VABfk353jh+03dGMvoIcfaIJgdYSpbAC4ni+3JUY
         1f51lpZFlvgzbKSk+6WTmP2mFAb6GcG6+W9dBbzNuW/jVrCPZTkbOnH8ZTqVqJbYjKuA
         1DqYEErGCIpRjUGVj7ej78xWGLb/GdtY8ad+2QxGjhJpXtp10agLTRcQhM5Gg17Bcace
         CKlbM7TSQ/BLRkJrxyajvctk8gJpPVRddw4sLIlGETWxJhDPWs2jSbN2sIB4AIrm8mBR
         MRsQ==
X-Gm-Message-State: AOJu0YzIJNNiiIXFzMUyPpmW65lDB9Juwkca0wGInRPDsEhdQ6qQ0q/U
	gZo0vPlkJZYcqfcLHDQ2UddOvxPQSY2OisILLj5s4wjEPVf8L00W9rGL5fcVIg==
X-Gm-Gg: ASbGncs5mq2DKvLJM/msMxCZ0s5omCBur0rIXgu09wcVe3O2TCTORrH66KrSyleu40z
	IgJLIWEKqouNaFky+dQpKGJDSOW4ehBuAW6GzkgGxmovcm6yJwDVQ8Id3ZvWGxD9mK7szNpSTZN
	gMksRXe1wS/hGXeGNj/k/anaJqSazxYavTwVL/UoznhphUfxgcRFbldZqHB43PqVVva2N9xo0Mx
	3vlo+tOy4blyJeqJ+l+DnFAk9A2lXJiQtx2r8xYS0gDAYvHzUgYSleQKCGpvXGdZqWZ3ki1FHrk
	R2GxjYJi5hv9w24KRf1HyZvBNxlEBpMec5tWQU+CYup/XvLzMFqFuOPlkNKLFYVZ0Fem5fITO2h
	7N1c3VxLkYabBMzvIVHHWcJcSfg/m6WwWvdbhQ5vY4q3yUx5fo84OAhuoA9bwTBLZTJYk3B5DVE
	svfPBnR6mWDzUV0gyvn1o=
X-Google-Smtp-Source: AGHT+IE793OXyd5Yjyb+Udvp+U0BqyJM0K4Uu9yg2coolVM64PnNS/DJIusNxuUxY6WTeSSiFjsG/A==
X-Received: by 2002:a17:907:1b27:b0:ace:d587:2f3b with SMTP id a640c23a62f3a-ad8599e8ce7mr426815966b.22.1748178973722;
        Sun, 25 May 2025 06:16:13 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b396-c900-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b396:c900:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-ad52d496550sm1528621266b.134.2025.05.25.06.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 06:16:12 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] brcm: Add symlinks for Khadas VIM SDIO wifi config to AW-CM256SM.txt
Date: Sun, 25 May 2025 15:15:22 +0200
Message-ID: <20250525131522.965580-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Khadas VIM (1 - the original one) uses an Ampak AP6212 SDIO wifi /
UART Bluetooth combo module. The SDIO wifi config matches
brcmfmac43455-sdio.AW-CM256SM.txt apart from the comments. Add a symlink
so the wifi part is supported out-of-the-box, without users having to
add symlinks on their own.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index 93f849c..2649c97 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3087,6 +3087,7 @@ Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
 File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.brcmfmac43455-sdio.khadas,vim.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinebook-pro.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.1.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
 Link: brcm/brcmfmac43455-sdio.pine64,pinenote-v1.2.txt -> brcmfmac43455-sdio.AW-CM256SM.txt
-- 
2.49.0

