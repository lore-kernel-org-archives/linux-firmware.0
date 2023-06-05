Return-Path: <SRS0=1pox=BZ=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6558C77B73
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Jun 2023 14:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9445C433D2; Mon,  5 Jun 2023 14:14:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D703BC433EF
	for <linux-firmware@kernel.org>; Mon,  5 Jun 2023 14:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D703BC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f6094cb2d2so50085745e9.2
        for <linux-firmware@kernel.org>; Mon, 05 Jun 2023 07:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685974459; x=1688566459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRQzIdqV/cMfyn02SeuI8Or9lXEJ2yy5sx5dxA/3b7w=;
        b=r2nv/sufDaEGP50nACb4jWCtpInvlJ3D7EvrFzVcfDr4T+VwA+ZNooOVIL6NXJJXm+
         IcLBKklm+0pMucbBntW02Zysh0vkH9lxLsVNDPjTUq2+Bsp9i0m5DxyVn8upjIq/HTHt
         9+pbalFV5xIOcqvYngz4x+n4SNxZUbZkudap95m8VeuGuwwdOHZCGkEScK4PMBTF79OD
         gD9p91Wid2R551Beg56GJR64AeTvfGFMuDpZb5nT423e5GnJVzsSNRVkJTZWh2UVlF0X
         O94Q/hYwK6BbkoyQYENGlKnhNjicyPBTQkER2f2H5rWWr1VPn4UTJL2FVWLF2lFCKcrC
         DVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685974459; x=1688566459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRQzIdqV/cMfyn02SeuI8Or9lXEJ2yy5sx5dxA/3b7w=;
        b=lT5COHXqo+uaARxvv166BOnfpOuOV4aVvFD/lo7V72JLW+3l/cmEusSg2SM8HlFFNM
         wK4r2wDGjG7HKomulWqa2wSjZv1nnBWgaNGokHBVVMS9EsGcP36P/H2/jJx0nx+3rNGi
         c1EF5M8G/4PBYq3o/cUlEsXmALohd/4rhG3v2R9iHwztEJwMWMV2gowddVdFADtUFLbH
         cNqpe05zseYg8SQgpQryHtDxNo6iC3FklbMMfWuxMDMPIKUEDwybvKBTA5gzZoxALaqK
         J1qeEZKIjoBHoww0G3onLv0j3MtUBddxRoCKufg/xtzdjtJBFwd6zAtQE5QH0ixSpqYH
         9wiQ==
X-Gm-Message-State: AC+VfDwz2x4RPyGSiIGNPtYwvYAkjw3y6SQbvmVMz0lLdCdmcb8HToEk
	ajsv73ZPlxmDLS6Xj+l90iNLJqfo2fM=
X-Google-Smtp-Source: ACHHUZ7LJI1pNl7x8H++VZFITEZw8gAHavKUY/oLxfR4Fvdxx+cgEpRiXbFwrKdhIUcNyijNxVMwSw==
X-Received: by 2002:a1c:6a04:0:b0:3f6:be1:b8d8 with SMTP id f4-20020a1c6a04000000b003f60be1b8d8mr8414592wmc.14.1685974459303;
        Mon, 05 Jun 2023 07:14:19 -0700 (PDT)
Received: from localhost ([2a00:5f00:102:0:3110:4340:17af:8ab1])
        by smtp.gmail.com with UTF8SMTPSA id k23-20020a05600c0b5700b003f72a7918e7sm8765771wmr.45.2023.06.05.07.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 07:14:18 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH v3 4/8] copy-firmware: quote deskdir and dirname
Date: Mon,  5 Jun 2023 14:58:08 +0100
Message-ID: <20230605141343.880621-6-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230605141343.880621-2-emil.l.velikov@gmail.com>
References: <20230605141343.880621-2-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properly quote, otherwise we'll get word splitting. In other words:
Files might end up installed to /some/foo/, where /some path/foo bar/ is
expected.

v2:
 - rebase/split && also quote the $() output

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 copy-firmware.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index bbacb925..e8098271 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -34,16 +34,16 @@ done
 grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
     test -f "$f" || continue
     $verbose "copying file $f"
-    install -d $destdir/$(dirname "$f")
-    cp -d "$f" $destdir/"$f"
+    install -d "$destdir/$(dirname "$f")"
+    cp -d "$f" "$destdir/$f"
 done
 
 grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do
     if test -L "$f"; then
         test -f "$destdir/$f" && continue
         $verbose "copying link $f"
-        install -d $destdir/$(dirname "$f")
-        cp -d "$f" $destdir/"$f"
+        install -d "$destdir/$(dirname "$f")"
+        cp -d "$f" "$destdir/$f"
 
         if test "x$d" != "x"; then
             target=`readlink "$f"`
@@ -63,7 +63,7 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; d
         fi
     else
         $verbose "creating link $f -> $d"
-        install -d $destdir/$(dirname "$f")
+        install -d "$destdir/$(dirname "$f")"
         ln -sf "$d" "$destdir/$f"
     fi
 done
-- 
2.41.0

