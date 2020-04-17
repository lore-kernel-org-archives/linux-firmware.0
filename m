Return-Path: <SRS0=2VIw=6B=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86005C352BE
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Apr 2020 16:20:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 78BC720857; Fri, 17 Apr 2020 16:20:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E716E2072D
	for <linux-firmware@kernel.org>; Fri, 17 Apr 2020 16:20:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jHEH5eOc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E716E2072D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587140427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uhEBtpXO58TP+TMlMGkT2KFIozw4pXyZeHpvRi4oM8I=;
	b=jHEH5eOcl4F1pejMMFfwsx8b0QCAWza/ArveYZTPfDicYqfQS81jK6J8mTxunZHj1asyn+
	eRVV1tMD8CZw7bmezhOFM62tPKUQ7KEhZOAuqN2lgmLs784DXl+ggUcyX3eVwgvz0/H+yK
	OYJMXD4CTD4xBGZHEu1eoBM8QPO7Oz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-xm_g4VNWMmOAWJOuk87fsg-1; Fri, 17 Apr 2020 12:20:25 -0400
X-MC-Unique: xm_g4VNWMmOAWJOuk87fsg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EE8818FE866
	for <linux-firmware@kernel.org>; Fri, 17 Apr 2020 16:20:25 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-195.ams2.redhat.com [10.36.112.195])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7693F5C28E;
	Fri, 17 Apr 2020 16:20:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] Add symlink for Dell XPS 15 9550 Broadcom Bluetooth patch-ram file
Date: Fri, 17 Apr 2020 18:20:22 +0200
Message-Id: <20200417162022.428430-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

The linux-firmware repo does not contain many Broadcom (now Cypress)
Bluetooth patch-ram files, because we have never been able to get
permission to re-distribute those.

We do have one file for the for HTC Vive, which was submitted by HTC
themselves with permission from Cypress.

That file contain a "BCM20703A1 Generic USB 20Mhz fcbga_BU" patch-ram
build. The patch-ram files used by Windows for the Bluetooth module
in the XPS 15 9550, USB-id 0a5c:6410 is also a "BCM20703A1 Generic
USB 20Mhz fcbga_BU" patch-ram build. Since the build-parameters
(crystal MHz, package/module type used) between the 2 builds are an
exact match we can also use the HTC submitted patch-ram for the
XPS 15 9550. So lets add a symlink for this.

This will make the Bluetooth on the XPS 15 9550 work out of the box,
when linux-firmware is installed, without the user needing to go and
find a suitable patch-ram file themselves.

This has been tested on a XPS 15 9550 with both Bluetooth HID and
Bluetooth audio devices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 WHENCE                 | 1 +
 brcm/BCM-0a5c-6410.hcd | 1 +
 2 files changed, 2 insertions(+)
 create mode 120000 brcm/BCM-0a5c-6410.hcd

diff --git a/WHENCE b/WHENCE
index 893586e..e3bab8b 100644
--- a/WHENCE
+++ b/WHENCE
@@ -10,6 +10,7 @@ kernel.
=20
 Driver: BCM-0bb4-0306 Cypress Bluetooth firmware for HTC Vive
=20
+File: brcm/BCM-0a5c-6410.hcd
 File: brcm/BCM-0bb4-0306.hcd
=20
 Licence: Redistributable. See LICENCE.cypress for details.
diff --git a/brcm/BCM-0a5c-6410.hcd b/brcm/BCM-0a5c-6410.hcd
new file mode 120000
index 0000000..df02293
--- /dev/null
+++ b/brcm/BCM-0a5c-6410.hcd
@@ -0,0 +1 @@
+BCM-0bb4-0306.hcd
\ No newline at end of file
--=20
2.26.0

