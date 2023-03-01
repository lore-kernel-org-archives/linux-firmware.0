Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E53AC8300C
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E8B5C433EF; Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56607C433AE;
	Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677696979;
	bh=0mdrILr7YqenDMfDLtR0327+yeEqlPeTBWKSYZUVfgE=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=UmBRz5CDeyzUbmcCBoiGDLQcyCTPMrf3we6W9KwQ+xuW1MO0WaC/7Qgy7Bfvsv2iu
	 v1RiQmxgajtSIyUWMyibIpz8JqeAIxOxrICPWRS64zQ5Qo21AVjbPgQ6RsJS8l0Nat
	 dNAMpAWJFfssDo7b27WR9fWbvv9yQ8ASfCEHG+7DAIlOLI/5AiCBlJqs/6OxF6eaWj
	 sSZUbJZJF2vHPLsOnG4q4w0I/FIAI1J55L3ht6hUGGcR0Rh2sphDTvFxQA6gPGUtSb
	 NdYLAA8I91ydV4mLnnlJ7HwdZvHUbAxCHhLSqYcxYAYzbSKcP46kYNMYZNOqwMPVlc
	 Z2wkTeU9fMvFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42714C87FDC;
	Wed,  1 Mar 2023 18:56:19 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Wed, 01 Mar 2023 18:56:29 +0000
Subject: [PATCH RESEND v2 15/16] copy-firmware: silence the last shellcheck
 warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230301-fixes-and-compression-v2-15-e2b71974e842@gmail.com>
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>, Adam Sampson <ats@offog.org>, 
 David Woodhouse <dwmw2@infradead.org>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677696976; l=1200;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=Zs82VHfS/5xk78pKSX1uPibhzfoBqL1Wh86aqKB5sOk=;
 b=3fV0bf3J7EzFCU3urSDGS0HRNhKk7/aX+VPLhDNYnSNAhd0IXiOwBGX/x/dVqaTBgIEITCC2K
 UxeSCM+J23OAU2l3PkDg1Okz/+s4R1Q1dLEYuCt9f0WeMfWaZJCgqQO
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.l.velikov@gmail.com>

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 5a5e1a8..a52b847 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -9,13 +9,14 @@ verbose=:
 while test $# -gt 0; do
     case $1 in
         -v | --verbose)
+            # shellcheck disable=SC2209
             verbose=echo
             shift
             ;;
 
         *)
             if test "x$destdir" != "x"; then
-                echo "ERROR: unknown command-line options: $@"
+                echo "ERROR: unknown command-line options: $*"
                 exit 1
             fi
 
@@ -25,12 +26,14 @@ while test $# -gt 0; do
     esac
 done
 
+# shellcheck disable=SC2162
 grep '^File:' WHENCE | sed -e 's/^File: *//g' | while read f; do
     $verbose "copying file $f"
     install -d "$destdir/$(dirname "$f")"
     cp "$f" "$destdir/$f"
 done
 
+# shellcheck disable=SC2162
 grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
     $verbose "creating link $f -> $d"
     install -d "$destdir/$(dirname "$f")"

-- 
2.39.2

