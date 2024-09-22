Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988BCCF9C77
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 902ADC4CED9; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A9E5C4CED8;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036273;
	bh=OV/MbNtRRf6LBI779Gk/5rXf1+nakkg77dc8lhxZU+E=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=nPanRxzY3U5v1Vrdf8PPBxpZczoMwhI2ramZMjV4ZrkeF0bt+wbYMqF7kU3qgvoVC
	 CH3zOq4+iT4HLAIXofLySz3czW8/N1oMfCLwgHuDwkI420wTEfsDuRNJip3NuRb74o
	 pPfMWAH5mRKgBeieV5HQ/coSVIdlwB6RWHddjiy4L6/zhwf6PR6TpzmkJ7PVG+mcrW
	 PLeuDTu0FrjI762Y7xNAKCm+vVXIYkj4LM/LD0M1r9DL05Rcme4Ox6xZ7Hru8P3le6
	 l63fUiChFH6ki+UOVbf84t25yijhF6BRmdI/kUUMO4njH/cpsX3VTOUJEdtp2IbgdL
	 kfso7HSMRWpjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B3FCF9C70;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:42 +0100
Subject: [PATCH 07/16] Flesh out deduplicate-firmware.sh script
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-7-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=5104;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=KfAuwZ3wuWoqGFFHK9RZeVLPYi3joBar4vygX8OeOFE=;
 b=rMr44fYEMZ18UXagP4h9SzFppUFQ0gpDT2KrbsYi3OuYnyW8Qd4v7ndQh1aI6nv5EIadLFpLP
 gFW3LzEB2QnASdMt1grHkLXXyszIGw+nkh3TYxya1vyz2RNKCfwToIv
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Flesh out the deduplication logic in separate script. The copy-firmware.sh is
already complex enough and de-duplication isn't really copying ;-)

In the process we migrate from the open-coded (and seemingly buggy) ln
--relative logic, which was masked around with moving the de-duplication around.

We also get a few added bonuses:
 - the COPYOPTS shell injection is gone - the variable was never used
 - people can dedup as separate step if they need to

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 Makefile                |  7 +++----
 check_whence.py         |  1 +
 copy-firmware.sh        | 23 -----------------------
 deduplicate-firmware.sh | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+), 27 deletions(-)

diff --git a/Makefile b/Makefile
index ac43c97fbd0a35b610c4d21c2bf8e8cf21864c9a..a52831fe4e7b69e355d77e0833cde3b451d5800e 100644
--- a/Makefile
+++ b/Makefile
@@ -26,13 +26,12 @@ deb:
 rpm:
 	./build_packages.py --rpm
 
-install:
-	install -d $(DESTDIR)$(FIRMWAREDIR)
-	./copy-firmware.sh $(COPYOPTS) $(DESTDIR)$(FIRMWAREDIR)
+install: install-nodedup
+	./deduplicate-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
 
 install-nodedup:
 	install -d $(DESTDIR)$(FIRMWAREDIR)
-	./copy-firmware.sh --ignore-duplicates $(DESTDIR)$(FIRMWAREDIR)
+	./copy-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
 
 install-xz:
 	install -d $(DESTDIR)$(FIRMWAREDIR)
diff --git a/check_whence.py b/check_whence.py
index afe97a76cf5ed609117d07387a19c2092fa00c6c..b84c1f0f2c310e71eccc17270f7d37e8cd48f2ae 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -91,6 +91,7 @@ def main():
             "contrib/templates/debian.copyright",
             "contrib/templates/rpm.spec",
             "copy-firmware.sh",
+            "deduplicate-firmware.sh",
         ]
     )
     known_prefixes = set(name for name in whence_list if name.endswith("/"))
diff --git a/copy-firmware.sh b/copy-firmware.sh
index 6c557f234dd2b90e68ba26429ad3e788f2201c4f..344f478db74a7080b34c264645d6bcd9a80384a8 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -9,7 +9,6 @@ prune=no
 # shellcheck disable=SC2209
 compress=cat
 compext=
-skip_dedup=0
 
 while test $# -gt 0; do
     case $1 in
@@ -45,11 +44,6 @@ while test $# -gt 0; do
             shift
             ;;
 
-        --ignore-duplicates)
-            skip_dedup=1
-            shift
-            ;;
-
         -*)
             if test "$compress" = "cat"; then
                 echo "ERROR: unknown command-line option: $1"
@@ -75,13 +69,6 @@ if [ -z "$destdir" ]; then
 	exit 1
 fi
 
-if ! command -v rdfind >/dev/null; then
-	if [ "$skip_dedup" != 1 ]; then
-    		echo "ERROR: rdfind is not installed.  Pass --ignore-duplicates to skip deduplication"
-		exit 1
-	fi
-fi
-
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g' | while read k f; do
     test -f "$f" || continue
@@ -95,16 +82,6 @@ grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s/"//g'
     fi
 done
 
-if [ "$skip_dedup" != 1 ] ; then
-	$verbose "Finding duplicate files"
-	rdfind -makesymlinks true -makeresultsfile false "$destdir" >/dev/null
-	find "$destdir" -type l | while read -r l; do
-		target="$(realpath "$l")"
-		$verbose "Correcting path for $l"
-		ln -fs "$(realpath --relative-to="$(dirname "$(realpath -s "$l")")" "$target")" "$l"
-	done
-fi
-
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
 grep -E '^Link:' WHENCE | sed -e 's/^Link: *//g;s/-> //g' | while read f d; do
     if test -L "$f$compext"; then
diff --git a/deduplicate-firmware.sh b/deduplicate-firmware.sh
new file mode 100755
index 0000000000000000000000000000000000000000..2be058ec3f3d6ff19f1dbf9f55484c17d5eddfed
--- /dev/null
+++ b/deduplicate-firmware.sh
@@ -0,0 +1,50 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# Deduplicate files in a given destdir
+#
+
+err() {
+    echo "ERROR: $*"
+    exit 1
+}
+
+verbose=:
+while test $# -gt 0; do
+    case $1 in
+        -v | --verbose)
+            # shellcheck disable=SC2209
+            verbose=echo
+            ;;
+        *)
+            if test "x$destdir" != "x"; then
+                err "unknown command-line options: $*"
+            fi
+
+            destdir="$1"
+            shift
+            ;;
+    esac
+done
+
+destdir="$1"
+
+if test -z "$destdir"; then
+    err "destination directory was not specified."
+fi
+
+if ! test -d "$destdir"; then
+    err "provided directory does not exit."
+fi
+
+if ! command -v rdfind >/dev/null; then
+    err "rdfind is not installed."
+fi
+
+$verbose "Finding duplicate files"
+rdfind -makesymlinks true -makeresultsfile false "$destdir" >/dev/null
+find "$destdir" -type l | while read -r l; do
+    target="$(realpath "$l")"
+    $verbose "Correcting path for $l"
+    ln --force --symlink --relative "$target" "$l"
+done

-- 
2.46.1


