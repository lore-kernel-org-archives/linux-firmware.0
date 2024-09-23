Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29F1CF9C77
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B096AC4CEDB; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E429C4CED7;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727096983;
	bh=2+zD6jWGQiMesWtyxaRV6gfN//c5kCChmF1tAi5amq4=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=Efo/e7MkwhgLY/3nWbIWI20rDRFJXj3+SqMJT1hnUvBeDyq9KgYf7n06rX6QfRjSY
	 hMCU63bzCutqtx9cp1wzs442jgOSjCuxxyfQDscI5fBSOyetjdyS954RplvfLe6sPJ
	 ch6u/quSdAU7lSZZbx4T5OuJyHDhplPmLrHKjCl8pkTBRMlDQd0vaEMfl3WMon0uzz
	 cP74GKXQ+8pyRwnvUm1Bg80+1NRQea0aT6wNCTk7SRXiG4hRIG6qZmDINVukPR6tYf
	 rTHCu94O1YSNLeBNlQQtFWMqDu58IZ00S6zIlJRIw/jsEEZGMs/g7r2i/hMl+AAkl6
	 auGn5GQOmrvIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B97CF9C76;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 23 Sep 2024 14:09:32 +0100
Subject: [PATCH v2 04/16] check_whence.py: annotate replacement strings as
 raw
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-misc-fixes-v2-4-397f23443628@gmail.com>
References: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
In-Reply-To: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727096979; l=1469;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=QXGTsb532u1h7/x1Zbn/Qis/Q4r7t27FH56ktMBJAJI=;
 b=muT9UMuTDqxePyC+41xHUsietmHirEhPOilz50YlfoUk4wEO0NvdJFfW0TiNNn17gN2j/2vN3
 jpeVCB2O/QdAXkFBd5oGEfQh3YoA1zfCQZE2BNGXY4/2g65vrt+ulFq
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Otherwise python 3.12 throws warnings like below:

.../check_whence.py:40: SyntaxWarning: invalid escape sequence '\ '
  yield match.group(1).replace("\ ", " ").replace('"', "")

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 check_whence.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/check_whence.py b/check_whence.py
index dbbb68f7ab51b8db52c1d2334a6d4d20962bbef8..64dc133551a68aeb24dbf7f02f617ea3913477b2 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -37,7 +37,7 @@ def list_whence_files():
         for line in whence:
             match = re.match(r"(?:RawFile|File):\s*(.*)", line)
             if match:
-                yield match.group(1).replace("\ ", " ").replace('"', "")
+                yield match.group(1).replace(r"\ ", " ").replace('"', "")
                 continue
 
 
@@ -48,8 +48,8 @@ def list_links_list():
             if match:
                 linkname, target = match.group(1).split("->")
 
-                linkname = linkname.strip().replace("\ ", " ").replace('"', "")
-                target = target.strip().replace("\ ", " ").replace('"', "")
+                linkname = linkname.strip().replace(r"\ ", " ").replace('"', "")
+                target = target.strip().replace(r"\ ", " ").replace('"', "")
 
                 # Link target is relative to the link
                 target = os.path.join(os.path.dirname(linkname), target)

-- 
2.46.1


