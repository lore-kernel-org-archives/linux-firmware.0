Return-Path: <SRS0=gmrA=6O=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44226C64ED8
	for <linux-firmware@archiver.kernel.org>; Sat, 18 Feb 2023 18:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24C0AC4339B; Sat, 18 Feb 2023 18:46:33 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F96DC4339C
	for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 18:46:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F96DC4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id a11so1007569wro.2
        for <linux-firmware@kernel.org>; Sat, 18 Feb 2023 10:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXG2/3Zhvyh00dCe8QoHT71aUXSrNkkgznqXHJYKTaM=;
        b=AVlw7QcBym+uv22vdMj6KI+Pl63PG0gX1lTxXxMmwssga9s3AQ5LNqFLykWmeovSon
         JGIloEnDu7Tzi89XLV0KmPVGNUrQFnUcqcz8nysaY/FgPTWN7nGxJzqBRoVv7mTygd5l
         h6WV+AsbCPMHvLevRc60ALlNiqHWLE7V8zuL6/E7b8s4CuOLMYaXEbu2sORmeSBBPcZB
         rqKY2JnzC3QKp0aGbm14EmwmJssJVMC1YDpEzw6vyagOzyys/r7hWohewZVgOQUg0WKC
         NL9HsSgyR6ole2HTqT8YolSZWPcvH46RCtPQkMssYqtWVKMYYeQMyGlC1kk5jWLQBLbE
         gbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXG2/3Zhvyh00dCe8QoHT71aUXSrNkkgznqXHJYKTaM=;
        b=mpJXORgAMgMfm1XIGNByGw/9CWRzdZtnFiOjc06Cnp9C9UtUT1U2G5dcqxXf+C+6p8
         egzef0nVMQTR0+3iLvL8Rp3pD35Mtyf6vp2GaUv5Zz/4ll57tAVcvRQRSC6V3sgycceW
         hzLKKCjtTuqrcy6gyWimW8yqw8HewZk7ByZG3rpXpHo4JO54lnOBV9LSeSDlB3catqwW
         e1Dm/LhhWOiF0q7eAybl6Rx6rjewNiEdBs5yVq/ct0KClwZeRNaMXRylhehZh79BZaGf
         yyTkvapsm/C/wbEdddxxoQQnTfAHh3otdZ6b2FlKTOEaaMB2esySCN7vziL5NkX0Ug1U
         3Yng==
X-Gm-Message-State: AO0yUKWR1q/3bDz77y8/AztTrlZ3+2PfJg8+EeBQLc/pmsFNSYADLTOv
	niEseEzUBqeK3VhwyUQhrsDTVVOLcdw=
X-Google-Smtp-Source: AK7set/i9fpJca5eZQEd8i5CH6nQ/IQIpAII5DjB9RZbRrkexxHJszrdS6uBGiSSB1tYUbumwXsL2g==
X-Received: by 2002:adf:e6c1:0:b0:2c4:5d8:8250 with SMTP id y1-20020adfe6c1000000b002c405d88250mr53037wrm.23.1676745990349;
        Sat, 18 Feb 2023 10:46:30 -0800 (PST)
Received: from localhost (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net. [82.24.248.100])
        by smtp.gmail.com with UTF8SMTPSA id i16-20020a5d5590000000b002c5584d0e3dsm7582485wrv.24.2023.02.18.10.46.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 10:46:29 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH 05/15] check_whence: error on duplicate file entries
Date: Sat, 18 Feb 2023 18:46:11 +0000
Message-Id: <20230218184621.2026504-6-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
References: <20230218184621.2026504-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's little point in copying (or compressing with later patches) the
same files multiple times. So let's error out when duplicate entries are
present.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 check_whence.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/check_whence.py b/check_whence.py
index f347f0e..7ff21f6 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -24,6 +24,14 @@ def list_whence():
                         yield match.group(2)
                         continue
 
+def list_whence_files():
+    with open('WHENCE', encoding='utf-8') as whence:
+        for line in whence:
+            match = re.match(r'File:\s*(.*)', line)
+            if match:
+                yield match.group(1).replace("\ ", " ")
+                continue
+
 def list_git():
     with os.popen('git ls-files') as git_files:
         for line in git_files:
@@ -32,12 +40,17 @@ def list_git():
 def main():
     ret = 0
     whence_list = list(list_whence())
+    whence_files = list(list_whence_files())
     known_files = set(name for name in whence_list if not name.endswith('/')) | \
                   set(['check_whence.py', 'configure', 'Makefile',
                        'README', 'copy-firmware.sh', 'WHENCE'])
     known_prefixes = set(name for name in whence_list if name.endswith('/'))
     git_files = set(list_git())
 
+    for name in set(fw for fw in whence_files if whence_files.count(fw) > 1):
+        sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
+        ret = 1
+
     for name in sorted(list(known_files - git_files)):
         sys.stderr.write('E: %s listed in WHENCE does not exist\n' % name)
         ret = 1
-- 
2.39.2

