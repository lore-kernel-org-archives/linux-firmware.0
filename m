Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA09DC636CC
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C53BDC433EF; Sat, 18 Feb 2023 18:46:36 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3314C4339B
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3314C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id bg25-20020a05600c3c9900b003e21af96703so541076wmb.2
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEwE+EYKXk2JOee59fcT1fF1dfNtOgko0FRqByUYEOY=;
        b=NB+zxTIpSbjarvBA1YuPXAoA78GtcriQ3QCg91TblHmISJLH+7XvND+2JZGId1Og/c
         CiKChzUoSDxsX1kFf9GbtOx0z8QRLc2tDTQ5i5Uwf4al89x5dgmgt0WJUiu7aAZ8086S
         Gt/L+amBTgyEaJvOdUqVcBEYl8rT2I11ZMekiO/aQpFpzqfFDy4XSesnAEf3oshRvz5i
         0sQfbR+IJTz3B5QcHim8MkslJH1IkNMInq6EZT65g95tJNSae3IxMF6dEnK2pwGegLG2
         zjZftuQd33CgHh6XYiqWwhhFTMmG5Thpjs77meu3u/7irXrDr/gXDKl+AfTx01w74833
         NPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TEwE+EYKXk2JOee59fcT1fF1dfNtOgko0FRqByUYEOY=;
        b=H3oSjoMXiv606KS4naA2okrGlq14o7HG7e5DDVkPgl/qIVUVRaGHEEnUB1P1I/3FhD
         SVxyps9XqSdmfxxVFUCd6lT5OQasT1tuv4O77BVyCGV2jMb5wnaZ26JUH7AUKW2NYRmC
         gihBtASRpYN6VYiqyS/ROHcmBowIippd8DFzvWUby77Wr/9nmOBW0r5m+4bx9P9E3Bxs
         QbG7Px8BWlWciiQW0BRUf5bnHveArhLZXFarBdUPBZiiscJOOsH8hN6DGo0du1rBUCc/
         YuLDW1sItnUz2dMgvWkSvJJ78+Lel3Z5rSrZUfhYME4liIyf0Ii3JA5DgDw9UtV/Kq4I
         QhVg==
X-Gm-Message-State: AO0yUKUUKeTHk6StSVssglE5gzHD3GQMP+Yb5boaOMnjQ4FRZQD4EoUX
	YFLrQ+LA0Jx6+Z57aHJJadSHdsnvAtQ=
X-Google-Smtp-Source: AK7set8mj9C1ore34AEV68kUawW7E4QYSfHse2pTO3lMmKKT1TZXBNx80BNzYZ/iu3dEfshhsGFsNw==
X-Received: by 2002:a05:600c:2211:b0:3e1:374:8b66 with SMTP id z17-20020a05600c221100b003e103748b66mr3746572wml.40.1676745993988;
        Sat, 18 Feb 2023 10:46:33 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id l33-20020a05600c1d2100b003db012d49b7sm6076038wms.2.2023.02.18.10.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:33 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 08/15] check_whence: error if File: is actually a link
Date: Sat, 18 Feb 2023 18:46:14 +0000
Message-Id: <20230218184621.2026504-9-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows us to remove the -d aka --no-dereference --preserve=links
from the copy command.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 check_whence.py  | 5 +++++
 copy-firmware.sh | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/check_whence.py b/check_whence.py
index 130966e..92b104e 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -56,6 +56,11 @@ def main():
         sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
         ret = 1
 
+    for name in set(link for link in whence_files if os.path.islink(link)):
+        sys.stderr.write('E: %s listed in WHENCE as File, but is a symlink\n' %
+                         name)
+        ret = 1
+
     for name in sorted(list(known_files - git_files)):
         sys.stderr.write('E: %s listed in WHENCE does not exist\n' % name)
         ret = 1
diff --git a/copy-firmware.sh b/copy-firmware.sh
index 656b0ec..e3f3176 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -34,7 +34,7 @@ done
 grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
     $verbose "copying file $f"
     install -d $destdir/$(dirname "$f")
-    cp -d "$f" $destdir/"$f"
+    cp "$f" $destdir/"$f"
 done
 
 grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do
-- 
2.39.2

