Return-Path: <SRS0=yCVj=DB=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC7CEB64DC
	for <linux-firmware@archiver.kernel.org>; Sat, 15 Jul 2023 11:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4FA3CC433C8; Sat, 15 Jul 2023 11:40:53 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58165C433C7;
	Sat, 15 Jul 2023 11:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58165C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3fc0aecf107so24890645e9.2;
        Sat, 15 Jul 2023 04:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689421250; x=1692013250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wB3e/d79nNSPrjK0S1l0339fxUhnigTDKJchBJ3p6Dw=;
        b=ZNH8WZTxcFmV9VJxuR3KqMxzB5Z6txfqUR61Qx4/dttNzKoQMReIPIqCYAVax1TAir
         IOOwtFeqas8nznQEZAmg1hhG+Fl0t5DvRfkaly8iZukUyEVtG+l7QI/NIIPUWDassfAG
         il4HtNwRQGRCU/BkAxGW88WGy5dzX7A7+0pqmWwCbITWiog5lIH9WUnaVfcFrMltBhAq
         nAYFQqs2SE2FbykNbCKFjruH8teb7+W3hlpmmAtMLSsgDV2og6rTwZKWavIbm5+WbGUw
         /1DWdLyX3K5czTKERqMroEIdkC7rEiW3JpCmVJP+O8xsSeBwfIGBX7TaDn7/YI0O4ATP
         PG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689421250; x=1692013250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wB3e/d79nNSPrjK0S1l0339fxUhnigTDKJchBJ3p6Dw=;
        b=Sjy/Q5hiFgIsQxEK8WTOqGfA+rZHkTXyxPz91SBdlyIycsrWZn3Shbbhbxl8NyAE6J
         Eu5/l8owHhHw/jnmqO16JY089geg0tRTm265lWpexr3jB0OsmIGH79O6DHW9zbLbSmZf
         2R+sZ9xPr2Y1STNkzyT50yuConaBUDtnz0POMecOsIQOqkCeNTVjYE3JcMh6HriJ5M/5
         psVqCMvG/recZnyTCTfbmHi6hvSkhjvPUUNf0qRzgikXCm4jkX1TH4CmzbAuVbx9AUBI
         2hc14JFXAj5ZSGzcxnyFm3W+/+1+zqQkVjHQpGYHj5KES88dTiDmQgbZJFWB2Y3HEkft
         DmsQ==
X-Gm-Message-State: ABy/qLaPNeqJdPxJl7dcV1alxg1gqBs/GV/iWKLL2YlX8ELqKYjC2fBM
	/HCMmnghcwgbFC7lGM1r/iORV7JKjho=
X-Google-Smtp-Source: APBJJlECbfe4RwZHC1g22KokCD/9G+4Wv5wyg8AwSxhvhThPkUr4WKnB4mvvjy5UexxpfFegM/Gf/g==
X-Received: by 2002:a1c:f715:0:b0:3fb:ab7d:ad95 with SMTP id v21-20020a1cf715000000b003fbab7dad95mr5951495wmh.4.1689421249946;
        Sat, 15 Jul 2023 04:40:49 -0700 (PDT)
Received: from morpheus.home.roving-it.com (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::2e3])
        by smtp.googlemail.com with ESMTPSA id v7-20020a05600c214700b003fbc681c8d1sm3467219wml.36.2023.07.15.04.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 04:40:49 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 1/2] qcom: sc8280xp: LENOVO: Remove execute bits
Date: Sat, 15 Jul 2023 12:40:45 +0100
Message-ID: <20230715114046.1301714-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the execute bits of the Lenovo x13s mbn firmware.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn    | Bin
 qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn    | Bin
 qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn | Bin
 qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn    | Bin
 4 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
 mode change 100755 => 100644 qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
 mode change 100755 => 100644 qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
 mode change 100755 => 100644 qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn

diff --git a/qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qcadsp8280.mbn
old mode 100755
new mode 100644
diff --git a/qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qccdsp8280.mbn
old mode 100755
new mode 100644
diff --git a/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn
old mode 100755
new mode 100644
diff --git a/qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn b/qcom/sc8280xp/LENOVO/21BX/qcslpi8280.mbn
old mode 100755
new mode 100644
-- 
2.41.0

