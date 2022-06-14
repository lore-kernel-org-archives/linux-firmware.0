Return-Path: <SRS0=uw+e=WV=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F20EC433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Jun 2022 14:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39C82C3411D; Tue, 14 Jun 2022 14:12:57 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FCC9C3411B;
	Tue, 14 Jun 2022 14:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FCC9C3411B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id h5so11536283wrb.0;
        Tue, 14 Jun 2022 07:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+YbDUMtJcOTBhg6sR7OrcWGT6mbSRwPfADb4rDvNRqI=;
        b=p0sOa+8Z6zPxZl+2QHlAl2j00BAZLOArnyTYepqmEk2pem/mCtaAYtJ8/e8WK5Q0sg
         DRsu5S1HveHZrRJt0m+n5GANyDPhs6zhU+W1Co8s+nIWm6nQO6FC2l2CuxnWExbFASkR
         HHOwsFI/XjsfYo+7laleakO4UNxFF+sDZ+ZpFXkPnnbNGYoW7yGUPheBBWFZ82ir2LAK
         2w2LwkU5DCTpNAjWLj+Z7ucW1BZWfLMzdGpcSlOwn3Cmaor7MXhpgLdgbLHSrrPIbUSY
         wtG8EmLmpWGN8EuJ8FoseZNI2DhRi3IKbXCyK0J3c4uU9a6TmqxFqzS6lTB2BPorh5vo
         Rq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+YbDUMtJcOTBhg6sR7OrcWGT6mbSRwPfADb4rDvNRqI=;
        b=jG5jqQ4wh3lSfR0iJpmz75fQs84/fPqLeCZWqxMHn3g1gj60CXpujFcSSCF1L+M+CX
         +HPTyFveL7PNeuSBflYz0IhmB3jBvDedrrDd1d9l535Cl0sxbmF/hgUN/tfE2uM0/kno
         6shO4y0GBztUM2QQLvv8pTGKp7tyjrrEEq9BlA1bzfe6JoXqmWOUl92g38w/S8Twxyxe
         Gt5yCAE6XyXxR1xJFlK5U+spU3kw2T9r/CrzR+qIoM99olsR4GrjIbkb6aLpET63Xri4
         l/FVsnTRZ3m+cPXZ8y3vlfymgkYJZtAmC2W5W4WqIg5LUIalm1rbYwMzezQXk3WBt9DI
         no9g==
X-Gm-Message-State: AJIora+MpJiOjp2RZw6+/RT3PMCJ/2HDQPz+oM/WkdkKWgDoNxnxxCDJ
	70Y6USTQYiCgS/L+tJvx9yTHmjJp518=
X-Google-Smtp-Source: AGRyM1satQsGWipfkObbFzavzLOhRamhWuZ2q7QlG6jEgH2+WNQXXwQx/kzfShCZ/hw63h9HQJwayA==
X-Received: by 2002:a05:6000:1f09:b0:21a:5f3:316a with SMTP id bv9-20020a0560001f0900b0021a05f3316amr5267767wrb.682.1655215974773;
        Tue, 14 Jun 2022 07:12:54 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id c5-20020a05600c0a4500b0039c4ba160absm4697731wmq.2.2022.06.14.07.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 07:12:54 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH v2 2/2] Link some devices that ship with the AW-CM256SM
Date: Tue, 14 Jun 2022 15:12:49 +0100
Message-Id: <20220614141249.3975556-2-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220614141249.3975556-1-pbrobinson@gmail.com>
References: <20220614141249.3975556-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We know the BeagleBoneAI, Pine64 Pinebook Pro, Pinephone Pro and
Pine64 Quartz64 Model B all ship with a AW-CM256SM so link their
known names so the WiFi NVRAM is available to those devices.
This is the refresh of the Pinebook Pro, the first rev has a
Synaptics brcmfmac part which the vendor doesn't provide firmware.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---

In v1 I mentioned the Pinephone Pro, but linked the Pinebook Pro, where
I meant to add both. Mention the rev of the Pinebook

 WHENCE | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/WHENCE b/WHENCE
index 084af41..ae13c5d 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2964,6 +2964,10 @@ Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-sdio.AP6
 Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356S.txt
 Link: brcm/brcmfmac4356-sdio.vamrs,rock960.txt -> brcmfmac4356-sdio.AP6356S.txt
 File: brcm/brcmfmac43455-sdio.AW-CM256SM.txt
+Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.beagle,am5729-beagleboneai.txt
+Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinebook-pro.txt
+Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,pinephone-pro.txt
+Link: brcm/brcmfmac43455-sdio.AW-CM256SM.txt -> brcmfmac43455-sdio.pine64,quartz64-b.txt
 
 Licence: GPLv2. See GPL-2 for details.
 
-- 
2.36.1

