Return-Path: <SRS0=1pox=BZ=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D423DC77B73
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Jun 2023 14:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9C21EC4339C; Mon,  5 Jun 2023 14:14:19 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE75AC433EF
	for <linux-firmware@kernel.org>; Mon,  5 Jun 2023 14:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AE75AC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3f738f579ceso11805745e9.3
        for <linux-firmware@kernel.org>; Mon, 05 Jun 2023 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685974456; x=1688566456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMPGHrQl3zHQ8L/0xTnDoqN5Ah8mZdy5SY1YI2xuQmg=;
        b=pk81eDwYALGx6EkANB93UsmjQKXBSDsdXh4NGW0cL75ZzVqEP/vL6DtqF6PFpWE15w
         vg8YukXvckOUeOXJpdpZ2Oprgm6iFIBdW3kwUiOCsro/tU79K38Qc7wezgpBArwgVDzN
         YvW50lwxbSdfL8du91UiKy4efGyygfY0+veneETlqKDf8C7NIrBiKhgXPm+INwNQARzR
         Na26CCfV5t09LCD/8DnsNyezxnV3d8e61a5OVurZ/yVlwqmVcBvINvmAs5C/UQoO0OME
         BRTi1vPsEBJ0VQAMQwvjkrP9902glZN35DRPZKku9gkonSABxi+cVwsS2fNPf3CNrjy6
         c7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685974456; x=1688566456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMPGHrQl3zHQ8L/0xTnDoqN5Ah8mZdy5SY1YI2xuQmg=;
        b=ACR7H2lnhmunQOpC/RD+A/AWHBsUuncG0O0T3u2yBTEi42tlC7b9ce8h77ERYmevsK
         FByVEpOrwbtq+NmFmMhR2iYqScJ5a4gS+rvRKFlLLco4lzRFM8+0pP/B2TbCxrXupjtf
         dKzh61ch+79vW8MBjFachSfF6/Zq8iQgP6c+jBP5F3RoicBRP1pIRJ7/bgq04UX+9D7q
         MhyTbAHjO3QyNALbcsUnNB3t3PKpjvqGG+uRjJiDnE7bkB51onjJN9+QrgHW3uW9dOfw
         fAmYMH2uK4pIgv8zdB/WguUkTbCA5oqu2HQ//kGD6GPsBCJsoXahrqR9M+IgY3jUXqZN
         1ncA==
X-Gm-Message-State: AC+VfDzbxGNxjKVVJXLsYU/hqAhoBjuZsFrU5X7U/vJ2K0/Ukw51Z3H4
	f3O1exAm1yJQUXk4AP2WFRP+jF7q2uY=
X-Google-Smtp-Source: ACHHUZ6gGN/DmsCyAi9BOmRMv2zpacquzeP3wcn6Gg/V7FKri9xdt7eNJpukc6xtfxZep2CmtzTbkw==
X-Received: by 2002:a7b:cd1a:0:b0:3f7:3a19:b951 with SMTP id f26-20020a7bcd1a000000b003f73a19b951mr2490153wmj.21.1685974456006;
        Mon, 05 Jun 2023 07:14:16 -0700 (PDT)
Received: from localhost ([2a00:5f00:102:0:3110:4340:17af:8ab1])
        by smtp.gmail.com with UTF8SMTPSA id w6-20020a5d6806000000b0030630de6fbdsm9881180wru.13.2023.06.05.07.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 07:14:15 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH v3 1/8] check_whence: strip quotation marks
Date: Mon,  5 Jun 2023 14:58:05 +0100
Message-ID: <20230605141343.880621-3-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230605141343.880621-2-emil.l.velikov@gmail.com>
References: <20230605141343.880621-2-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emil Velikov <emil.velikov@collabora.com>

Earlier commit added check for duplicate entries. Although the commit
was picked without one of its dependencies which removes the quotation
marks in the File entries.

Since the quotation marks are here to stay, escape them as needed in the
script.

Cc: Emil Velikov <emil.l.velikov@gmail.com>
Fixes: 05183b7b ("check_whence: error on duplicate file entries")
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 check_whence.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/check_whence.py b/check_whence.py
index 711be362..e00fdd19 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -33,7 +33,7 @@ def list_whence_files():
         for line in whence:
             match = re.match(r'File:\s*(.*)', line)
             if match:
-                yield match.group(1).replace("\ ", " ")
+                yield match.group(1).replace("\ ", " ").replace("\"", "")
                 continue
 
 def list_git():
-- 
2.41.0

