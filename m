Return-Path: <SRS0=fBRJ=W4=proton.me=tj.iam.tj@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A09AC3601E
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Apr 2025 08:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58AD2C4CEE3; Thu, 10 Apr 2025 08:13:22 +0000 (UTC)
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 719C1C4CEDD
	for <linux-firmware@kernel.org>; Thu, 10 Apr 2025 08:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 719C1C4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ityyluhwnzdgxbs5hy6ivdveje.protonmail; t=1744272792; x=1744531992;
	bh=tx+SXNVGKnXBF7IBaMqYZi1gzqWZDTftfLsHFiVojJ8=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=UYx/gaMMjAKC2jnNkxfBthN5lvxLYl605QAukS8VG5rvE/A2WybwFuueWWS9KBI2g
	 9kd+9tmDQ8lAmqbXcFrT6ZIrH2xJNOeRI/elNo2FtRXoAubAb5ZGIFyobyKhHs9LDy
	 3CMzpgMk0yNrB4KYz83EB1QBe3v0A9aQ3DvHKdjIoUEh/dzvU2e9wJhn6AM/+254fg
	 OSTG3YRq7O+A4wvzzdc+TxeqRVKMagr2v6fNw/M9LalfLCY7p+Nx47JciF5ojtmIIM
	 hCjYUPmNYWd6H6fT1anNd+K1v3IsT9fUGr6Mo9eSuyoOXmCqNksFLQGKdRC2GQo61w
	 WSYMbPFU9TXNQ==
Date: Thu, 10 Apr 2025 08:13:06 +0000
List-Id: <linux-firmware.lore.kernel.org>
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
From: Tj <tj.iam.tj@proton.me>
Subject: iwlwifi: missing ma-a0-gf-ao-* series since 2020
Message-ID: <f7dLV-LegWvOvapaQgOMjBRu-9hCbLw6MXBvchvBUGJT68OuhCjrefUrbkQcY6ap898RWHfOvDH44pckHADOT_feRKfsd3xulQmsQp6DVZk=@proton.me>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: abc6ff50f940fd35e638c5bf91f190834847d820
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The "iwlwifi-ma-a0-gf-ao-*" story is weird; Support for those MA devices wa=
s added to Linux in September 2020 in commit bc9296f4a828bd8 but the firmwa=
res were never added to linux-firmware repository. The commit shows the dev=
ice name set to "Intel(R) Wi-Fi 6 AX211 160MHz"

linux-firmware only has the iwlwifi-ma-bo-* series.

There are distro and kernel bug reports [0] and asks for this firmware in v=
arious distro forums including the Intel community [1]

[0] https://bugzilla.kernel.org/show_bug.cgi?id=3D218748
[1]  https://community.intel.com/t5/Wireless/Linux-Firmware-for-AX211/m-p/1=
599943
