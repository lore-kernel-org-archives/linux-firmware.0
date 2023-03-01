Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6FEC7EE2F
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB36CC433A4; Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3011C4331D;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696978;
	bh=qLF1RLaWz6rPlfgYUHky9SqloeDyKhQj5jEfbNPZRQQ=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=NzxmJ84R1imag2Pqk5CvuNmyf4j9ft5wuGUvp/236W8AqhI1FzaruowfUr/i+Gxza
	 XKsY5qsoKc3uU9jyWYGQVIHkZO8Ofw3QQQNITLLddAEx2AZkDpiMORNLRT2Mnaxkik
	 CqCOhratCYORe469OokBoxKOudjKhFrmwfmGGkNfr+oROeYUBv5NrYz6KO5/Kqom/y
	 IJAMXK7h0AWaR9wX9BBFQkfSeem/I1NhGv5zrJri+osqqLIZY8tx0togXfGHfU9hHl
	 cer97e++iOVqAMnLi+XlRwai6bU+655AMaxnHkimBO9Gn211dAX3CRrhs1NZipWFHs
	 tFuLQD0TRnhBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26F0C7EE37;
	Wed,  1 Mar 2023 18:56:18 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:22 +0000
Subject: [PATCH RESEND v2 08/16] copy-firmware: remove non-applicable file
 presence test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-8-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=655;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=xcjzktk1cmFxjASRD0WzRiBZcDi7DUscCBvzM13kFwk=;
 b=UOlleUcGNnltDjFZjBxfbap1Iib7OFVEZo69yUHreDIaUQEZgzagV7O4X16DkhBiFhR4aO0UC
 cx9hLiEqoODB2b8URandbwYPvL9COHzy7fG3mLASDAjMvYEOI6yzHEW
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

The check_whence.py script already ensures that the files listed in
WHENCE are present on-disk. Thus the extra check isn't needed.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 6bceef3..656b0ec 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -32,7 +32,6 @@ while test $# -gt 0; do
 done
 
 grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
-    test -f "$f" || continue
     $verbose "copying file $f"
     install -d $destdir/$(dirname "$f")
     cp -d "$f" $destdir/"$f"

-- 
2.39.2

