Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B900C61DA4
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DAA5C433D2; Sat, 18 Feb 2023 18:46:42 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97CB8C4339B
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 97CB8C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id bg35so1483100wmb.1
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t76KH/oITVYM0JHnCuOWX43H4fDJrdtecTK3yv+ZguQ=;
        b=XpBNvKwAm7bKBpM1IiCYusEjEV+eE5ywQusBONapZCcE+JYHTKy/jsx/p2hZQSkRGZ
         1MqihakWYCpgQx8rmDwKI9BNPop4G8S06MKpiqEg6/yzAtpTyGDmLiTJkbDAfGo7g3++
         JfmCc4Z07tiri/yuALgA/QoZwmMelsxtEtRbvs6Z5FrM7iI3d/iALaSl+ECqtne9l5nb
         6apm7qXmu1y8EIt4OVtBzYuO1UJGeEX2OLMpN4ewOCBbe3hTe9Vo15GK62vxjW5zCH6x
         Jd7aSJe+0//RJ4Gyh+bFI89w98T0xHhhhgEMie1FASZR6t9x4HHOFp9C3vPXG3SFsHFT
         QNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t76KH/oITVYM0JHnCuOWX43H4fDJrdtecTK3yv+ZguQ=;
        b=ZTwbe+2rNlAdIGqMXTDQjVgblkL2/TCChSm+beJuCzj489j7Py+DaJ9m8pFMTuxRjY
         qpV7kAjzC0oFjwcJD7JIgdV/rkyqFIF9PSBy2Axa3z9gSwrlhlLG2t+p2T5wgPIJnrgL
         GWkLB6NwneFFrG+d5N++0i82g/8jWDc3Rn2mlUNe3CfwQG0g8xNQcnMil44mXCZt0/fQ
         iyzeaQXn7SVFezc2TFPhVzC3RVBTdlkqULwgbhReaiCaTp9KFJLoZBoy7aaI3QMudsn/
         qir+dRkLUKaBiQnqL88f+V2UP4GhIOiNcN/KvB+WTi6Da5wsbGKwHyDJs8vSxR9iUQbe
         KYFg==
X-Gm-Message-State: AO0yUKXIDhkRO7Zg/pO9oo70iXySZveUH5131sNKtiqxmPdX/2u0IC/6
	/dxOm+m5JLKgBBWTOW2+vfDuZQ6AZBA=
X-Google-Smtp-Source: AK7set9QvVOaRXgUWRbjFG+W1hHBXFX4T7jsR/ZD4D9ygRlcNDErEyNEC5FfgZ7lhkI94CMqmVBeew==
X-Received: by 2002:a05:600c:4b1c:b0:3e2:6ec:61ea with SMTP id i28-20020a05600c4b1c00b003e206ec61eamr8710901wmp.28.1676745999556;
        Sat, 18 Feb 2023 10:46:39 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id o15-20020a05600c510f00b003dc1d668866sm5923089wms.10.2023.02.18.10.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:39 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 12/15] copy-firmware: tweak sed invocation
Date: Sat, 18 Feb 2023 18:46:18 +0000
Message-Id: <20230218184621.2026504-13-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add space between the arguments and pattern and combine patterns where
possible.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index c6a2fe9..722227f 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -25,13 +25,13 @@ while test $# -gt 0; do
     esac
 done
 
-grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
+grep '^File:' WHENCE | sed -e 's/^File: *//g' | while read f; do
     $verbose "copying file $f"
     install -d "$destdir"/$(dirname "$f")
     cp "$f" "$destdir/$f"
 done
 
-grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do
+grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
     $verbose "creating link $f -> $d"
     install -d "$destdir"/$(dirname "$f")
     ln -s "$d" "$destdir/$f"
-- 
2.39.2

