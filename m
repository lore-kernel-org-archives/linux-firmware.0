Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E0C3CF9C6F
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 572F0C4CED2; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 356ADC4CECE;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036273;
	bh=Ghucb0krYr7zvn5WPCCAyBpP13hsWFVPFO/De5VZvto=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=X8ynn3x3v7p61DovP7eI1SJJP8xbi3nvuGfTrnY/XMLHKX2F52a66CevfsGQ4uSLL
	 Fn2ZE3eC6z/I3tatqERjRtt5zMRm5fdV2gFLKfU/Xq+0/zkieJF5agqDzVFbiyo2Zz
	 32JvIXbwGlVbaOMn/6nlJLD+yDBAgLZbNjO2o9ZOaTLtGSEFVWWC+rqohLU3czS474
	 hCTom2yUW2mGEDXL0GpvnrpvyFm0TeZNeim683MdYJSt+E6LjR2s5AxSWVxQ8yPr+z
	 zPBdSl8AMl3rysm0lW0hi7iiEFHILnAd4SYeAQFaS4YA3ZO9TQuLpiLrxSW+SVKRj/
	 0yIMNJlSjmg0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2730DCF9C64;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:36 +0100
Subject: [PATCH 01/16] check_whence.py: use consistent naming
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-1-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=1740;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=+wYedyIHQdeXvxtfLekWNvAK9v0wDJG46Op9Xb0SWes=;
 b=nIER3NHzaei5Ph+ZN1MuShTyzgNS96zpiwOUqjAa8gxHe3rv/lhXxNS1TYr6kqpqralQ7riKu
 TTixZZR/GlsAN+9jHGI+kzhApDSq9sc3Cawk07IgjzWIUVJ/65tYnP5
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


