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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20F1C43463
	for <linux-firmware@archiver.kernel.org>; Sat, 19 Sep 2020 19:18:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9F80921741; Sat, 19 Sep 2020 19:18:16 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F2F121707;
	Sat, 19 Sep 2020 19:18:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Egp6XFAV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F2F121707
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-wm1-f66.google.com with SMTP id b79so8701078wmb.4;
        Sat, 19 Sep 2020 12:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+3Mz4/+9a0coOca0fdPANIFtzolhAzjFp1ERVLTc9SM=;
        b=Egp6XFAVGoawY+3T7ES7RuwLHymnBzJeVX9snHwdKZrF+3AVrY6IpaGY4NTju0PhCh
         367sfBB5E0nWiKIw2++5xZfjb/poO6GEz1dgv4nmrDakdczgwz9HT0c11b26+pKLgkyy
         jo/qRTdB17HfOWw8alohpJ9EsXHwrqU+DPAP/Z5q4ysz5/vF8cAOb3DRbOCoq8ntcPSi
         pmnlwHvIe5DKfMnFhJV1gJt/3KGq+3pt48jWYTOn0Qg8FJbslnOTe3OWZHMXrOmapYG6
         nHiYFakgcUP12pP6ZUk8sFf35gt6zU1ZarrYcOOx2QmPwc/70AmRjk6V5bdc6JCvtDyU
         3IRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+3Mz4/+9a0coOca0fdPANIFtzolhAzjFp1ERVLTc9SM=;
        b=H74IUDx7KXWgUkHZUsmVng/vaWazkmrDht3xFE4FuUPMRc0QHRiUeIz9ItsUyLafxn
         iacA9ZpgMfwzeB5bNndNaNwYu8mIHOjkBhk8VtY9Dpe5C84k8EQ2bF8qeUzJq1k47iWA
         LAOq9xCaYfXllKgY3IJz8vw+9xyPAgNRSwtGK1QNnYIn4q8QxF49VvY7vc51pUqX5IiO
         TLj08edvlq7AzB9AHTlT9dVobWQrf6Dimz7ewu5dI749Pzb9DpoRy0churyN3TZJXbAz
         mdjVTMnhgc63dpcBxPRXTxPNVezbpCnIZK5G6qFYuwmoapQ2me5leln+1euReZFb7r+F
         gMuA==
X-Gm-Message-State: AOAM532BZYafFQB3SWYMYgdPQZpS3s8NBCoGQRhDl2iktFd/xR8VXm90
	Abp21WLHi7b3Whg/lWPPgDsWUbDnO4g=
X-Google-Smtp-Source: ABdhPJwxctiAyEtlO18xQomiDv6NkeDcCtH8h2qBTPEf2QPzVhHuP+Q7NTPuRKUIHqVGmJ8wDnXW2g==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr22640171wmh.71.1600543094315;
        Sat, 19 Sep 2020 12:18:14 -0700 (PDT)
Received: from morpheus.home.roving-it.com (2.e.6.5.c.a.a.1.a.8.0.3.1.e.3.c.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:c3e1:308a:1aac:56e2])
        by smtp.googlemail.com with ESMTPSA id f23sm26540493wmc.3.2020.09.19.12.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 12:18:13 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Peter Robinson <pbrobinson@gmail.com>,
	=?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Anusha Srivatsa <anusha.srivatsa@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tom O'Rourke <Tom.O'Rourke@intel.com>
Subject: [PATCH] linux-firmware: move i915 firmware symlinks to WHENCE
Date: Sat, 19 Sep 2020 20:18:03 +0100
Message-Id: <20200919191803.804897-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's a handful of firmware symlinks in the i915 firmware
directory, move the creation of these to the WHENCE file.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
CC: José Roberto de Souza <jose.souza@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Anusha Srivatsa <anusha.srivatsa@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Tom O'Rourke <Tom.O'Rourke@intel.com>
---
 WHENCE                | 8 ++++----
 i915/bxt_dmc_ver1.bin | 1 -
 i915/kbl_dmc_ver1.bin | 1 -
 i915/skl_dmc_ver1.bin | 1 -
 i915/skl_guc_ver6.bin | 1 -
 5 files changed, 4 insertions(+), 8 deletions(-)
 delete mode 120000 i915/bxt_dmc_ver1.bin
 delete mode 120000 i915/kbl_dmc_ver1.bin
 delete mode 120000 i915/skl_dmc_ver1.bin
 delete mode 120000 i915/skl_guc_ver6.bin

diff --git a/WHENCE b/WHENCE
index 884490d..4faf0d0 100644
--- a/WHENCE
+++ b/WHENCE
@@ -4012,15 +4012,15 @@ Driver: i915 -- Intel Integrated Graphics driver
 File: i915/skl_dmc_ver1_23.bin
 File: i915/skl_dmc_ver1_26.bin
 File: i915/skl_dmc_ver1_27.bin
-File: i915/skl_dmc_ver1.bin
+Link: i915/skl_dmc_ver1.bin -> skl_dmc_ver1_26.bin
 Version: DMC API/ABI ver 1 - release 27 for Skylake
 
 File: i915/bxt_dmc_ver1_07.bin
-File: i915/bxt_dmc_ver1.bin
+Link: i915/bxt_dmc_ver1.bin -> bxt_dmc_ver1_07.bin
 Version: DMC API/ABI ver 1 - release 07 for Broxton
 
 File: i915/kbl_dmc_ver1_01.bin
-File: i915/kbl_dmc_ver1.bin
+Link: i915/kbl_dmc_ver1.bin -> kbl_dmc_ver1_01.bin
 Version: DMC API/ABI ver 1 - release 01 for Kabylake
 
 File: i915/kbl_dmc_ver1_04.bin
@@ -4034,7 +4034,7 @@ File: i915/skl_guc_ver4.bin
 Version: Guc API/ABI ver 4 - release 3 for Skylake
 
 File: i915/skl_guc_ver6_1.bin
-File: i915/skl_guc_ver6.bin
+Link: i915/skl_guc_ver6.bin -> skl_guc_ver6_1.bin
 Version: Guc API/ABI ver 6 - release 1 for Skylake
 
 File: i915/skl_guc_ver9_33.bin
diff --git a/i915/bxt_dmc_ver1.bin b/i915/bxt_dmc_ver1.bin
deleted file mode 120000
index 173ccf5..0000000
--- a/i915/bxt_dmc_ver1.bin
+++ /dev/null
@@ -1 +0,0 @@
-bxt_dmc_ver1_07.bin
\ No newline at end of file
diff --git a/i915/kbl_dmc_ver1.bin b/i915/kbl_dmc_ver1.bin
deleted file mode 120000
index 914ca55..0000000
--- a/i915/kbl_dmc_ver1.bin
+++ /dev/null
@@ -1 +0,0 @@
-kbl_dmc_ver1_01.bin
\ No newline at end of file
diff --git a/i915/skl_dmc_ver1.bin b/i915/skl_dmc_ver1.bin
deleted file mode 120000
index 02e7b32..0000000
--- a/i915/skl_dmc_ver1.bin
+++ /dev/null
@@ -1 +0,0 @@
-skl_dmc_ver1_26.bin
\ No newline at end of file
diff --git a/i915/skl_guc_ver6.bin b/i915/skl_guc_ver6.bin
deleted file mode 120000
index 9bd545c..0000000
--- a/i915/skl_guc_ver6.bin
+++ /dev/null
@@ -1 +0,0 @@
-skl_guc_ver6_1.bin
\ No newline at end of file
-- 
2.26.2

