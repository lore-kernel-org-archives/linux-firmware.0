Return-Path: <SRS0=DA9k=HH=gmail.com=eschwartz93@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4953BC4167B
	for <linux-firmware@archiver.kernel.org>; Sun, 26 Nov 2023 17:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20277C433C8; Sun, 26 Nov 2023 17:02:12 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 34EEFC433C7
	for <linux-firmware@kernel.org>; Sun, 26 Nov 2023 17:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 34EEFC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7b3968cc62aso13536539f.0
        for <linux-firmware@kernel.org>; Sun, 26 Nov 2023 09:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701018130; x=1701622930; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8F+5YZfkN9RwE4Kd57T+zs4SS7L9mONtDm9TX27Wtyg=;
        b=jFs4wuRUFp3VCHlhRz+BBie2FCeEJddGIjnYoBVdB44bhNVMQNQKTdeKf27+GfCBeS
         HrCegVXD5PkMTpbRkztE2+B1lNLnyomcWqH0e5EsAzhNA425nD1V73qHe1johKvnW1fB
         F+aNNAJMpQwGM94zQt+qcAmtAoTbL5Rna+h/PFalpIYmg5LHyfImk4q+n+VXmv9a49Bj
         iH2/g/5EdZXPfyMB12qOASE4KquOu2F15LBhKP3YabTSNSQsa6OIdZtgSMPqQDkjwYBf
         vNg4QAStWRPdxW9ERi5sxSeO+N2Lh4PMGufUXnrp3+4E5TawafohhfXs/kuiwKCwU+qy
         se2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701018130; x=1701622930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8F+5YZfkN9RwE4Kd57T+zs4SS7L9mONtDm9TX27Wtyg=;
        b=AS1RguL/B9KtUuLiw64XfIYIlZo+6jh/4QKKXx79tyw2S2WU4ZICxB9nx0afEfKmPE
         hR+f93vaxVZWPSKaBOKBuz/irP3RJG2r9sdxf6oW7Zp3R7OpaZ/hEzTyF6btXMJmcs/S
         pg0QLWnh8SJZXgitxBqDLcpNpRy9GFABY2I2nr1ugvn5K8NLYvh7L7Fc7GeVzmo1GJLJ
         yfJSBUgVqTpg1iC4gEvHIWhbQaQGCsVbeinIRy0fKO+93+AWAIgVV/oVgQLWo59iBnLO
         XfW/MJhYqiBHvlW9Em0kIX+Xu14Zw67kgw0rnVaTzLF+7RmuzRO0XMAVISZy1TATGUok
         8Xsw==
X-Gm-Message-State: AOJu0YzQq1JhJViCMQG93Hjq8X/YowGtBFFy11OBBdC81xfoqaMfTsqr
	rURRbQIGaBSOVQaC4lQ18CgZvqS2O5Q=
X-Google-Smtp-Source: AGHT+IH5wC6F1J5GyXv9xVoXk4nDCCMqjen/Jufn0uwpOpbGvy5A+wiB6HctTi5WTOtNr79apOLjOQ==
X-Received: by 2002:a6b:5918:0:b0:7b3:7f27:750d with SMTP id n24-20020a6b5918000000b007b37f27750dmr6189803iob.8.1701018129590;
        Sun, 26 Nov 2023 09:02:09 -0800 (PST)
Received: from acleverhostname.attlocal.net (108-200-163-197.lightspeed.bcvloh.sbcglobal.net. [108.200.163.197])
        by smtp.gmail.com with ESMTPSA id m8-20020a056638270800b00466714033desm1954292jav.27.2023.11.26.09.02.08
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 09:02:09 -0800 (PST)
From: Eli Schwartz <eschwartz93@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: [PATCH] Makefile, copy-firmware: Use portable "command -v" to detect installed programs
Date: Sun, 26 Nov 2023 12:01:51 -0500
Message-ID: <20231126170207.1309537-1-eschwartz93@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "which" utility is not guaranteed to be installed either, and if it
is, its behavior is not portable either. This means that when rdfind /
pre-commit are installed, the `which` check will report a fatal error
because the which tool did not exist and the shell returned a nonzero
status when attempting to fork+exec. If it did exist, it might not be an
implementation of `which` that returns nonzero when commands do not
exist.

Conversely, the "command -v" shell builtin is required to exist in all
POSIX 2008 compliant shells, and is thus guaranteed to work everywhere.

For some in-depth discussions on the topic, see:
- https://mywiki.wooledge.org/BashFAQ/081
- https://unix.stackexchange.com/questions/85249/why-not-use-which-what-to-use-then/85250#85250

Examples of open-source shells likely to be installed as /bin/sh on
Linux, which implement the 15-year-old standard: ash, bash, busybox,
dash, ksh, mksh and zsh.

A side benefit of using the POSIX portable option is that it requires
neither an external disk executable, nor (because unlike "which", the
exit code is reliable) a subshell fork. This therefore represents a mild
speedup.

Signed-off-by: Eli Schwartz <eschwartz93@gmail.com>
---
 Makefile         | 2 +-
 copy-firmware.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 1d28d8a..f7e6323 100644
--- a/Makefile
+++ b/Makefile
@@ -6,7 +6,7 @@ FIRMWAREDIR = /lib/firmware
 all:
 
 check:
-	@if ! which pre-commit >/dev/null; then \
+	@if ! command -v pre-commit >/dev/null; then \
 		echo "Install pre-commit to check files"; \
 		exit 1; \
 	fi
diff --git a/copy-firmware.sh b/copy-firmware.sh
index f9b1f0f..6f2268b 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -69,7 +69,7 @@ if [ -z "$destdir" ]; then
 	exit 1
 fi
 
-if ! which rdfind 2>/dev/null >/dev/null; then
+if ! command -v rdfind >/dev/null; then
 	echo "ERROR: rdfind is not installed"
 	exit 1
 fi
-- 
2.41.0

