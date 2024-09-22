Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141CFCF9C6D
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8663C4CECF; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE445C4CEDD;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036273;
	bh=WDkdWy/F3aVRLNiamiMgcapqsbaZVIXuqFv7sM27JgM=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=kE5HkGLfa/2/xk7WAISSyWetG2EmnXYJqOPwtBDtynabRg4IhBYvb5xFAKvWM7bMG
	 FzRZVufHhFuh3wMfPwi0bp0g13hs5TrNuVnh8x9dDT1AXmbOM5N1iYA1/8tJapOgkG
	 8WIZMY1ui9nQqrBn6z7Mk/n4++ULaR9yEe2GFNTB1S0RW2PWBUAciNogG3r+GJ8+F8
	 vzc+j5G99pxpgUNGU9B1lYPOf9Wt9LB8cQgzOaqJLGEhpisfwaVzQt1BFkON5BnlCY
	 OTj0oQ5VweyGi3UAFthhvGJlsYbwxd9a3FvkuempsrON885pRNBL7Z4YZUNPyIkvJY
	 Mw++Nbj5q/wkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72EECF9C7B;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:47 +0100
Subject: [PATCH 12/16] copy-firmware.sh: call ./check_whence.py before
 parsing the file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-12-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=911;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=HBkBN3KMWwFD5mmZPHeopiW498PMbVobsiZupVQ9os4=;
 b=1xy3n0AZjTt9jclFAS7Hp231LL49Rgn1RQBaBNj4pPeO9uSpwJa0m6QzJkzT5IPjigyrXQhf1
 /c9i30TSMaSCoiX77B0ge4C0hI4DC6xmt0Wz4TI+Lv6BVGjRCV06VN+
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

This will prevent accidental changes (eg. you're hacking locally) to wreaking
chaos, as copy-firmware.sh expect a specific format.

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index dc959cbad3be3e79a1174afd0ff68b8d6c0567a5..ff3124d9d055f1f72351f472609d0158bd91dfb7 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -70,6 +70,9 @@ if test -d "$destdir"; then
     find "$destdir" -type d -empty >/dev/null && warn "destination folder is not empty."
 fi
 
+$verbose "Checking that WHENCE file is formatted properly"
+./check_whence.py
+
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g' | while read k f; do
     test -f "$f" || continue

-- 
2.46.1


