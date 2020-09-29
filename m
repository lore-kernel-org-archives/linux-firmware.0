Return-Path: <SRS0=R0P8=DG=intel.com=anthony.l.nguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D278AC2D0A8
	for <linux-firmware@archiver.kernel.org>; Tue, 29 Sep 2020 00:31:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B38902193E; Tue, 29 Sep 2020 00:31:41 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E6BB2184D
	for <linux-firmware@kernel.org>; Tue, 29 Sep 2020 00:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E6BB2184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=anthony.l.nguyen@intel.com
IronPort-SDR: QxKrUcDP7ZfRudvVZBQZlm6v6go9ujUr3AUsfMJDavPIo2Ihr1wfF/TRqJbXqGz0oIihQdD3rD
 FC8cEjxrBEYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="180243008"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="180243008"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 17:31:40 -0700
IronPort-SDR: iYKETOReqF1dBACq19W+LumM1KxBZoWDH9aNekh3xqMNPTQ6YkB1Tp4U0LQ57Bd5bFUSrNLhrk
 5Nq0Mlxe8Vpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; 
   d="scan'208";a="312003993"
Received: from unknown (HELO localhost.jf.intel.com) ([10.166.244.129])
  by orsmga006.jf.intel.com with ESMTP; 28 Sep 2020 17:31:40 -0700
From: Tony Nguyen <anthony.l.nguyen@intel.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [PATCH] copy-firmware: Always write Link: entries
Date: Mon, 28 Sep 2020 17:25:39 -0700
Message-Id: <20200929002539.42024-1-anthony.l.nguyen@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

File: entries in the WHENCE file overwrite existing files in the target
directory, however, Link: entries are skipped if the file exists in the
target directory. This can cause issues if the Link: entry is updated, but
the target directory contains an old symlink. Do not skip writing Link:
entries if the file exists, always create the symlink. This matches the
behavior of File: entries and ensures symlinks will contain values from
the WHENCE file.

Signed-off-by: Tony Nguyen <anthony.l.nguyen@intel.com>
---
 copy-firmware.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/copy-firmware.sh b/copy-firmware.sh
index eda16c357779..9b46b63913ab 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -62,7 +62,6 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; d
             $verbose "WARNING: missing target for symlink $f"
         fi
     else
-        test -f "$destdir/$f" && continue
         $verbose "creating link $f -> $d"
         mkdir -p $destdir/$(dirname "$f")
         ln -sf "$d" "$destdir/$f"
-- 
2.20.1

