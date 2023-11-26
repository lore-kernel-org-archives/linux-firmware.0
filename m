Return-Path: <SRS0=DA9k=HH=gmail.com=eschwartz93@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A4CC4167B
	for <linux-firmware@archiver.kernel.org>; Sun, 26 Nov 2023 17:03:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E740C433C7; Sun, 26 Nov 2023 17:03:06 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52F04C433C8
	for <linux-firmware@kernel.org>; Sun, 26 Nov 2023 17:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52F04C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-35cb5b21c41so1963915ab.1
        for <linux-firmware@kernel.org>; Sun, 26 Nov 2023 09:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701018184; x=1701622984; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8F+5YZfkN9RwE4Kd57T+zs4SS7L9mONtDm9TX27Wtyg=;
        b=Gb2cu/ZR/mcWwAHlX8FwNq3ruNYQ1Y5Ofz0afO5sWG3qOmrMDM1z8CoOn5lZ7m18Sg
         C/l1cObnGDxv3t93t72aK6eDXGH9OZhrpTqGHjHoNsbghLGr21E20d40qY0kq8qOwtKH
         n0FYa1MT5zEFXK524tF4BNY60LSrsn1n7gaMjfbv/OsKu/jZjsTQWvsZWULeOlcjbZ2h
         4oHJ2Eiv7cpQrGp/+IibV9PCdSKHhvkU5WsEKxYaV0PcZm05cGY7oJbFasnm2fmfef/g
         fOtmy4pDVM4Z5IpYMyjlViMjGP6WcPkShvJZlNTPdb9oayMeB65CSiexHsCxtDtbD7sK
         93pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701018184; x=1701622984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8F+5YZfkN9RwE4Kd57T+zs4SS7L9mONtDm9TX27Wtyg=;
        b=DB+a5gy3UCFoQI+ct9ZnSN1rSBtRhFvbhcyRtqhneTcyi02zNpLI0F9fzBapC5A4MG
         QBbRiRCsi5LSRRzOR2ej75cecxxgjD4oWmpRTbEy/OM+eBJ1+J6OyWkMuf5HEJCMbZZ1
         kfoXjYrgSvKMZ3dME77UqcDvVoLrxRfiBkPCzxLoqrS8L7LQq9H0Pv/vcD+GAd8fYrBv
         G0bwlDoPfS7vKiE7qxkUfib7RS9fhACe/LH978ngV7Ds/iYq+Fb6Kn3qzvGN9d4Jtw+S
         7ZxNlfbLfiVfh18u/MnibVuMPjsO6Qth+9JyIrcUGfSB/ZghCegy2koTNSWSceMtbQ4Q
         iMAg==
X-Gm-Message-State: AOJu0YyLmoWO09DgejdOrU7dAC3iDsTlAjCbqUa2bOKCBMliZj3lXJlE
	LH8qMS7R31Y6rq4UnySDpkyVDqy+tdk=
X-Google-Smtp-Source: AGHT+IGS6EiYk4ztuI2w2SnC1LP/x5gr5PuGUEfW+2dIYRhqrzOf2wfEJYppaXMywMNwTpZl5aDtlg==
X-Received: by 2002:a92:c249:0:b0:359:4199:1fea with SMTP id k9-20020a92c249000000b0035941991feamr16078814ilo.14.1701018183682;
        Sun, 26 Nov 2023 09:03:03 -0800 (PST)
Received: from acleverhostname.attlocal.net (108-200-163-197.lightspeed.bcvloh.sbcglobal.net. [108.200.163.197])
        by smtp.gmail.com with ESMTPSA id a12-20020a92c54c000000b0035b2eaa8b04sm2381092ilj.60.2023.11.26.09.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 09:03:03 -0800 (PST)
From: Eli Schwartz <eschwartz93@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: sam@gentoo.org
Subject: [PATCH] Makefile, copy-firmware: Use portable "command -v" to detect installed programs
Date: Sun, 26 Nov 2023 12:02:59 -0500
Message-ID: <20231126170301.1309596-1-eschwartz93@gmail.com>
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

