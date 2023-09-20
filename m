Return-Path: <SRS0=zhWT=FE=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36ACEC2FC08
	for <linux-firmware@archiver.kernel.org>; Wed, 20 Sep 2023 22:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8DA7C433CA; Wed, 20 Sep 2023 22:17:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA4A1C433C7;
	Wed, 20 Sep 2023 22:17:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EA4A1C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-402c46c49f4so3210625e9.1;
        Wed, 20 Sep 2023 15:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695248266; x=1695853066; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NkyNEEjOIvxAI3ijVP8HG6WzBdHQyHxPj1N9IfxftHk=;
        b=iDG96VAoocJ0Ef/81uDmESr9DPq7dTK0eSy9e30iznyFjdxHagN2f6qLYLM/QDT8Kp
         OqkImLsf8VxPkk+qbq0jPVQkeyp0zftIIK9xvejN7Jp5v2/VzzykI4Jv+U6wnKwryHHH
         /+Ci8dYEUQp7AQ/lZ7AznYXmkAvqo8Y0dXRJwnKkgjoV6XtBFrSbGvS5V2GIkjEHyuR7
         aZN4O2E81L5dPwfIEG5NKRgfUkesUZDl6qYK5nAFwoG60x6LmkoFGnwsS3qObZTNYG/X
         xGoWy430nnvHvrZTVfPs1qgpRbCM73gP5OJs9qWDfvVJL2BzwViM5AQ9ZwWKyialJJil
         U1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695248266; x=1695853066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkyNEEjOIvxAI3ijVP8HG6WzBdHQyHxPj1N9IfxftHk=;
        b=k7m+ABzwQo+YbRETR4cMYQ7TlJ4GzLIHxhZ5EWGJkHEQi9m9k0J8bKymc7x0xYsVGy
         r9IAy1vatyl6uM4iiJV4Jf7M4iH3ArJU1Y7E33AIR/MGWzPy38Amz6MhEk9089iLiQk2
         5kts9cqW0hqb9i6NipFfTvJE2jspYdpcIFHe0ZiOwM9fmQaxmZApZornVht1AwVSeXSL
         GrKhb3NMtifEhWI1q0HKIelIsfwbW0ajcXE4pxk/bWf6QR3cFP1v/wRZLeF8lJYAhSD5
         0xAZiXj9RF5VaA4Vh1Zheski67qQlpPYHlhQJKx9Md+FvZmoFbLyJTm2aLnw5pZyBzve
         sRbw==
X-Gm-Message-State: AOJu0YyYW+i+QNGXq8EesBgqTWsf53p95laeTuzxbBvmyjEanJy/abyP
	8fq5NXt/1GWX/VE7opvmmBYKmxhdm9BgcA==
X-Google-Smtp-Source: AGHT+IHY79IAJBCY5ZbhNYbzk4lFr4qyqNbym4xq5fC2DC/S+zTPuaHpWQVdQTLRnriXZCQ5yLa88g==
X-Received: by 2002:a1c:7203:0:b0:405:1dbd:f77 with SMTP id n3-20020a1c7203000000b004051dbd0f77mr3287890wmc.31.1695248265982;
        Wed, 20 Sep 2023 15:17:45 -0700 (PDT)
Received: from morpheus.lan ([2a0d:3344:1d9:f600::41d])
        by smtp.googlemail.com with ESMTPSA id s12-20020a7bc38c000000b003fedcd02e2asm213271wmj.35.2023.09.20.15.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:17:45 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] WHENCE: add symlink for BananaPi M64
Date: Wed, 20 Sep 2023 23:17:42 +0100
Message-ID: <20230920221742.195463-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The BananaPi M64 also has a AP6212 WiFi Module.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index dbcdcedd..e4be7f19 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2716,6 +2716,7 @@ Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-plus.txt -> brcmfmac43430-sdio.AP6
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-ultra.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m3.txt -> brcmfmac43430-sdio.AP6212.txt
+Link: brcm/brcmfmac43430-sdio.sinovoip,bananapi-m64.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.friendlyarm,nanopi-r1.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.starfive,visionfive-v1.txt -> brcmfmac43430-sdio.AP6212.txt
 Link: brcm/brcmfmac43430-sdio.beagle,beaglev-starlight-jh7100-a1.txt -> brcmfmac43430-sdio.AP6212.txt
-- 
2.41.0

