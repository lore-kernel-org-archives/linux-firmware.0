Return-Path: <SRS0=1pox=BZ=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC41C7EE23
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Jun 2023 14:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B62A1C4339B; Mon,  5 Jun 2023 14:14:23 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD228C433EF
	for <linux-firmware@kernel.org>; Mon,  5 Jun 2023 14:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD228C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-30ad458f085so4502693f8f.0
        for <linux-firmware@kernel.org>; Mon, 05 Jun 2023 07:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685974460; x=1688566460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8nKRasrcPlQ4SJ3K/NqMzrVC8V86jQipg14cikSmus=;
        b=lYZL7p+S6HJo8A9NEbql7MaVxQC3CNcAgi0gBiY70KnbpAJTt4fh7IqHNZuNq6mHBM
         JKaZ5ooYKGFLT3Y2ww6BK8IinURuxPTuCwjbphQV1t3Qow8g5T0xLg9kat58sjTVa6GU
         INnvmOZnI9U76wL9U+QzyAbRB/9StZA4QkzftPpHNZqo3fXeTHbUxA43Lnu65EX4EX+m
         F/83Reqfc99z550NVNaF/Mleceuy5X0uVaURR0volZhQvXnX6brVDQ1Ji4c/exAjxxkF
         iXN0zhe9a2ZKTho7ToHo0+KmMg1secIbdh0y8+XcB9k1SvhKbI1corT/CPVHEtm8yvWl
         kKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685974460; x=1688566460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8nKRasrcPlQ4SJ3K/NqMzrVC8V86jQipg14cikSmus=;
        b=JrVDLJTdVIruBH6yx0oK3IWmtl1nbgNaAL+TvR8SWvltPuUG3yyfxDsc50CS5WlS09
         JLOqO3q11T+cve4l18c42jCckSjvBBOWKi49UGfSi2E5CgHnAvCaxi9B7WNjLKxyv5Wp
         5HVE+u1Tx2j3UUDRX4Erwzzi6X2+NHjU0G8tD9ytSu7cE+2bQHVTJoNiLb9zmM72aZGN
         EeLDBceLHEDikLE8vV09+q0K/nHQUqNQW68vslwVRQID1tpi8eE+PF8Cs0wZ3KVm1sq0
         yYM3upIu3JIdnmTquOw21hnERr5IiBn3yx77mkB8InX7wkwpApSC/7w9oQq3noh4yVOc
         92Bw==
X-Gm-Message-State: AC+VfDzPCHE3neqVx8wIKQ/Fb7S8d4iHLoeXJYjNihK4o6GgXPWid+5M
	9Vliql2hWdEpyErtKYTvmMHZrtGlEIw=
X-Google-Smtp-Source: ACHHUZ5DRm8B7XqTJ7MOfF0w9cIBu3F14GwcUFVJUJV5dCGBI7QqljE67F23Zark6pYWCQ+UxbQgvQ==
X-Received: by 2002:adf:ea90:0:b0:307:7959:6461 with SMTP id s16-20020adfea90000000b0030779596461mr5678130wrm.31.1685974460576;
        Mon, 05 Jun 2023 07:14:20 -0700 (PDT)
Received: from localhost ([2a00:5f00:102:0:3110:4340:17af:8ab1])
        by smtp.gmail.com with UTF8SMTPSA id v6-20020a5d6786000000b003078cd719ffsm9875732wru.95.2023.06.05.07.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 07:14:19 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH v3 5/8] copy-firmware: tweak sed invocation
Date: Mon,  5 Jun 2023 14:58:09 +0100
Message-ID: <20230605141343.880621-7-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230605141343.880621-2-emil.l.velikov@gmail.com>
References: <20230605141343.880621-2-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add space between the arguments and pattern and combine patterns where
possible.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index e8098271..efbc3cb6 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -31,14 +31,14 @@ while test $# -gt 0; do
     esac
 done
 
-grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
+grep '^File:' WHENCE | sed -e 's/^File: *//g;s/"//g' | while read f; do
     test -f "$f" || continue
     $verbose "copying file $f"
     install -d "$destdir/$(dirname "$f")"
     cp -d "$f" "$destdir/$f"
 done
 
-grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do
+grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
     if test -L "$f"; then
         test -f "$destdir/$f" && continue
         $verbose "copying link $f"
-- 
2.41.0

