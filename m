Return-Path: <SRS0=8t+c=D2=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87066C0015E
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Aug 2023 09:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 331B2C433C9; Wed,  9 Aug 2023 09:41:09 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A526AC433CA
	for <linux-firmware@kernel.org>; Wed,  9 Aug 2023 09:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A526AC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 30BE33F546
	for <linux-firmware@kernel.org>; Wed,  9 Aug 2023 09:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1691574066;
	bh=pza4DzV8KvQj+epA7+q7t1dbguGHJa7+WxMc9E7EHPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=lr41uverhrYvArwTyygdjab7oEneeFMPJBDNZqhvzLM2cc8HtNpYxDWPzkV9jNF7W
	 4gTB64/LmnTcSqzLqKcUHgU1kbvIO5DeLtoLuDj5hsK6YkInH0NZx++0Etm28V7Gw8
	 OIbKaXA7JHlxUpDC6SE/V4V2/OLqWHvR+1wQS9CUnSIVS7zygYXadxj14s0KlNSheE
	 vA82b+CoTgNPMad2yUvE/YHubM+El2UMjSglN21058JZDIZJ1u/MMGDrfOzdBiFwoz
	 6cXzj2Adryk/kQDcwQ9g5kJxnwpEMfVnesyGb7UVBfLsnwTgndAUkBOGdUK15qNqJR
	 pB8YatMWBjVHg==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-2f2981b8364so3798122f8f.1
        for <linux-firmware@kernel.org>; Wed, 09 Aug 2023 02:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691574066; x=1692178866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pza4DzV8KvQj+epA7+q7t1dbguGHJa7+WxMc9E7EHPA=;
        b=G3lgZSOju4Rghfz4p7lUMh7kpXnXIC4w9hbDrlGQ97euOznKcJngs5kMhG/GX8cXqG
         EwVSOze11W42edMwwxCTJf2J46OuI9ulHb54cKhKOe0ZnT6BsMc4W2JOMvKFC3vvhcMj
         xZBfv/NWE7W3umRDo6plbkTjH/A/f9ouMDcDfvhx1Z9fNnHjxvok1NHSLojPk64KZ5LH
         EmEPIp/bdH1Vkg9y989FZ6TJVjGAaje93b9DZYc4wzGD3U4RFFwzSsx0KxJiAsxEFvqs
         rLK3t4OcrLX0d53udU7dETwa47UchD1XRAZe75BopjUxb1/NVXxOE2+lElDhrSsYShPJ
         1IpA==
X-Gm-Message-State: AOJu0Yxygb6z6E26u/rofziYTL8NHc7f5+MNik2L9EKR848biW3yFmxj
	gd1XEcP/ZJSzPvwdTb8mo+6pJIVILAwK8J86+l60OMoX2iEkuzwi+avzGF7DfPECuZBU5EwUiqd
	UFNWdI5zkkF4okLpYcWxz1+Aua1sFb5FplMc9wNseuqcWhw==
X-Received: by 2002:adf:ea05:0:b0:317:cddf:1c71 with SMTP id q5-20020adfea05000000b00317cddf1c71mr1349338wrm.23.1691574065926;
        Wed, 09 Aug 2023 02:41:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFW8s/nPFmgkI5yVsxk+zgrk6jR8x3biipEBEsdhgIttsqyD2NOJFrlIsCzC5hrZMuTI7Chxw==
X-Received: by 2002:adf:ea05:0:b0:317:cddf:1c71 with SMTP id q5-20020adfea05000000b00317cddf1c71mr1349332wrm.23.1691574065754;
        Wed, 09 Aug 2023 02:41:05 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id k6-20020a5d5246000000b00317f70240afsm5175175wrc.27.2023.08.09.02.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 02:41:05 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
	jwboyer@kernel.org
Cc: Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [RFC PATCH 1/1] copy-firmware: Introduce 'RawFile' keyword
Date: Wed,  9 Aug 2023 11:40:59 +0200
Message-Id: <20230809094059.595680-2-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809094059.595680-1-juerg.haefliger@canonical.com>
References: <20230809094059.595680-1-juerg.haefliger@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, 'Raw: <filename>' needs to be added to WHENCE for files that
must not be compressed. This means that such files need to be listed
twice ('File: <filename>' and 'Raw: <filename>') which is not pretty and
error prone. Also, the current implementation is broken for filenames
that contain quotes (") and it also requires grep'ing of WHENCE for every
processed line which slows things down.

Fix all of the above by introducing a new keyword 'RawFile' so that such
files are listed only once, quotes are handled correctly and grep is no
longer needed.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 copy-firmware.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 20746a47420b..1ae1e37c37e5 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -65,11 +65,11 @@ while test $# -gt 0; do
 done
 
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
-grep '^File:' WHENCE | sed -e 's/^File: *//g;s/"//g' | while read f; do
+grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g' | while read k f; do
     test -f "$f" || continue
     install -d "$destdir/$(dirname "$f")"
     $verbose "copying/compressing file $f$compext"
-    if test "$compress" != "cat" && grep -q "^Raw: $f\$" WHENCE; then
+    if test "$compress" != "cat" && test "$k" = "RawFile"; then
         $verbose "compression will be skipped for file $f"
         cat "$f" > "$destdir/$f"
     else
-- 
2.39.2

