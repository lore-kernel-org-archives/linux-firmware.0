Return-Path: <SRS0=in8J=IX=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ADCC433C1
	for <linux-firmware@archiver.kernel.org>; Thu, 25 Mar 2021 22:16:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EBB5C61A2D; Thu, 25 Mar 2021 22:16:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA2B561937
	for <linux-firmware@kernel.org>; Thu, 25 Mar 2021 22:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA2B561937
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616710578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzOc6A4/+xQyYazoQMjVOD/1KsYmHVwrmdOuGpCo3mw=;
	b=B7haAK0cdH38Uj8j3tDRlPovpwzTiTmloO2xs8LB2NmSSy8ZnE3zMj3uMmhRVPQlGzNWZT
	7ctjO9Y3lYSxiog9K5xg/U/dNrpdwsUTvAApPFWkLee+cZo6usCLzNgmLcxRrYngKItL7o
	56AkFqCnwiBR8Y3nXhLG2tYsjZMcDpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-250-6SldMBL1Oo6za7RmurBl8g-1; Thu, 25 Mar 2021 18:16:16 -0400
X-MC-Unique: 6SldMBL1Oo6za7RmurBl8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6336101AFCD;
	Thu, 25 Mar 2021 22:16:15 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-54.ams2.redhat.com [10.36.112.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A224A794A1;
	Thu, 25 Mar 2021 22:16:05 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
List-Id: <linux-firmware.lore.kernel.org>
To: Josh Boyer <jwboyer@kernel.org>,
	linux-firmware@kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 3/3] rtl_bt: Add rtl8723bs_config-OBDA0623.bin symlink
Date: Thu, 25 Mar 2021 23:15:47 +0100
Message-Id: <20210325221547.22966-3-hdegoede@redhat.com>
In-Reply-To: <20210325221547.22966-1-hdegoede@redhat.com>
References: <20210325221547.22966-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Some x86/ACPI devices such as the Acer Aspire Switch 10E (SW3-016),
use an alternative ACPI hardware-id (HID) for the BT part of the
RTL8723BS chip.

Instead of using the standard OBDA8723 HID this device uses a HID
of OBDA0623. Despite using a different HID it does work fine with
the default config settings from the rtl8723bs_config-OBDA8723.bin
file. Add a symlink to that file, to fix BT not working on this
device due to a missing config file.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 WHENCE | 1 +
 1 file changed, 1 insertion(+)

diff --git a/WHENCE b/WHENCE
index 4483297..4070103 100644
--- a/WHENCE
+++ b/WHENCE
@@ -3717,6 +3717,7 @@ File: rtl_bt/rtl8723a_fw.bin
 File: rtl_bt/rtl8723b_fw.bin
 File: rtl_bt/rtl8723bs_fw.bin
 File: rtl_bt/rtl8723bs_config-OBDA8723.bin
+Link: rtl_bt/rtl8723bs_config-OBDA0623.bin -> rtl8723bs_config-OBDA8723.bin
 File: rtl_bt/rtl8761a_fw.bin
 File: rtl_bt/rtl8812ae_fw.bin
 File: rtl_bt/rtl8821a_fw.bin
-- 
2.30.2

