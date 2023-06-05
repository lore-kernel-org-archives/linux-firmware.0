Return-Path: <SRS0=1pox=BZ=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C4FC7EE2D
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Jun 2023 14:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2EB9C4339C; Mon,  5 Jun 2023 14:14:21 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A339C433EF
	for <linux-firmware@kernel.org>; Mon,  5 Jun 2023 14:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A339C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f7378a74faso13170835e9.0
        for <linux-firmware@kernel.org>; Mon, 05 Jun 2023 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685974458; x=1688566458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Qn6RE/pj9PBqmTEEnQNi68nKQQoyFmHpgbJaEaLbsU=;
        b=OrEcu/SoG6tBDJRBSwYDAjpi1turOkIl/9ploqFc4HacN/Ehd/8qiIdthPJ3p5khK/
         AKBx8WjEwroH0n+iRZTRLpsLRL930YoH0+Y5ETh3xbQGGq8KdfRAHc51dyuxx8CzI0Cv
         9cddQd3c9qPaZZM87kwFqJkLuDPMaa21XCzVAgwPVtY3nnm+7YSgtbrQetWiS7FS/Hon
         4oYYRj5r1f0YcPQY8B4DyJSKrIKA2b4f5yW2QZ32M2CLoM9mwFX648atgt62k6C1dG9c
         KCSoc96vjSXpIJwBfP7MFHpH9FGfN7SuYg030AfWORzEnMmZnlUENbZE6q7YYMkL74p5
         qhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685974458; x=1688566458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Qn6RE/pj9PBqmTEEnQNi68nKQQoyFmHpgbJaEaLbsU=;
        b=GaGpVkNSO7bIALtGe2vFlzuZY/j2rKpDETMIiPbFBlbGrD2yY8iw75Av1ZRXgpzLQS
         N/v3BLkc6D4TMvkh7uDMDB3S7blglT+3q5GeyQgSBE7aaLIBzUsSDmgrcOG81B6gWkni
         zx9Y+cnTIMQyuwYW44VNWseukU7tKRzRbRz/I6thiUG9PvPAm6MSDHvHUIjXDHy4eicY
         cBDgdivfYXVDSeZQTq3zEfebfcIWUiajtqFfLTrzhxBmFWkXk12YTIkzuSTPER7+B2Dq
         9xUqE8dAyGSmO54+JY1ZhP9wIMe+WBDdTnVTAcFK1Ub20WqS/cZwDPr6hf2QaLs5TziH
         MlPw==
X-Gm-Message-State: AC+VfDyF20x/u00sAIE7wh2gJyW71AFgPI/r5rbUM/Shby6SW3tKVo/S
	07W5ck65o/nYfbwp5gLCFwaqeE6YxhI=
X-Google-Smtp-Source: ACHHUZ7On7WIN0fleY+V4OLidgvXL4ds4tyjWWBSsh4OtOae9NNhK7/D/4bvnovbjPZCNCCnLzk/Bg==
X-Received: by 2002:a05:600c:202:b0:3f7:b1dd:9553 with SMTP id 2-20020a05600c020200b003f7b1dd9553mr2193178wmi.14.1685974458159;
        Mon, 05 Jun 2023 07:14:18 -0700 (PDT)
Received: from localhost ([2a00:5f00:102:0:3110:4340:17af:8ab1])
        by smtp.gmail.com with UTF8SMTPSA id i10-20020a05600c290a00b003f7e34c5219sm2879906wmd.42.2023.06.05.07.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 07:14:17 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH v3 3/8] check_whence: error if symlinks are in-tree
Date: Mon,  5 Jun 2023 14:58:07 +0100
Message-ID: <20230605141343.880621-5-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230605141343.880621-2-emil.l.velikov@gmail.com>
References: <20230605141343.880621-2-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently we have no symlinks in-tree. Add a simple check, ensuring they
don't get added in the future.

This allows us to remove the clunky symlink checking code in
copy-firmware.sh

v2:
 - tweak helper to produce link and target (based off Adam's patch)

v3:
 - honour quoted target/linkname

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 check_whence.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/check_whence.py b/check_whence.py
index 93ff330d..2e6950a8 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -36,6 +36,23 @@ def list_whence_files():
                 yield match.group(1).replace("\ ", " ").replace("\"", "")
                 continue
 
+def list_links_list():
+    with open('WHENCE', encoding='utf-8') as whence:
+        for line in whence:
+            match = re.match(r'Link:\s*(.*)', line)
+            if match:
+                linkname, target = match.group(1).split("->")
+
+                linkname = linkname.strip().replace("\ ", " ").replace("\"", "")
+                target = target.strip().replace("\ ", " ").replace("\"", "")
+
+                # Link target is relative to the link
+                target = os.path.join(os.path.dirname(linkname), target)
+                target = os.path.normpath(target)
+
+                yield (linkname, target)
+                continue
+
 def list_git():
     with os.popen('git ls-files') as git_files:
         for line in git_files:
@@ -45,6 +62,7 @@ def main():
     ret = 0
     whence_list = list(list_whence())
     whence_files = list(list_whence_files())
+    links_list = list(list_links_list())
     known_files = set(name for name in whence_list if not name.endswith('/')) | \
                   set(['check_whence.py', 'configure', 'Makefile',
                        'README', 'copy-firmware.sh', 'WHENCE'])
@@ -65,6 +83,10 @@ def main():
                          name)
         ret = 1
 
+    for name in set(link[0] for link in links_list if os.path.islink(link[0])):
+        sys.stderr.write('E: %s listed in WHENCE as Link, is in tree\n' % name)
+        ret = 1
+
     for name in sorted(list(known_files - git_files)):
         sys.stderr.write('E: %s listed in WHENCE does not exist\n' % name)
         ret = 1
-- 
2.41.0

