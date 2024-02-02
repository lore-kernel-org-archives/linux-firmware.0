Return-Path: <SRS0=CsBo=JL=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAAEC4828F
	for <linux-firmware@archiver.kernel.org>; Fri,  2 Feb 2024 14:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 546E5C433C7; Fri,  2 Feb 2024 14:41:30 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79AC1C433F1
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 14:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79AC1C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DFE6D3FE40
	for <linux-firmware@kernel.org>; Fri,  2 Feb 2024 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1706884880;
	bh=y1FTQlLMTWxk2q+iCjAKtwP2bATZg/NrQW43sYHg8aw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=VBmjgCbOKB/PxbyOOaHEM8DPDtVuxjZ08UJzyN6rtVR9iV9FoMWduFzIBK0lVPvrW
	 qd03InzNdcKV8aI9CAe9HWwyxotOiaG83UTLWTRDOlN2oOuGLeF2aAhuFYy4ck4Pmz
	 yZ9Y0Azd/6wXlVYLtfPWaEpYnQPrqluPA3ePINxPUNi7kUpg2wz08o+gH7CMg129T/
	 3DVTYI5o4g48c3rhJQB59ghMtyeqcEhnnWOAPV29Oj76ITu3+DSe3ZAOnNy3yOoQ/X
	 hK/GH2ZoMSp1FXCE/2lSsAYbwkTOewu3tH+htaS7AMLDB418i4e4N4siihIep4ynX1
	 W0Imuge8PvU/g==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33b248e7cf0so186315f8f.0
        for <linux-firmware@kernel.org>; Fri, 02 Feb 2024 06:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706884880; x=1707489680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1FTQlLMTWxk2q+iCjAKtwP2bATZg/NrQW43sYHg8aw=;
        b=pOrC1N2qLLVeEMXfKkzx8iHbo3TCVDOqRVY470s5VN4TlfsKzFT61yYFOg/M8TuUv3
         av9YXCRICkpqBsJcbhyKKFXksDCJWvI42EMvbSwSr1szG3Z5GLoCuOSqv0dwmE7nw3/8
         y24aXuE9EjvCB6yTmq0vJHkCyxUD4HBcH/sqrqDpOQ5gr4LJKDlasVd2Dy/kw2AY7RMU
         L4nMieTGx0svPn27G6H8ayWEk71yGtdvP0tFp03pA1rP8ZmZXQfS5P7GjMRnDJkiAWQ2
         ARPueJcA4jP2YyligwAadupZyKZKwl+aJiWRnADsnREM1hLMxHbiYcCh/mIYSDCOupiW
         w+Vw==
X-Gm-Message-State: AOJu0YzDoZqDJok1ZDfbt5ciiylD/PBcMQsiAOT6ZeC1FhDQFf+NW/B8
	biblVES9IlzOOqizhorwNH5+iJng9a41POr/CKfRr5T99TMtHcPiOlorftxN79EpE7ebQc66mnh
	IXy73w+pUDHY6u3SkEk5k2KOBxs/HK8PUUSVRw5OxzlxN92PXVY9my8tr2ygs3rWpB60swtyDGu
	HVyT9nhg==
X-Received: by 2002:a5d:6905:0:b0:33a:e477:d220 with SMTP id t5-20020a5d6905000000b0033ae477d220mr3916319wru.37.1706884880555;
        Fri, 02 Feb 2024 06:41:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfEEK1qzUD1a7XwKa2IJ6tziU7w8Q06lb6QU6vA70gyHEFakhZofei0lG+L/Bnbi2tzLp4Ig==
X-Received: by 2002:a5d:6905:0:b0:33a:e477:d220 with SMTP id t5-20020a5d6905000000b0033ae477d220mr3916314wru.37.1706884880272;
        Fri, 02 Feb 2024 06:41:20 -0800 (PST)
Received: from localhost ([81.221.247.52])
        by smtp.gmail.com with ESMTPSA id o1-20020a5d6481000000b0033af26545c8sm2097806wri.50.2024.02.02.06.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 06:41:19 -0800 (PST)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org
Subject: [PATCH] check_whence: Add a check for duplicate link entries
Date: Fri,  2 Feb 2024 15:41:02 +0100
Message-Id: <20240202144102.1209374-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify that there a no duplicate 'Link:' entries in the WHENCE file.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 check_whence.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/check_whence.py b/check_whence.py
index 4b5471e04a6f..fd74a56a5c5a 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -70,6 +70,7 @@ def main():
     whence_list = list(list_whence())
     whence_files = list(list_whence_files())
     links_list = list(list_links_list())
+    whence_links = list(zip(*links_list))[0]
     known_files = set(name for name in whence_list if not name.endswith("/")) | set(
         [
             ".gitignore",
@@ -102,6 +103,10 @@ def main():
         sys.stderr.write("E: %s listed in WHENCE twice\n" % name)
         ret = 1
 
+    for name in set(link for link in whence_links if whence_links.count(link) > 1):
+        sys.stderr.write("E: %s listed in WHENCE twice\n" % name)
+        ret = 1
+
     for name in set(link for link in whence_files if os.path.islink(link)):
         sys.stderr.write("E: %s listed in WHENCE as File, but is a symlink\n" % name)
         ret = 1
-- 
2.40.1

