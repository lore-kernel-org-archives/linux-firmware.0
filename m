Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EB3C7885C
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Sep 2024 13:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B31CCC4CEE3; Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F5B5C4CEDA;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727096983;
	bh=pp43/KGThBXHiR7obu6bTColyHZKLSU6gltX13uB6Uc=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=c/RQAbFDj0KbB3kuC4HZxIX7NnzD0NFG7KIQMIy5TeBnmqwo9N7jSn0DBv8f/5A+F
	 dFvLcN2KftZsGw1Rv/uHKRW9+ZxpBuKqWQKsQldfjh7l/ToS3VwkM2QmR5OhMkwcRI
	 hkZmkrO8X3aoocsYcF8X8Xe4rA27URwZzspTqq6d6f0bMLVT1HIKIySSFjuOpCkFKm
	 UpW4hNTPyyIrDXHiJ0nKxGBsdC8MoiUQnoLtr9HnFxNFyiWZTXBGl3egU0VnjNOk/n
	 ZzMyMkCxKPhojvmLzWOtwNJ3UR+raysRMnncGFiVfc/4MUl/jcihfGJkrRxfJXdveZ
	 WEBpTTQFhBEew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CEACF9C77;
	Mon, 23 Sep 2024 13:09:43 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 23 Sep 2024 14:09:35 +0100
Subject: [PATCH v2 07/16] copy-firmware.sh: flesh out and fix
 dedup-firmware.sh
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-misc-fixes-v2-7-397f23443628@gmail.com>
References: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
In-Reply-To: <20240923-misc-fixes-v2-0-397f23443628@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727096979; l=5711;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=ZBfxLOvdWGqKOxrh2V6KRxGI/HtfCp1M3PBuhAEW8VE=;
 b=U39AhMBqickDkpixJXDV8pOuzW1aDaeSVjTXRq4GRD5RLjWUDjdp5N76z0iQt5gZ1Ty21CNiU
 powY/ZE6qL+AmiuX+nUJj422w+pbT9+LPmgHSc1MqYclvxEN5HwcB5g
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Flesh out the de-duplication logic in separate script. The copy-firmware.sh is
already complex enough and de-duplication doesn't really fit in there.

In the process we migrate away from the open-coded `ln --relative`. We also
avoid touching symlinks, which are not created by rdfind. Otherwise we end up
"fixing" the folder to folder symlinks (created earlier in the process) and
things explode.

As result we also get a few bonuses:
 - the COPYOPTS shell injection is gone - the variable was never used
 - people can dedup as separate step if/when they choose to do so

Aside: based on the noise in git log and around distros ... I'm wondering if
having the de-duplication as opt-in, would have been better. Is it too late to
change or the ship has sailed?

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 Makefile          |  9 +++++----
 check_whence.py   |  1 +
 copy-firmware.sh  | 23 -----------------------
 dedup-firmware.sh | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 58 insertions(+), 27 deletions(-)

diff --git a/Makefile b/Makefile
index ac43c97fbd0a35b610c4d21c2bf8e8cf21864c9a..216dd4885b5bdf35189bbcca325fc7535acbe8f0 100644
--- a/Makefile
+++ b/Makefile
@@ -26,21 +26,22 @@ deb:
 rpm:
 	./build_packages.py --rpm
 
-install:
-	install -d $(DESTDIR)$(FIRMWAREDIR)
-	./copy-firmware.sh $(COPYOPTS) $(DESTDIR)$(FIRMWAREDIR)
+install: install-nodedup
+	./dedup-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
 
 install-nodedup:
 	install -d $(DESTDIR)$(FIRMWAREDIR)
-	./copy-firmware.sh --ignore-duplicates $(DESTDIR)$(FIRMWAREDIR)
+	./copy-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
 
 install-xz:
 	install -d $(DESTDIR)$(FIRMWAREDIR)
 	./copy-firmware.sh --xz $(DESTDIR)$(FIRMWAREDIR)
+	./dedup-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
 
 install-zst:
 	install -d $(DESTDIR)$(FIRMWAREDIR)
 	./copy-firmware.sh --zstd $(DESTDIR)$(FIRMWAREDIR)
+	./dedup-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
 
 clean:
 	rm -rf release dist
diff --git a/check_whence.py b/check_whence.py
index afe97a76cf5ed609117d07387a19c2092fa00c6c..09dbdd5439e738385c0402e244bad11ed9fc5558 100755
--- a/check_whence.py
+++ b/check_whence.py
@@ -91,6 +91,7 @@ def main():
             "contrib/templates/debian.copyright",
             "contrib/templates/rpm.spec",
             "copy-firmware.sh",
+            "dedup-firmware.sh",
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
diff --git a/dedup-firmware.sh b/dedup-firmware.sh
new file mode 100755
index 0000000000000000000000000000000000000000..2bbd637f0736252027bfe1f60f886772efec1d08
--- /dev/null
+++ b/dedup-firmware.sh
@@ -0,0 +1,52 @@
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
+destdir=
+while test $# -gt 0; do
+    case $1 in
+        -v | --verbose)
+            # shellcheck disable=SC2209
+            verbose=echo
+            ;;
+        *)
+            if test -n "$destdir"; then
+                err "unknown command-line options: $*"
+            fi
+
+            destdir="$1"
+            shift
+            ;;
+    esac
+done
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
+rdfind -makesymlinks true -makeresultsfile true "$destdir" >/dev/null
+
+grep DUPTYPE_WITHIN_SAME_TREE results.txt | grep -o "$destdir.*" | while read -r l; do
+    target="$(realpath "$l")"
+    $verbose "Correcting path for $l"
+    ln --force --symbolic --relative "$target" "$l"
+done
+
+rm results.txt

-- 
2.46.1


