Return-Path: <SRS0=gQK0=C4=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3EA7C43463
	for <linux-firmware@archiver.kernel.org>; Sat, 19 Sep 2020 19:16:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A4D4E21741; Sat, 19 Sep 2020 19:16:50 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 317AF21707;
	Sat, 19 Sep 2020 19:16:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJToqrsu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 317AF21707
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-wm1-f67.google.com with SMTP id e17so8360048wme.0;
        Sat, 19 Sep 2020 12:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ud1Ll8cNGM6mGJdRZR5xVgEpMZ+UiRwca79mPkPgZkY=;
        b=qJToqrsuIA6DRyvirHXYq02Vzzk97ju7JkeDxmtOJfCECY0cu0vKU2oLfOxsfAtG6f
         rmje17vzBdons+BRcsf8jWgeEOa42ZGyRwBIrLq3eMlsJjnwZFD9XO+6xJIb7QbI8yIe
         QanuA4p5B4/tYnqBBjYl+vZdL4NRgf4WaIPH+FHyuq1Xr/uwgS/0CkwTf06Ts3/XjNdD
         b65l+jTIPdM1FUFLq0TPgQLzXwGCXWkYiKSOgwIT4rsV5GYZjPb5LMkBJee9wKObJt0+
         egiawnpFSCWXCYUO/uMN4iIRjflOiQ8DgzlPBX+/nl7QCn5ODntZOy9Kfw7x4jB43uZ5
         Hn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ud1Ll8cNGM6mGJdRZR5xVgEpMZ+UiRwca79mPkPgZkY=;
        b=tskbtkMyCu7OUtOkVsRRQFMDKT4YTEG8aK1aofN3tH4QAe1J7p4hTMs132fszd+VSm
         OKDP9OHsyzDhXGm1BPQ/LjBLl4fZIK5D8DxUe0i46u/zL5+U7kHJZaFKLyXAeZfcEAw+
         U1NkjKXscISMaFGWxmfAoosgEjpGXIjb+sfUwvcCVOCFF2gnfwx/CNeDG8Y0hZxUP7vt
         Queyvsz2M8h3Ae6IP4HGC9N818g6sxVqLKH4wMO5FwbDMH91IN580GLUnzSCQiUMX+By
         w16MjeQoS7kHNIrhkOiTqjWCEHV7dJjArSf1lTjEATCWy7qMD5FOh+3MxZsQ5rWNGkAC
         /ztA==
X-Gm-Message-State: AOAM532wnYWTKIV6vy6z3e73xw0RJJwH+nBYjjSryVK5RzjgPnTWp7qk
	1mKhIZVetjWe5ebTK7pROhpD6lbi9P4=
X-Google-Smtp-Source: ABdhPJxFwepywSF6DGi77HF1Z7idAze6dhNXjANCY3DalfHSH+bLEyArwNHwMGapzth5HCVYV3UQ0A==
X-Received: by 2002:a05:600c:20b:: with SMTP id 11mr22543971wmi.147.1600543008435;
        Sat, 19 Sep 2020 12:16:48 -0700 (PDT)
Received: from morpheus.home.roving-it.com (2.e.6.5.c.a.a.1.a.8.0.3.1.e.3.c.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:c3e1:308a:1aac:56e2])
        by smtp.googlemail.com with ESMTPSA id u66sm25956298wme.1.2020.09.19.12.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 12:16:46 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Luca Coelho <luciano.coelho@intel.com>
Subject: [PATCH] linux-firmware: move iwlwifi-7265D-10.ucode symlink to WHENCE
Date: Sat, 19 Sep 2020 20:16:33 +0100
Message-Id: <20200919191633.804757-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The iwlwifi-7265D-10.ucode firmware is a symlink to iwlwifi-7265-10.ucode
so move it to be created from the details in WHENCE.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
CC: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
CC: Luca Coelho <luciano.coelho@intel.com>
---
 WHENCE                 | 3 +--
 iwlwifi-7265D-10.ucode | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)
 delete mode 120000 iwlwifi-7265D-10.ucode

diff --git a/WHENCE b/WHENCE
index 0bdb19c..884490d 100644
--- a/WHENCE
+++ b/WHENCE
@@ -931,8 +931,7 @@ Version: 16.242414.0
 File: iwlwifi-7265-17.ucode
 Version: 17.bfb58538.0
 
-File: iwlwifi-7265D-10.ucode
-Version: 23.15.10.0
+Link: iwlwifi-7265D-10.ucode -> iwlwifi-7265-10.ucode
 
 File: iwlwifi-7265D-12.ucode
 Version: 25.17.12.0
diff --git a/iwlwifi-7265D-10.ucode b/iwlwifi-7265D-10.ucode
deleted file mode 120000
index 12cf51c..0000000
--- a/iwlwifi-7265D-10.ucode
+++ /dev/null
@@ -1 +0,0 @@
-iwlwifi-7265-10.ucode
\ No newline at end of file
-- 
2.26.2

