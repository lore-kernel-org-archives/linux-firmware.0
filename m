Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91089CF9C74
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77909C4CED6; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BDF3C4CED1;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036273;
	bh=2+zD6jWGQiMesWtyxaRV6gfN//c5kCChmF1tAi5amq4=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=hitYK98qYmn9CA+Cy687DTrYlIfpPqmYwqaTQnoxaIvLxF2211O9tpgid/3xsZIbx
	 WnwZHEBSc0Xc5B603zdHzHf+btCp4KWfAcZXwh1tNWYPR1/2BzQpO4yjkSNJIFDiXx
	 8InN/eVRci1X8Jqh1HxxYeZcD6cdAx9BQQ7ohCmYweHiGGhJjLzFwJcV+9BiLe8Fo4
	 5IW2+zZ37Dv9FBRPoxJL56Z2+RrFHKREiVzfc1Sk5nC2Z45+N56OnVBkDI2DAHa1mm
	 +jtyrALbt0MjHNsuPsRplvJbAkToMNNqUtTiflXFxVvr78KA2ScBOQxHSVWZIF7Edm
	 AAJLpGGLEEVDw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 521D1CF9C6F;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:39 +0100
Subject: [PATCH 04/16] check_whence.py: annotate replacement strings as raw
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-4-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=1469;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=QXGTsb532u1h7/x1Zbn/Qis/Q4r7t27FH56ktMBJAJI=;
 b=axA/5fjC/XfKyF/fWOvZ66MZZTQrp1bak27YN76lI4VqPLDOMoAgUtTTIGp0Dq9PNys5pQdj4
 QofDa2C3iuMBoYqxR3QYEqlnpLGQLkJwJ8M8YGBC2rwMd4iR1jMvkWC
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


