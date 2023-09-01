Return-Path: <SRS0=mAre=ER=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624D2CA0FE1
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Sep 2023 06:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28D86C433CB; Fri,  1 Sep 2023 06:52:39 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B29BBC433BC
	for <linux-firmware@kernel.org>; Fri,  1 Sep 2023 06:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B29BBC433BC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2947F4458E
	for <linux-firmware@kernel.org>; Fri,  1 Sep 2023 06:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1693551155;
	bh=UpMnAcAS6hPS/kr/8oBMTZzUN7IjXl07PmF8lgMRzdY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=O5mDB365bh7C7pMUrSnh4NFlGun98E79pPu91zZexwjmExEirYC5xqrOqMJUiowMH
	 BnvbarqJb6zl7J1PLsR9OCPslCmleehAL0ps8o07HYnqAG9J2XS7lTeSBgUc0ops2I
	 6RZ5UgUmwy4+2Za6CxbJTKy+Yn7dp6mQ82RD41zO0EjUoMU3HpBrjJgq6VJ+rE45i1
	 hf48gstWnRruoCgksPV5JhgXRWpbqdWcyLAqjUjFcPLQN2b1xV8Q6euTkJfBVE5uu4
	 qbilUTlEoIefr8GOdRTe0IgNQoh8GK7DrFThkIAvOzfA/OB+kT3cxLHGSvwdJz47J9
	 J+9kFpyzDs8wQ==
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-401e521122fso12654065e9.3
        for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 23:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693551154; x=1694155954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpMnAcAS6hPS/kr/8oBMTZzUN7IjXl07PmF8lgMRzdY=;
        b=fzfX5XJO1coN+yOEMTu8weKyQ7dtj9kM9QTpJuZo+sBxKqT8cV3mwscIt6+h9qNK1G
         gPLyD56iBf3sHPr6EsU7FmG/qa4ktxp4U0oP0QamE0OEFpFv5j3QVnQRQASAW96lY83t
         zyp6s2g+lWzP7MKCSSadGSYjhbG4JVhpaOWs/mZVblHuREb4hyOQzY7EWjE5ZLdAt1Vl
         eAyLNA/9afb/q1fVqJ0ZktOXSJD4ENUXA6Ba7R/YO6yJCwYtYAUHiLyf6aKRFIdF3pxF
         MjaO1vxaQvJ04GGvgW/PAY45Vsdlh655kH+1BqLBCqpsK6PRwynhhM24BOLlDRR3/4+g
         yhRQ==
X-Gm-Message-State: AOJu0Ywnrl4P633zxjJWDN0YUfmb+wY5GY1ucT+5TJmuH/7dSWAKJ3Vb
	Qdg1B2HkigZLtC2G30Ze8V+CZwIBsbuzP+mcdYztXLBZ7tCY7MIBOkQ9l5kyL0tB1cNaLzZjzv8
	JueSa9vGEktajbSePDUr0LsVT+2sCl0hw7l2Z3Q==
X-Received: by 2002:a05:600c:2981:b0:3fe:1db2:5179 with SMTP id r1-20020a05600c298100b003fe1db25179mr1091328wmd.19.1693551154795;
        Thu, 31 Aug 2023 23:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFebpXLZLv350yLKGMdgu1ivuZ2DVjDe8CGlQHjnMnwKs2gXDntkqfpIvwb9cvquWGV1CAbjA==
X-Received: by 2002:a05:600c:2981:b0:3fe:1db2:5179 with SMTP id r1-20020a05600c298100b003fe1db25179mr1091322wmd.19.1693551154554;
        Thu, 31 Aug 2023 23:52:34 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id l9-20020a1c7909000000b003fe1c332810sm7129665wme.33.2023.08.31.23.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 23:52:34 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: mario.limonciello@amd.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: juerg.haefliger@canonical.com,
	jwboyer@kernel.org,
	linux-firmware@kernel.org
Subject: [PATCH v2 1/3] check_whence: Recognize RawFile keyword
Date: Fri,  1 Sep 2023 08:52:24 +0200
Message-Id: <20230901065226.13607-2-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230901065226.13607-1-juerg.haefliger@canonical.com>
References: <41fb7957-98e8-4ad6-b958-1e673e7476e0@amd.com>
 <20230901065226.13607-1-juerg.haefliger@canonical.com>
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
index db6ac0f5d1c5..7e0a04f964da 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -7,11 +7,11 @@ from io import open
 def list_whence():
     with open("WHENCE", encoding="utf-8") as whence:
         for line in whence:
-            match = re.match(r'(?:File|Source):\s*"(.*)"', line)
+            match = re.match(r'(?:RawFile|File|Source):\s*"(.*)"', line)
             if match:
                 yield match.group(1)
                 continue
-            match = re.match(r"(?:File|Source):\s*(\S*)", line)
+            match = re.match(r"(?:RawFile|File|Source):\s*(\S*)", line)
             if match:
                 yield match.group(1)
                 continue
@@ -35,7 +35,7 @@ def list_whence():
 def list_whence_files():
     with open("WHENCE", encoding="utf-8") as whence:
         for line in whence:
-            match = re.match(r"File:\s*(.*)", line)
+            match = re.match(r"(?:RawFile|File):\s*(.*)", line)
             if match:
                 yield match.group(1).replace("\ ", " ").replace('"', "")
                 continue
-- 
2.39.2

