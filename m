Return-Path: <SRS0=MP8O=EQ=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B07C83F2E
	for <linux-firmware@archiver.kernel.org>; Thu, 31 Aug 2023 08:14:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 182DEC433C9; Thu, 31 Aug 2023 08:14:14 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 869B9C433CB
	for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 08:14:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 869B9C433CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C93A33F1A3
	for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 08:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1693469650;
	bh=s01DApk7IRc3Pzu/8v7bADrlAj+iQ6+mqMGDZ4b1lgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ORpF5SKetj3YkQDxtUIT03odWpIb/yzUdbYcJXUTbMZj59lvYM8nYZtkxcbcgdnyY
	 kbNxEGxF2hSvTRTB5KEPO8knVmyCePiUpoNHIEU15xsR2b+f2W0xRvYuM/TcGj8Pp7
	 1kqNyw4brTxMAiS+ym4fCMq/WNHYWIl9SBx4VYRYgcMQexprwmtptisqKbFvq8J/fs
	 q2JHYKO7SSI7MbY9YbooOuh3pd7Bnq/srlWvfLMAJQSTRXwZ4zvUHnN84r9XcZscR8
	 PwMM44OwXk99wmQwURDYgRV3kOKD+dG+huBJRcYxB/q/nyHH018PH7TO9HGE30XbWW
	 VMaIQamBAwLLA==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-401dba99384so3596105e9.3
        for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 01:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693469649; x=1694074449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s01DApk7IRc3Pzu/8v7bADrlAj+iQ6+mqMGDZ4b1lgI=;
        b=G6ybH+vOP358vw0UzdJO7H24c+X/GRy0F6SilFeGZruxge2G0hd6eZ5/jrwHfaI8Fm
         dhmABi8Jx1nD4tWCuOsbKTlSqswR6NhQYU4gL4C1TlC12xlDrf8TjyMYnj1tt/oW3aV/
         VdNAwfcQf44qVFw7/XI8fBgUttyQWdaxOVmro0Pyepy3Tf6REsRtjShY82EtQwC3VyPp
         DKKcRxUjRmFc3NfAmDNMz+iMyfseuAxRzNK/r29yJz/6Ndm99179D6mRnOn9s3UDHEOI
         B3i5oWudtnX+eFP+s5Mo5atgK07Ni0al17Xv0H8TUWLDn5aUpYmU7h7IzDdLoyEkS/bs
         IJ2g==
X-Gm-Message-State: AOJu0YygmkcVSd79uXz1qvTThx+6MglHyfHK04SPUnsUlqL91ZPpbsH8
	tzfkMt7hdbtTOjexEbpnbI1a94MLRhfst79zdQ7rLYqJjNwQicVvmM/heFHEXumYE8b3M+EJ4aO
	DEbtLEcLQdkEv5KljWHZqpiskobYevy/DlfussbhE5G3QzA==
X-Received: by 2002:a7b:c415:0:b0:3fe:dcd0:2e32 with SMTP id k21-20020a7bc415000000b003fedcd02e32mr3545792wmi.19.1693469649188;
        Thu, 31 Aug 2023 01:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvGj1AGdIfGtr+KU8MUsuhPfy7ue6dY3NIXyDfbUUK+BB+dKFnN3wB4S8gXMvELNJfyrohLQ==
X-Received: by 2002:a7b:c415:0:b0:3fe:dcd0:2e32 with SMTP id k21-20020a7bc415000000b003fedcd02e32mr3545787wmi.19.1693469648971;
        Thu, 31 Aug 2023 01:14:08 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c234b00b003fee8793911sm1146068wmq.44.2023.08.31.01.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 01:14:08 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [PATCH 1/3] check_whence: Recognize RawFile keyword
Date: Thu, 31 Aug 2023 10:13:43 +0200
Message-Id: <20230831081345.47699-2-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230831081345.47699-1-juerg.haefliger@canonical.com>
References: <20230831081345.47699-1-juerg.haefliger@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WHENCE and copy_firmware.sh now support a new keyword RawFile to list
files that must not be compressed. Update check_whence.py to recognize
that.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 check_whence.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/check_whence.py b/check_whence.py
index d45d90f8d720..936a3c480e33 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -6,11 +6,11 @@ from io import open
 def list_whence():
     with open('WHENCE', encoding='utf-8') as whence:
         for line in whence:
-            match = re.match(r'(?:File|Source):\s*"(.*)"', line)
+            match = re.match(r'(?:RawFile|File|Source):\s*"(.*)"', line)
             if match:
                 yield match.group(1)
                 continue
-            match = re.match(r'(?:File|Source):\s*(\S*)', line)
+            match = re.match(r'(?:RawFile|File|Source):\s*(\S*)', line)
             if match:
                 yield match.group(1)
                 continue
@@ -31,7 +31,7 @@ def list_whence():
 def list_whence_files():
     with open('WHENCE', encoding='utf-8') as whence:
         for line in whence:
-            match = re.match(r'File:\s*(.*)', line)
+            match = re.match(r'(?:RawFile|File):\s*(.*)', line)
             if match:
                 yield match.group(1).replace("\ ", " ").replace("\"", "")
                 continue
-- 
2.39.2

