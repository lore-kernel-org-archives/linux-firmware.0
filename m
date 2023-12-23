Return-Path: <SRS0=Z4CT=IC=gentoo.org=mpagano@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1545C3DA6E
	for <linux-firmware@archiver.kernel.org>; Sat, 23 Dec 2023 18:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 729A4C433C9; Sat, 23 Dec 2023 18:46:49 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 844FCC433C8
	for <linux-firmware@kernel.org>; Sat, 23 Dec 2023 18:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 844FCC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: mpagano@gentoo.org
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Mike Pagano <mpagano@gentoo.org>
Subject: [PATCH] copy-firmware.sh: Support passing in firmware files to install
Date: Sat, 23 Dec 2023 13:46:13 -0500
Message-ID: <20231223184636.137246-1-mpagano@gentoo.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mike Pagano <mpagano@gentoo.org>

This change adds support to copy-firmware.sh to accept a space separated
list of firmware files to install.

This allows our users to define a small subset of needed firmware files
their system requires without installing every firmware file included
from the repository.

Signed-off-by: Mike Pagano <mpagano@gentoo.org>
---
 copy-firmware.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 6757c6ce..d954230d 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -50,6 +50,16 @@ while test $# -gt 0; do
             shift
             ;;
 
+        --firmware-list)
+            if [ -n "$2" ]; then
+                FIRMWARE_LIST=$2
+                shift 2
+            else
+                echo "ERROR: '--firmware-list' requires a non-empty option argument of firmware files to install"
+                exit 1
+            fi
+            ;;
+
         -*)
             if test "$compress" = "cat"; then
                 echo "ERROR: unknown command-line option: $1"
@@ -85,6 +95,7 @@ fi
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g' | while read k f; do
     test -f "$f" || continue
+    [ -n "${FIRMWARE_LIST##*"$f"*}" ] && continue
     install -d "$destdir/$(dirname "$f")"
     $verbose "copying/compressing file $f$compext"
     if test "$compress" != "cat" && test "$k" = "RawFile"; then
@@ -107,6 +118,7 @@ fi
 
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
+    [ -n "${FIRMWARE_LIST##*"$f"*}" ] && continue
     if test -L "$f$compext"; then
         test -f "$destdir/$f$compext" && continue
         $verbose "copying link $f$compext"
-- 
2.41.0

