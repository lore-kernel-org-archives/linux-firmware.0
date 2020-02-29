Return-Path: <SRS0=U1HG=4R=chromium.org=briannorris@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B996DC3F2CD
	for <linux-firmware@archiver.kernel.org>; Sat, 29 Feb 2020 01:33:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A9EF8246A3; Sat, 29 Feb 2020 01:33:00 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73116246A2
	for <linux-firmware@kernel.org>; Sat, 29 Feb 2020 01:33:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QAZ78tSd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73116246A2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=briannorris@chromium.org
Received: by mail-pf1-f178.google.com with SMTP id i13so2607668pfe.3
        for <linux-firmware@kernel.org>; Fri, 28 Feb 2020 17:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kihcOsqZE1BnfxesPaJZ0V8twnwz8HcPryt9mWJnd0M=;
        b=QAZ78tSdC3xOa2c2yoJ2/2JpjKdtvyANs8B0C/vmd7GSFGOq+093LuSW8e2IngeXWS
         2XsQEUGYLdsULXVRMrDC5os+p5uATrVj0teky55FBo1wtVPMV8bl/q1WowBf/EgjS+i3
         KJcqJHTkHMPDrrzzQAOHwls98bpXG1hqhKT+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kihcOsqZE1BnfxesPaJZ0V8twnwz8HcPryt9mWJnd0M=;
        b=YpLVqrpnbIw24owR6pBm0GwLj5TDsU321IeGeCFz+WUlwRBv+mIvQE2NhJhsmJxxRx
         N4YqhpnuMnSNx8OlW3vj6W7mlinP+q+IUSp4RWIgSZi752ULOEAzohjr//YssvamwtEl
         ahhw53xJ2PAbq0HPl0c8djZTj1ulnbQAwF2FydWUUjaGoooh3Pwpt9aHgjKjHJndgtq2
         6zf9eHKxzvTIaNWSCrrZQrnAqChw+/OR036+bAdPp8TVgHGXYAZfgot29RI0+5d9HP/f
         G+jmNpCkZOv3MXLChpHh09W8d5vaoBObsqtBKEO8lBU7eaSwlgqW752RXwaGsYwMo2eQ
         o/ZQ==
X-Gm-Message-State: APjAAAVHYbZRPjOY/qT5Q1QEnHW/tzOXgHL2GY209x6LpcVDP/ZMXeXZ
	jkSLKw+LkIq/vL4JsLaDCg0k1aCml9o=
X-Google-Smtp-Source: APXvYqxQVRFAjPQIAV0ihKincMXA8qQ3G+C8Psb37ygpYVoc8s7e+T9o9ZjHj6LFQi/wyC8O+o4Nrg==
X-Received: by 2002:a63:f74a:: with SMTP id f10mr7167348pgk.360.1582939979439;
        Fri, 28 Feb 2020 17:32:59 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:534:b7c0:a63c:460c])
        by smtp.gmail.com with ESMTPSA id mr7sm15201pjb.12.2020.02.28.17.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 17:32:58 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Brian Norris <briannorris@chromium.org>
Subject: [PATCH linux-firmware] Makefile: improve `make check` usefulness
Date: Fri, 28 Feb 2020 17:32:48 -0800
Message-Id: <20200229013248.121115-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Silence the make echo'ing, so the output is cleaner.

Add an exit code to check_whence.py, so we can get a real failure for
bad WHENCE files.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 Makefile        | 2 +-
 check_whence.py | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 16b5b1a02a49..e1c362f36650 100644
--- a/Makefile
+++ b/Makefile
@@ -6,7 +6,7 @@ FIRMWAREDIR = /lib/firmware
 all:
 
 check:
-	./check_whence.py
+	@./check_whence.py
 
 install:
 	mkdir -p $(DESTDIR)$(FIRMWAREDIR)
diff --git a/check_whence.py b/check_whence.py
index 4adbfc30d72d..04f41dfc5f9e 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -33,6 +33,7 @@ def list_git():
             yield line.rstrip('\n')
 
 def main():
+    ret = 0
     whence_list = list(list_whence())
     known_files = set(name for name in whence_list if not name.endswith('/')) | \
                   set(['check_whence.py', 'configure', 'Makefile',
@@ -42,6 +43,7 @@ def main():
 
     for name in sorted(list(known_files - git_files)):
         sys.stderr.write('E: %s listed in WHENCE does not exist\n' % name)
+        ret = 1
 
     for name in sorted(list(git_files - known_files)):
         # Ignore subdirectory changelogs and GPG detached signatures
@@ -55,6 +57,8 @@ def main():
                 break
         else:
             sys.stderr.write('E: %s not listed in WHENCE\n' % name)
+            ret = 1
+    return ret
 
 if __name__ == '__main__':
-    main()
+    sys.exit(main())
-- 
2.25.0.265.gbab2e86ba0-goog

