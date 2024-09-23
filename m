Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2EBCF9C79
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6504DC4CED0; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36410C4CEC4;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727096983;
	bh=Ghucb0krYr7zvn5WPCCAyBpP13hsWFVPFO/De5VZvto=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=Uc5eb8ve3i1KwsvpTLs6fm54y861VTBpgX8Zr1JrzoHMzzcMXGai0UJfDZFahnr55
	 2G3P6V9oUkYMNQXJxi7BWOJDzPOior9vyaCc2qC4aZzAIuwhQ5Arg2eHu/XZVN1wGY
	 owQeH6cG86u7cmjbtPg86eNlXwANb5BGH4MxIe300npW8D5WE4UAJL7TjAO7FURm6Y
	 lumArFgMFAIQwrypFT6tphlEPMuZJg3wMIfkk8oNVsEKVaKRu010Z1voSvG9+a8LEi
	 mwBwktLzcmN3Ma5/riJyx0uVzAV5yfe+Q9oQnoBQQ+uNaXPNw0An60kjf8RTZhKDPM
	 XJesTqm4+tC2Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 043CECF9C6F;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 23 Sep 2024 14:09:29 +0100
Subject: [PATCH v2 01/16] check_whence.py: use consistent naming
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-misc-fixes-v2-1-397f23443628@gmail.com>
References: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
In-Reply-To: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727096979; l=1740;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=+wYedyIHQdeXvxtfLekWNvAK9v0wDJG46Op9Xb0SWes=;
 b=dCgce6RpbtBHAHJ/deRxJ2XbaOjm3im0BBLiWezYc1OQE/zbnugNah9vm/EHM+qzthK+UThdV
 4H5cRHCgKegCZQtcyM3HI+ugprxY+MCUXBcKb/3hyOEPv6480xhFJtV
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Namely: file(name) and sym(link) ... which were swapped in a few places.
One of which by yours truly :facepalm:

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 check_whence.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/check_whence.py b/check_whence.py
index fd74a56a5c5a1fbbc989588626ba1d9bc072d602..c270ee6020083044645353235a94eee0b2497960 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -99,7 +99,7 @@ def main():
         sys.stderr.write("E: %s listed in WHENCE as File, but is directory\n" % name)
         ret = 1
 
-    for name in set(fw for fw in whence_files if whence_files.count(fw) > 1):
+    for name in set(name for name in whence_files if whence_files.count(name) > 1):
         sys.stderr.write("E: %s listed in WHENCE twice\n" % name)
         ret = 1
 
@@ -107,7 +107,7 @@ def main():
         sys.stderr.write("E: %s listed in WHENCE twice\n" % name)
         ret = 1
 
-    for name in set(link for link in whence_files if os.path.islink(link)):
+    for name in set(file for file in whence_files if os.path.islink(file)):
         sys.stderr.write("E: %s listed in WHENCE as File, but is a symlink\n" % name)
         ret = 1
 
@@ -131,10 +131,10 @@ def main():
                 break
             valid_targets.add(dirname)
 
-    for name, target in sorted(links_list):
+    for link, target in sorted(links_list):
         if target not in valid_targets:
             sys.stderr.write(
-                "E: target %s of link %s in WHENCE" " does not exist\n" % (target, name)
+                "E: target %s of link %s in WHENCE" " does not exist\n" % (target, link)
             )
             ret = 1
 

-- 
2.46.1


