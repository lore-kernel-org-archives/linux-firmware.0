Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A39FC6379F
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 557B9C4339B; Sat, 18 Feb 2023 18:46:38 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C906C433D2
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C906C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id e20so1055494wra.4
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0U57c3/3NgGksHO+203ZH8FaSKOVo2PNgGgaw8njWE=;
        b=DNQw7hx2xPHvm/rjiGbw2OWepVnuOrx1uzrllm46iehcDG/YsCPpirOCxMAnRHhjLK
         MA2Yh2eC6yM5d0beFpHTrsvo7H30TNsyXSCmuybnw+3o+NllqUjGCUKV6rhgNtntE7sM
         oieRI23SLuYbxooqolMPZjY4XYvZz6IAr92fn9QdKXGH6JOUnWhLyZFRH6llznEZmDs5
         /p57b/wAgO7MM1vNSsVjsVOrx/n7jnd7xD1bEbJ3JdqThaH1W9UVuVK34Z8O8ZxiEY2o
         gDMogazFHagERAYJPaIcUAY/yCCOOzwwB02VEYAR6P5MiWapWCW04n6dnsurIIImFS+1
         UDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0U57c3/3NgGksHO+203ZH8FaSKOVo2PNgGgaw8njWE=;
        b=DhiwA3iqUQpebugKlPl3aj0Fl7jUmHx2OzQ5hjMUczQAa+nf+P3WaW12dl7WdrV87j
         3j+BJpMbLyS4SYw3UfmMkVa7iYHTNs/P+inhAcmVBTwr9sD/zUZczyDH9IA85VKHl6K6
         AOeUy1qHhKSt2PiPXcGW2gCjd2ARsrmy7fDczEg1UB7dwHM2YPVrJupK8xWH8p6CTf5t
         PuXGvsSdbrzrCuWwybQ2hSg8yhJ7wWDZp6z9EhewFu0X0sMS7dv+gHmWhBa+N7/S9lPy
         IJeI/NDiMrGwUyufuYT7fDNKjKpEH75RvYqnkrQk3FFrSaH8+XbbVCvTtESJzYi7Ztt1
         pO8A==
X-Gm-Message-State: AO0yUKWz+NUCQbCAtJwjsjGOilYdrnOk9I/J62njQdu+tNIKqFvulo/9
	YZKhXzkAq3t0ETv/Nm53knIrLRZryK8=
X-Google-Smtp-Source: AK7set/Up0wHIHnHMDq9gAg4X0CT3jMF0EXgoAUnMd52uPH3RSXWpCCCJF/6fNDIigAya4ZT4GtSBw==
X-Received: by 2002:adf:ebcf:0:b0:2c5:5ff8:6b01 with SMTP id v15-20020adfebcf000000b002c55ff86b01mr2666644wrn.1.1676745995455;
        Sat, 18 Feb 2023 10:46:35 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id i16-20020a5d5590000000b002c5584d0e3dsm7582656wrv.24.2023.02.18.10.46.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:34 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 09/15] check_whence: error if symlinks are in-tree
Date: Sat, 18 Feb 2023 18:46:15 +0000
Message-Id: <20230218184621.2026504-10-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently we have no symlinks in-tree. Add a simple check, ensuring they
don't get added in the future.

This allows us to remove the clunky symlink checking code in
copy-firmware.sh

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 check_whence.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/check_whence.py b/check_whence.py
index 92b104e..75fd3ad 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -32,6 +32,14 @@ def list_whence_files():
                 yield match.group(1).replace("\ ", " ")
                 continue
 
+def list_whence_links():
+    with open('WHENCE', encoding='utf-8') as whence:
+        for line in whence:
+            match = re.match(r'Link:\s*(.*) ->', line)
+            if match:
+                yield match.group(1).replace("\ ", " ")
+                continue
+
 def list_git():
     with os.popen('git ls-files') as git_files:
         for line in git_files:
@@ -41,6 +49,7 @@ def main():
     ret = 0
     whence_list = list(list_whence())
     whence_files = list(list_whence_files())
+    whence_links = list(list_whence_links())
     known_files = set(name for name in whence_list if not name.endswith('/')) | \
                   set(['check_whence.py', 'configure', 'Makefile',
                        'README', 'copy-firmware.sh', 'WHENCE'])
@@ -61,6 +70,10 @@ def main():
                          name)
         ret = 1
 
+    for name in set(link for link in whence_links if os.path.islink(link)):
+        sys.stderr.write('E: %s listed in WHENCE as Link, is in tree\n' % name)
+        ret = 1
+
     for name in sorted(list(known_files - git_files)):
         sys.stderr.write('E: %s listed in WHENCE does not exist\n' % name)
         ret = 1
-- 
2.39.2

