Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436CAC87FE1
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3948EC433A1; Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 218A2C43443;
	Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696979;
	bh=iRHTymYG4bhsadl2Mn7ZhgX04C0iqZczGhdXQKWZMl4=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=LSaHdw+RZnwRiM8HxPCiaMzf5EV6XCSuz2uZ1FnTkM3zIVoq6MZbaZ6AHmFwFSGFU
	 0ez8HPDXhyZ7nKOkrMRKnfveUoPRdsgkDp51a61bQ20icOTwKC227/9+Em9x+pUIyB
	 OnC3vvukKq0gsez3Y12JhCffb2sOwzAnKcA7602ZmPTroExiHAOwKhgIxoBLHNULIE
	 HQcpCqvUFlXWzcbg8hO4KXUwIpkf1x+yii2Y//qEUDZn6Ll+sZesQoNLZPKVDUo2Mx
	 kzxH7IqX5uho+ehjfzc5XtCMgEel4H2isEZ5d/uX3m+nvCmXFAtKGvL3FGA0C70Kka
	 asudQJD/M0zTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FBECC83002;
	Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:26 +0000
Subject: [PATCH RESEND v2 12/16] copy-firmware: quote deskdir to prevent
 word splitting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-12-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=818;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=KXTAfCujjlDu+I24tx9P5qTfiOLnyiIaZNoMdWFkZJQ=;
 b=028WvJesyrCJDbs8G8GB+15JQqmXVudP4wrybO10XEawvcmu/OGz3lq3Fuy+nTM7pbsECETn/
 4MQferEp7CGAsIdUkXydjS9yHglETlLKs//BXliAASD/VlOMv2uBEOr
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 0132244..c6a2fe9 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -27,13 +27,13 @@ done
 
 grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
     $verbose "copying file $f"
-    install -d $destdir/$(dirname "$f")
-    cp "$f" $destdir/"$f"
+    install -d "$destdir"/$(dirname "$f")
+    cp "$f" "$destdir/$f"
 done
 
 grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do
     $verbose "creating link $f -> $d"
-    install -d $destdir/$(dirname "$f")
+    install -d "$destdir"/$(dirname "$f")
     ln -s "$d" "$destdir/$f"
 done
 

-- 
2.39.2

