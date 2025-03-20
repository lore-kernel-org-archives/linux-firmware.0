Return-Path: <SRS0=sJMU=WH=gmail.com=andres.traumann.01@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB9A8C36000
	for <linux-firmware@archiver.kernel.org>; Thu, 20 Mar 2025 09:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 91B9BC4CEEA; Thu, 20 Mar 2025 09:15:14 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE7B1C4CEDD
	for <linux-firmware@kernel.org>; Thu, 20 Mar 2025 09:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AE7B1C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2264aefc45dso12585315ad.0
        for <linux-firmware@kernel.org>; Thu, 20 Mar 2025 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742462113; x=1743066913; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G2yB6oVbEy3lJcJ3yxtPvHGVjmyQTqKZalL98uj3MiQ=;
        b=jxuX8lDgdXsm8EcRm4o2UbLey1uUkOs7tA7vFyr6N3NzwOG1k3ocQcwaLcTBDd+zam
         BnmRZQPq4BzXh7dXth6af7TCnT/OjEUGJfdLiGfPmcVIPbLZBCyUkJCx8ZT/or9DkOxF
         jup3OVBNOLehebqatGogyigv5A8SdfJ1fJOTTGMRMFLUbShArc5uG76LYg3UmRsmPTPt
         J5zfqAZ0hrzF2iqeWmGnXku4EnPQYyI64Q1GvV9Bb8JIeMJHGYD1cKMb5CHou7LfmAEa
         hBSjuns7WJY6eTwf2zXaU7LY3a6L4az7W1LfpRo5q7nC14mhnVCN4/aZACEuq//4MnMG
         8gmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742462113; x=1743066913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G2yB6oVbEy3lJcJ3yxtPvHGVjmyQTqKZalL98uj3MiQ=;
        b=RkQMEcZK/lnbz+vcVZ6bT01T4wgEfD1NZ9onnAyz9zBx+J6s9LmAmSlos4/t46A2Sm
         XkCT9xHW8DlT6dYW8GxLJHb/9vo2xRcFUgwVvzwL+jz6CTeotBS/oxfnLxN4Ycrm5QS5
         I87Zrze2dAJcJzukskpCUI9XC1uQBHIJE1gLkgc+EZldX2O+SgifqDHX4LSmToGkkAhN
         3SzN8u/aMNb9XC7LkQtCZgNRim8UpZQD5udOg6uBA6x/VOwN0ZiSlzY4nHijhKq24CfX
         2QJQVgPuXXv8y+iXM/B97kDfj9l4lgmJ2n6NsGLNXPBuqcCWZ8zA4q1w6WNx/+FteW5X
         yhKA==
X-Gm-Message-State: AOJu0YzPb9Nw2P40HI6AzqQDWwawM0d0XOwWW8TARPitcAzyNufb86Aa
	wQkmvkcXOeIgvmr7PQ93pnbQKUa37ajzR9DbBxeJHz6xZFP69Id8rMIabqYI
X-Gm-Gg: ASbGncsPejlTtZY/eiqn48CfkZTM8wyS+pkUmnWm0DYsKAxDmHId3HmBgL3xUj0cYmF
	Ugk6cUyLBJ2tfogY/SVSHn7m0UzRIBPmX1zsvxuauxp7QEzEAPeveSDp76McrSjqOMeBePAQFK0
	HYXbn32MGowEsunsT/pWRZXRQ8+8YuROotM4danROklSYFKsrKzkohrXPqg1zbRX5MzVE5QZFRp
	3iABcCYtyX37cjzEKSLpCoa2xmhEh13SIu0DtKhlWIQl0jCeNU4CCcpFIhYtUhHS3WyEQQqf21c
	ccR+yc53N8nqFIEFDLuYqsmio0SgeAeRlsL8wUSXLvkDDvYMdtcliVfkPbityqA1jw==
X-Google-Smtp-Source: AGHT+IEV5aI7XEplyUU5B35fFpzqpMsoKvXg98RTHy4CE9skugw+zyBfjSKPoLrxdOtSIpif4L9XFw==
X-Received: by 2002:a17:902:f711:b0:223:28a8:6101 with SMTP id d9443c01a7336-2265ee1ce6amr49292025ad.29.1742462112864;
        Thu, 20 Mar 2025 02:15:12 -0700 (PDT)
Received: from r.www.tendawifi.com ([203.95.197.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68880dfsm129920445ad.38.2025.03.20.02.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 02:15:12 -0700 (PDT)
From: Andres Traumann <andres.traumann.01@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Andres Traumann <andres.traumann.01@gmail.com>
Subject: [PATCH] cirrus: Add cs35l56 firmware symlinks for Asus UM5606KA
Date: Thu, 20 Mar 2025 16:15:03 +0700
Message-ID: <20250320091503.16427-1-andres.traumann.01@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Symlinks previously existed for amp1 and amp2, but amp3 and amp4 were failing to load.

Signed-off-by: Andres Traumann <andres.traumann.01@gmail.com>
---
 WHENCE | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/WHENCE b/WHENCE
index 6b3506d8..85247beb 100644
--- a/WHENCE
+++ b/WHENCE
@@ -7935,6 +7935,8 @@ File: cirrus/cs35l56-b0-dsp1-misc-10431044-spkid1-amp2.bin
 Link: cirrus/cs35l56-b0-dsp1-misc-10431264.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
 Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp1.bin -> cs35l56-b0-dsp1-misc-10431df3-amp1.bin
 Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp2.bin -> cs35l56-b0-dsp1-misc-10431df3-amp2.bin
+Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp3.bin -> cs35l56-b0-dsp1-misc-10431df3-amp3.bin
+Link: cirrus/cs35l56-b0-dsp1-misc-10431264-amp4.bin -> cs35l56-b0-dsp1-misc-10431df3-amp4.bin
 Link: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0.wmfw -> cs35l56/CS35L56_Rev3.11.16.wmfw
 File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp1.bin
 File: cirrus/cs35l56-b0-dsp1-misc-10431b13-spkid0-amp2.bin
-- 
2.49.0

