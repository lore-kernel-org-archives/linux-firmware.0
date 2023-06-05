Return-Path: <SRS0=1pox=BZ=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26070C7EE2D
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Jun 2023 14:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A66CC4339B; Mon,  5 Jun 2023 14:14:25 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B66F0C4339C
	for <linux-firmware@kernel.org>; Mon,  5 Jun 2023 14:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B66F0C4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f6dfc4dffaso42353055e9.0
        for <linux-firmware@kernel.org>; Mon, 05 Jun 2023 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685974461; x=1688566461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFDCOrlZwageD2SLHsDzltVsAFGW7bujNtd02NwwBUk=;
        b=iFreOT3Dr4+kABieC2StT9cE+a7qJr1PkO8pwGaaoMS4CHH6qnNcgJz0S8is497H40
         loVl40lOap/YdUmph5cLx4OP/MIDOEUpQL33MQfTCXnMbLzWd0LjvxJ4RrNGlB5I9EJu
         c1rXZwPn+U3ansoYVBN1yk7rKXFLirppoqG4lKme2tuOUDd9HsB0SBrs7OsqDc7QcPyk
         yKQT3CTf/faCXFDHaHD+rGVZ/ATLodY5GhQEbQnxQvodInIcDvKl/PKmvbMI03RpMIrp
         mUkW/alJRGIWClgXcFc+opQYvEnHQD0/zqUOAMjHoDRdvzRMgmq24qitKR6frX/BJeTY
         kOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685974461; x=1688566461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFDCOrlZwageD2SLHsDzltVsAFGW7bujNtd02NwwBUk=;
        b=X65dQ18tirZuhCfdq/gVt3gKXfTlJkgYzu9+nfqeAlgN7r8kFuDkGhjCwywEZYVgPo
         ZyoxuNcLbjqfgubOzAlLVpb/GbzcvLzSgCLo3iV0NIjh7NktJbueZnCh9EUHpfN+2p/j
         Xi9kDPnpI8sV+X2xbvkKhhjhrmaPkZLBACdn0/HaYFaXwMloVzSQHQcpsWqoMMV2p+rE
         xl4CdRuAUcT0Hsq16b+o/8DqiN8DT4v/7NAfIgz+n6XegEEnvvtc8jqPh/7gcT1m99Tk
         yhAEJ0vL29HH1aHxiXtMQqu67GgTY8FnNmrlWhq1be7ItJr3Oy1lfMDOrr+3VLh9evb+
         V2YQ==
X-Gm-Message-State: AC+VfDzw5dNiH7vg/hU58XWfgGJNkgB15nE+u4GxavDXGeCcRQ7moujK
	EcPH8JOqO8VI08DnkJdoE11E68uh+x0=
X-Google-Smtp-Source: ACHHUZ51e7d1Kh/1u9t4hw2J/+mdy/Wo8kof3mJdFo3LjW6sDs4ZKneURK47UQYvvZLxvoU0M3J3gw==
X-Received: by 2002:a1c:ed09:0:b0:3f6:7e6:44ea with SMTP id l9-20020a1ced09000000b003f607e644eamr7438442wmh.18.1685974461567;
        Mon, 05 Jun 2023 07:14:21 -0700 (PDT)
Received: from localhost ([2a00:5f00:102:0:3110:4340:17af:8ab1])
        by smtp.gmail.com with UTF8SMTPSA id f15-20020a7bcd0f000000b003f611b2aedesm10926152wmj.38.2023.06.05.07.14.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 07:14:21 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH v3 6/8] copy-firmware: drop obsolete backticks, quote
Date: Mon,  5 Jun 2023 14:58:10 +0100
Message-ID: <20230605141343.880621-8-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230605141343.880621-2-emil.l.velikov@gmail.com>
References: <20230605141343.880621-2-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emil Velikov <emil.velikov@collabora.com>

As mentioned by shellcheck backticks are considered legacy. Plus we
should ensure the output is quoted, otherwise we'll get word splitting.

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 copy-firmware.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index efbc3cb6..31e372ab 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -46,7 +46,7 @@ grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
         cp -d "$f" "$destdir/$f"
 
         if test "x$d" != "x"; then
-            target=`readlink "$f"`
+            target="$(readlink "$f")"
 
             if test "x$target" != "x$d"; then
                 $verbose "WARNING: inconsistent symlink target: $target != $d"
-- 
2.41.0

