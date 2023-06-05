Return-Path: <SRS0=1pox=BZ=gmail.com=emil.l.velikov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B5CC7EE23
	for <linux-firmware@archiver.kernel.org>; Mon,  5 Jun 2023 14:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D66FC4339C; Mon,  5 Jun 2023 14:14:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1AF87C433D2
	for <linux-firmware@kernel.org>; Mon,  5 Jun 2023 14:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1AF87C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f60e536250so43029345e9.1
        for <linux-firmware@kernel.org>; Mon, 05 Jun 2023 07:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685974457; x=1688566457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqJYVTEURhNBF/zRnTbltWAa8QpmGakXIQvBXHeacWQ=;
        b=jxoSBq7NcTewj7Fm2VXerhumxmS+6f6AbQuAMEaHK5c1YV83JM/bss8XiIvQsDFI5w
         Rse7QB9VQMnxif9UolqkZeCon03QwEJYXliCsFECgnWxnLhHXZXoMUjnazq2n74s7wDE
         gowm8BnFSKF3x3ka7Pmqh1gTkS2KPPFl1zjNkq/ntj9FTO140SfrUwRo91qIo1sbEdDP
         X40Sl1oLd1QR5xhkzCsBNYPOFPUsfMFf0Kh1AjaUdqAzY3s7s7GZolEPmrYMcFdWsEaj
         QUoB3a+f2HYFPiYLDyTSnsYr+6Xb5H1hwJr2VsNSkgo4cy0cXD2VwkXSWasM8GvfGNFU
         XCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685974457; x=1688566457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqJYVTEURhNBF/zRnTbltWAa8QpmGakXIQvBXHeacWQ=;
        b=YZ0aDed6Aj8nTQHbwpN56cZf5XodAD/q8xyGnpFly/ITspwMxreCdnSY8UMssqesB7
         oOF0rpRPfNcudr7WxhZoeBwJymN8Vf5/6/Gb9rNuRoLknQvDcv/31izbxcgabwRbFwTr
         ijBULA8TZKtxdAW0hZLv4fcs93mmRU/VpnBjI/OjR1b3eDn+GsLn080Q7uCqyrAKhW66
         Yz3ntzMVKDSpVM++lMGFALnTWqEZruXARBwPP3uvcs5HI6xs1xk8hSQsVPrJKQXhtmrD
         llK9Cq0FORtFZG7EI/GqnNDyV8SZTZX4SgD0+8NnjPGbptfqKUgc8LN7pHi2YXtDIkRk
         Xobg==
X-Gm-Message-State: AC+VfDw6VM7xQxWeYLC2MWczaztsOF3y6nRyldlOiacVNC8S8A/bjtjc
	fW2J2XX9ku3YB9+sG5AEjH8FY7Kw+jE=
X-Google-Smtp-Source: ACHHUZ6tpzmbtadFv/9UcOKPG7dvGPBqQWJkH9GT1WcVGeK1JWfTwjd1f2wrcVh3VpaPphwI1/2BIQ==
X-Received: by 2002:a7b:c8c4:0:b0:3f7:e660:cdc5 with SMTP id f4-20020a7bc8c4000000b003f7e660cdc5mr1319156wml.9.1685974457250;
        Mon, 05 Jun 2023 07:14:17 -0700 (PDT)
Received: from localhost ([2a00:5f00:102:0:3110:4340:17af:8ab1])
        by smtp.gmail.com with UTF8SMTPSA id g11-20020a7bc4cb000000b003f735ba7736sm6280374wmk.46.2023.06.05.07.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 07:14:16 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: emil.l.velikov@gmail.com
Subject: [PATCH v3 2/8] check_whence: error if File: is actually a link
Date: Mon,  5 Jun 2023 14:58:06 +0100
Message-ID: <20230605141343.880621-4-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230605141343.880621-2-emil.l.velikov@gmail.com>
References: <20230605141343.880621-2-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commits from a few years ago added support for Link entries, over having
the symlinks in-tree.

At the same time, it didn't add a check whether one didn't add a File
entry that is actually a symlink. Do so now, to be on the safe side.

v2:
 - drop copy-firmware.sh changes

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 check_whence.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/check_whence.py b/check_whence.py
index e00fdd19..93ff330d 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -60,6 +60,11 @@ def main():
         sys.stderr.write('E: %s listed in WHENCE twice\n' % name)
         ret = 1
 
+    for name in set(link for link in whence_files if os.path.islink(link)):
+        sys.stderr.write('E: %s listed in WHENCE as File, but is a symlink\n' %
+                         name)
+        ret = 1
+
     for name in sorted(list(known_files - git_files)):
         sys.stderr.write('E: %s listed in WHENCE does not exist\n' % name)
         ret = 1
-- 
2.41.0

