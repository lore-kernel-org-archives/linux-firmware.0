Return-Path: <SRS0=GS4A=2R=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB38C4332F
	for <linux-firmware@archiver.kernel.org>; Sun, 16 Oct 2022 12:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 159BDC433D7; Sun, 16 Oct 2022 12:50:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 350D5C433D6;
	Sun, 16 Oct 2022 12:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 350D5C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id a3so14500309wrt.0;
        Sun, 16 Oct 2022 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/+spzO87EZHqApyn35GK/xzR/WqqBAOC5Frzz1GeAfo=;
        b=ekubGaW8Py5BBHd8vn6PoUOx0IzM/Swy1ySmCEmJie+y9IiiXd11NwOFabXKcWgR6o
         CSzjU0OHOBvpgZO2jwMeAYXEWioSqwg/e8IdXtdC8D4dWbdcIFp6gnDkF6sImLKwkFRs
         nmoYf9sAr5D4Yt47s4Jmsm5ChTfciy9g+HbkmrzUoqzJJ9V+weZxd8xwlVhGUAlOGbtn
         2jhqcpvze9SzQScfO+QtCIpsZbEhfZGKYNpLA2hQ6chmv1VQc4e4l8de/BTXTYVDfKxt
         84l4L9TVQ5jOcpyf7IPy/a62/BlcgpF593mU+4YZCmmbf0QXQ1bA7+ezeqAMkf+qPjEP
         zbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+spzO87EZHqApyn35GK/xzR/WqqBAOC5Frzz1GeAfo=;
        b=pTP/Nvmp+RIxpvdz+Fh8LpLU4iJ/BzTC7mgSnTSZy4TcythSA2aalv/XTNqAlKAsr2
         FepUhmMeWi1fKEpzZY54Np/wHhMy09Uw8a9XGiGKWoCo0iJjA961iSjweVFrZdcQbVvC
         QH1vxEql1qxaNMgOCUpXx8oIS7zIv4mM8qLqwLhTRnqrvbih6pN+R9XRKUrrarnkRfLW
         duaCEDeJqiNTMBKuU+MqTmVgT2BwWDnjc/g0eb6tIslinGQO9vGjMjpj2shTJ0LnBxi5
         T27ln3xK5Fhb6ye7jJ3T/WCRPfIyNY7Q+d1siZ230+HDNEYgqbcwLAtjMR6cj/eJ8xBQ
         XaWg==
X-Gm-Message-State: ACrzQf0It/Ir7/XCwk0ux1HvT8kOl7jya0ogh0Ef/i+R1Vhq2oofH66/
	B7lHAuu0DbhOO/+SwI+iDQP6/73biPI=
X-Google-Smtp-Source: AMsMyM7zbGeR0aPK39v1BDGc84TVeO2oA9mDw1aMpxk8gFWgdE2szSXKJBRBX4Z8VPoW6i7X0kdx2w==
X-Received: by 2002:a05:6000:1d83:b0:22c:aa0a:12 with SMTP id bk3-20020a0560001d8300b0022caa0a0012mr3566071wrb.471.1665924648291;
        Sun, 16 Oct 2022 05:50:48 -0700 (PDT)
Received: from morpheus.home.roving-it.com.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id t15-20020a5d49cf000000b0022e32f4c06asm6215587wrs.11.2022.10.16.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 05:50:47 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] brcm: add symlink for Pi Zero 2 W NVRAM file
Date: Sun, 16 Oct 2022 13:50:44 +0100
Message-Id: <20221016125044.1464459-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Raspberry Pi Zero 2 W comes with two possible WiFi modules.
One of them is the same module as shipped in the original
Raspberry Pi 3B and Zero W so lets link them so the devices
with that module will work out of the box.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index 816cf7c..0c6dd8e 100644
--- a/WHENCE
+++ b/WHENCE
@@ -2857,6 +2857,7 @@ File: "brcm/brcmfmac43430-sdio.Hampoo-D2D3_Vi8A1.txt"
 File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
 Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
+Link: brcm/brcmfmac43430-sdio.raspberrypi,model-zero-2-w.txt -> brcmfmac43430-sdio.raspberrypi,3-model-b.txt
 File: "brcm/brcmfmac43455-sdio.acepc-t8.txt"
 File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
 Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
-- 
2.37.3

