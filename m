Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07047C636CC
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E50D0C4339B; Sat, 18 Feb 2023 18:46:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2ADBBC433D2
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2ADBBC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id d11-20020a05600c3acb00b003ddca7a2bcbso854858wms.3
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQjzLcoCrEkBRVMsGD63hSCbgpLHPOAniBp9UwicWxk=;
        b=BKlphPWSW4/7deGANG3Lmtxb8TLBr3ExQgwvXfgD+6YEePKPvJe9Olb7OpaE6/WziL
         Ijj5kfFn2nLRxuC7K4rXhF+oKcuOAcLKLIeT9JXexkL6D87eWfJFEwBQR52jIziSR9+M
         6tzGxNIlvC6Mn0tSmqyABgMMB+ue+XnluIkqmal+p2+KbRgsCk7wKwno7w9PAdjIbQdA
         T4BOTX1UTDYF+AT6OAiKHP5RkG3P2no2BN5M+z+28URIdYhKIMzX/C3VcMHAiv1y4NN6
         ULIq6WIoQi4afckgIsp/TtwThc+vEOjOx/vVTju+W+PUwq64YfpZ5fz+xAArjAbrIdPd
         sP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQjzLcoCrEkBRVMsGD63hSCbgpLHPOAniBp9UwicWxk=;
        b=w0KhJvPLho2xnRQ/72ifwGVDvp93azMd1H7OlYJ//mQjt0GwXrTfSOURPSX4jrolf3
         O9xVjy9UkBzu8jsEDLHS/sxzEJJtRIxX8tll0MCE0VK9ZIPKLHCS3uWR367tRTz3zf6K
         3i+yopU6teQdYVxcyP640/4oQx2nSEylKTxG3w496J7Cg8H3ibYo2fDlmqENnJPySUQ5
         vQ4qvgg3lsYgQDF57314J8Eq2MLSd1leqWmeVzHmLS6ACUekMr1FIccUUlq9WqEu+21n
         0+A1CSCMfM/ClYqXRFzXg/KSF6tGQGFqD9e1xc2xgfoSxGSsUiBAzyZ+fcs3AouOGyx8
         nR/w==
X-Gm-Message-State: AO0yUKUogbLXcjcB9lTH3CjlMnHH3SXS2S87qRdmrsZExj0OCZ2FRFHM
	v6xfHK9YZL8fRJZJsU9dGLmTPqFg3sw=
X-Google-Smtp-Source: AK7set8LbW271NrsEnh7EMYKuFkV8YXwJau5BWdHLoVUvX53Dj02TyHy4IGC+bSW3tw3ZB4ogR6aBw==
X-Received: by 2002:a05:600c:2a08:b0:3da:1e35:dfec with SMTP id w8-20020a05600c2a0800b003da1e35dfecmr2620057wme.4.1676745998361;
        Sat, 18 Feb 2023 10:46:38 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id m17-20020a7bce11000000b003e209b45f6bsm9356410wmc.29.2023.02.18.10.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:37 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 11/15] copy-firmware: quote deskdir to prevent word splitting
Date: Sat, 18 Feb 2023 18:46:17 +0000
Message-Id: <20230218184621.2026504-12-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 0132244..c6a2fe9 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -27,13 +27,13 @@ done
 
 grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
     $verbose "copying file $f"
-    install -d $destdir/$(dirname "$f")
-    cp "$f" $destdir/"$f"
+    install -d "$destdir"/$(dirname "$f")
+    cp "$f" "$destdir/$f"
 done
 
 grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do
     $verbose "creating link $f -> $d"
-    install -d $destdir/$(dirname "$f")
+    install -d "$destdir"/$(dirname "$f")
     ln -s "$d" "$destdir/$f"
 done
 
-- 
2.39.2

