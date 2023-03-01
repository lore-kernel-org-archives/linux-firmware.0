Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F756C7EE32
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58AA5C43321; Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C75FC4339B;
	Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696979;
	bh=4/SXG9szSmvLhNWC70DgnOUbM+rLfZqmz8+BaHFJtYU=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=Komczblx5dUROZmkVwQ6iff+nH/yQdArFi/RnPf8V1hQ9rzK9cS1gCB/tF9Jh6nkL
	 zVxH4pjAmHlybZEHfhS/gYhDe4SCXWtJFMsBWcn3M7ReEswNFshKREWPfzaCYhUluM
	 5dr9esyr5fs4ljyKmyhPjmzFEgV8K+2gW6YMiHae33rfMtEbVVnGCNj8wEyAS9ECOI
	 CVMFAMZ5PfcoIBkNosWtuPnzXizOmkAdsgqL7GyZ4ax3PCZb/a1R4rWbui4jq82lhr
	 v7wHbfhF+CZdfihLMC8/l9UeoBH3q/p9aFbs3I+KNaZH3x5I5dkWNTJ/92YucFD9/j
	 IFz9hSZPnuAlQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C224C8300C;
	Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:27 +0000
Subject: [PATCH RESEND v2 13/16] copy-firmware: tweak sed invocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-13-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=964;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=2JinCNkOkfhD9LPQJIFYKPvaZoBwAPTHtJg2ynGM9rE=;
 b=6U1p5cROvrcvOpD6pJWo1D/xFA95BzZ2VLAeSetT4YfRCI5fQgYjzU44imV4yG/aCJwC9iq+0
 I4sfLFeF1keB2ggAX8nqktdx6Z9ypwU7YbHAl8tfPtEwVn6AGXChB+Q
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

Add space between the arguments and pattern and combine patterns where
possible.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index c6a2fe9..722227f 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -25,13 +25,13 @@ while test $# -gt 0; do
     esac
 done
 
-grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
+grep '^File:' WHENCE | sed -e 's/^File: *//g' | while read f; do
     $verbose "copying file $f"
     install -d "$destdir"/$(dirname "$f")
     cp "$f" "$destdir/$f"
 done
 
-grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; do
+grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
     $verbose "creating link $f -> $d"
     install -d "$destdir"/$(dirname "$f")
     ln -s "$d" "$destdir/$f"

-- 
2.39.2

