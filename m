Return-Path: <SRS0=/6+m=46=citrix.com=andrew.cooper3@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0ECCCD184
	for <linux-firmware@archiver.kernel.org>; Tue, 21 Oct 2025 13:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B144C4CEFD; Tue, 21 Oct 2025 13:21:04 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C19E3C4CEF1
	for <linux-firmware@kernel.org>; Tue, 21 Oct 2025 13:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C19E3C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=citrix.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee12807d97so5248945f8f.0
        for <linux-firmware@kernel.org>; Tue, 21 Oct 2025 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1761052860; x=1761657660; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ltda55UgBC8Yi8tix4vySU0W7q9UncKBEhlpiCw+xM=;
        b=kO866ZPrSAm9hVCUuzqoYjWJURco8pj5RFygOs086ZNtKN1mZD8LhskEAko0a1Swyy
         RUSNYQ2ksSsA3Abm9KvQ8+TAm07eksR3I+pIL+uOG8YTZVHLP/7X6JIxwqKD+qHArJi3
         8ydEbOj95FQtclSp/p3758KHcNBqkJ7zXX9J4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761052860; x=1761657660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ltda55UgBC8Yi8tix4vySU0W7q9UncKBEhlpiCw+xM=;
        b=QbgiMtxfyX21M6OHC9IAc4waOWTS7fmsi4974fIFFYoMUunmwLSJ2xXXD9eckbne7W
         dS/5SkWep8urQ7kaix16mMY+b7FPTOuN2tjqXQexyoniRSF7RiH2GnTh1ZcDlOVcfGue
         X78DVPz0x5e9YF3B5eXFE8Hr2TPzP5Npgke8yBRa/Vd3/EQ83o4NACrQkEtJ3W3xjkAS
         6rpmHAqCJ4m5vjXrg1yyJR5IOpzQjegSUY2X53da+6cpPrwNOfFDYOmNDXMZSm9wYehe
         fNvRlt8degcXVjoDKvbnrtCQ9e2IesTlw/m3kN16Jhmuyu2nv/chkAEpJhKIO9QzSwhG
         ofqA==
X-Gm-Message-State: AOJu0YxRpLyB2yuV2xRNpZMvf6uzQgPVzbQW0X1uq9FGBIGl2qjWlmiV
	8xFDMlPMKXonEu0kRsxi/IMua2Obd/OAMrXIuyRqOtjki+L/JuW9osWlnoGw2Ov90ceYjNxN4ud
	n+hbiKDLjHQ==
X-Gm-Gg: ASbGncsAV792QceaiEhuUl1gVRAupeOkB+Ly+taQ/Gpf4dWeE8n/L2dHCBnU86oTFjN
	1k68m5e03LFsPfLJH2wYH7bJSoJEQ0aT5V3RGXfDKHXYJvDpccQg2DJv6RN1tYdnaQr+tJo1OQ/
	4HnbXmqFG4JSUjdn6U8FYK/4eTE4t+dG62wN6cDcfc12OhPq5UYnbjfcPsQFLbepe5XM6oP3NEJ
	QUSwMrYMPk9oX8XjmOVN9BROw2u+qYozW5MT5CUYHJrtTiw4D2nT2u1n/hzegyAPTkV4W33OGOw
	tSg5Ct1MrhrBXRHEVNZStMSLC6a3kl3RtH/hxOV0c055ivM8zzD/8eEGJo0NKgWKk5S53tPz+rF
	p8RHOia2i97ZYYiAobiTxVbrjOVrbJLVpL/fWTLGDgLdYsrvBRZc9B5lpwZtfrZasqqqJbjBv2B
	Ezd7m/y/8VmV0i14r7C3g6u9KiNVwK4RLhHIwhBRCeCmkEbcswK+0=
X-Google-Smtp-Source: AGHT+IF3K/fE5FI+106mlFlfM3i+BLdCk/xbYnjI5cNOdJl2OyIZ+QYq3uIUMjcpNVmkQ64MgiYg4w==
X-Received: by 2002:a05:6000:1869:b0:427:79f:dcd8 with SMTP id ffacd0b85a97d-427079fdd00mr10637448f8f.55.1761052859693;
        Tue, 21 Oct 2025 06:20:59 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net. [78.149.11.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3affsm20162186f8f.12.2025.10.21.06.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 06:20:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware <linux-firmware@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	John Allen <john.allen@amd.com>
Subject: [PATCH] amd-ucode: Fix minimum revisions in README
Date: Tue, 21 Oct 2025 14:20:56 +0100
Message-Id: <20251021132056.3158340-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... to match the minimum revisions stated in the binaries.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: John Allen <john.allen@amd.com>
---
 amd-ucode/README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/amd-ucode/README b/amd-ucode/README
index 669fbc19084d..0f6d6f9f5811 100644
--- a/amd-ucode/README
+++ b/amd-ucode/README
@@ -62,13 +62,13 @@ Microcode patches in microcode_amd_fam19h.bin:
   Family=0x19 Model=0x7c Stepping=0x00: Patch=0x0a70c008 Length=5568 bytes
   Family=0x19 Model=0xa0 Stepping=0x01: Patch=0x0aa00116 Length=5568 bytes
   Family=0x19 Model=0xa0 Stepping=0x02: Patch=0x0aa0021c Length=5568 bytes
-    Minimum base ucode version for loading: 0x0aa00219
+    Minimum base ucode version for loading: 0x0aa00218
 
 Microcode patches in microcode_amd_fam1ah.bin:
   Family=0x1a Model=0x02 Stepping=0x01: Patch=0x0b002151 Length=14368 bytes
     Minimum base ucode version for loading: 0x0b002140
   Family=0x1a Model=0x11 Stepping=0x00: Patch=0x0b10104e Length=14368 bytes
-    Minimum base ucode version for loading: 0x0b001040
+    Minimum base ucode version for loading: 0x0b101040
 
 NOTE: For Genoa (Family=0x19 Model=0x11) and Bergamo (Family=0x19 Model=0xa0),
 either AGESA version >= 1.0.0.8 OR a kernel with the following commit is

base-commit: 6a0152a5d1a9d7699e13ca7ed81df2caa1262a77
-- 
2.39.5

