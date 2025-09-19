Return-Path: <SRS0=p1MP=36=gentoo.org=sam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0E2CAC592
	for <linux-firmware@archiver.kernel.org>; Fri, 19 Sep 2025 18:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33139C4CEF7; Fri, 19 Sep 2025 18:18:27 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FCDDC4CEF0
	for <linux-firmware@kernel.org>; Fri, 19 Sep 2025 18:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4FCDDC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from mop.sam.mop (2.8.3.0.0.0.0.0.0.0.0.0.0.0.0.0.a.5.c.d.c.d.9.1.0.b.8.0.1.0.0.2.ip6.arpa [IPv6:2001:8b0:19dc:dc5a::382])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A1DA8342053;
	Fri, 19 Sep 2025 18:18:24 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: linux-mediatek@lists.infradead.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: xiangzhedev@gmail.com, linux-firmware@kernel.org
Subject: Regression in linux-firmware-20250917 for mt7921e driver
Organization: Gentoo
User-Agent: mu4e 1.12.12; emacs 31.0.50
Date: Fri, 19 Sep 2025 19:18:21 +0100
Message-ID: <87bjn6fgr6.fsf@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

I'm forwarding a downstream report in Gentoo from
https://bugs.gentoo.org/963106 which also came up in Arch at
https://gitlab.archlinux.org/archlinux/packaging/packages/linux-firmware/-/issues/29
and on the linux-firmware gitlab at
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/684.

The user describes it on the Arch bug as:
"""
core/linux-firmware-mediatek@20250917-1 causes network to fail startup
and dramatically slows down basically every operation in the kernel.

symptoms are a pegged kworker thread at 100% cpu util, shutdown being
prevented, extremely slow commands like sudo, filesystem access. I
suspect a interrupt storm of some sort.
"""

And another mentions that removing the module w/ modprobe -r mt7921e hangs.

thanks,
sam
