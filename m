Return-Path: <devnull+emil.l.velikov.gmail.com@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70CACF9C7A
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BAFACC4CEC3; Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A04D7C4CECE;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727036273;
	bh=Zs+AvbJN9sqW5cjtp/+nwvVME2ty0u05FDVDu0Q12Vk=;
	h=From:Date:Subject:References:In-Reply-To:List-Id:To:Cc:Reply-To:
	 From;
	b=lknEjQGchPeCYNN748JgFljrq+BHW/RfYcMqRpWjCivsVfTuf1LwwIYRfDoDuV02g
	 4e4M59d5FTFWWdsn5iLM1FvsXF0MnbVenWm0axzXOwy+iD3+uMQxsmEq9NYYZHrrTH
	 ffOIa9gjcjQyFklIp+CaEBHSi1ktvZ44JIcJXb5YCly0ZS5buVGisuHFC/tMePBROA
	 M8snM05/DVdjWYcVJmOoCbrWrW/zQ/uCDVMQHzsUZWzWPcd9rQqmsZsPM/OhBI1DBV
	 h/bRDdRyd3iJPCutiG51rJLBUmmXZF1iTZsJ2fVKARSKIB5GBquHjHgp8aHRBa/MaT
	 e5RKyD4Tycjzg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98811CF9C72;
	Sun, 22 Sep 2024 20:17:53 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Sun, 22 Sep 2024 21:17:44 +0100
Subject: [PATCH 09/16] copy-firmware.sh: fixup indentation, consistently
 use test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240922-misc-fixes-v1-9-8c6e52997c94@gmail.com>
References: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
In-Reply-To: <20240922-misc-fixes-v1-0-8c6e52997c94@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727036271; l=1031;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=hy8iLu3uE3VAsqwRVOWbyYNgW2YyaPxQ9G4aBqD1ybc=;
 b=6MyzOxYKcppAsry/AcXMLFGPKVGpSJw9/iFLSyZSoaiDKx5HWl3joi0ZnOzMX6AbmDkipx2Jq
 dgPquYhZoqPA9hmy4n7ZZfHbH+GvaUELQWnW+PKNWnuCm7AUqCvvu5X
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received: by B4 Relay for emil.l.velikov@gmail.com/20230301 with
 auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: emil.l.velikov@gmail.com

From: Emil Velikov <emil.l.velikov@gmail.com>

Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 copy-firmware.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index 21ed20d5886fe71588b923914265f992cf5c29b0..e46bb9926f86a813bc76f1da1604c1b7a4980848 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -56,9 +56,9 @@ while test $# -gt 0; do
     esac
 done
 
-if [ -z "$destdir" ]; then
-	echo "ERROR: destination directory was not specified"
-	exit 1
+if test -z "$destdir"; then
+    echo "ERROR: destination directory was not specified"
+    exit 1
 fi
 
 # shellcheck disable=SC2162 # file/folder name can include escaped symbols
@@ -114,9 +114,9 @@ done
 
 # Verify no broken symlinks
 if test "$(find "$destdir" -xtype l | wc -l)" -ne 0 ; then
-        echo "ERROR: Broken symlinks found:"
-        find "$destdir" -xtype l
-        exit 1
+    echo "ERROR: Broken symlinks found:"
+    find "$destdir" -xtype l
+    exit 1
 fi
 
 exit 0

-- 
2.46.1


