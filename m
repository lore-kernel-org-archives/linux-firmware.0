Return-Path: <SRS0=QTQR=GL=merlin-66.de=davinci@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5D9C5DF7D
	for <linux-firmware@archiver.kernel.org>; Tue, 18 Aug 2026 17:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E04AA1F00A3A; Tue, 18 Aug 2026 17:33:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.20
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1787074402;
	b=veIeis83c0vRwd41x9NMZ+4lF1uH4Yh/6naxnjgQZycC4Y4bF0cgPzXq6v0pHUJ0mGSw
	 Gfy8EXQMG/93msYT1WIl5+OnHvQKVUuDRWqRaVujrcdSbrWbaSrJ5LOTgRhGnctDoi1wo
	 eEarr1z8pTknKO+m0qF52TCcfscRgJbklNaMPbom7VkS1G0QU65ytyvkDbxkG0c6GTdQS
	 CzlVgsWwj0Cth33WRBP2HwsjEbcJiBM5682gNey9b+N5ctDeay9+NNNEqu0PKBADQmM4X
	 ecl1U7pJciL5zM6fZgzr98oI5f4aTxwS+fGw2uuRCBgH8zU8kSnZITFaD6rzCoiXS/g==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1787074402;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:MIME-Version:From:List-Id:To:Subject:Message-ID:Date:
	 Content-Type:Content-Transfer-Encoding;
	bh=C7eFlQjmlinw1Y4kLCMwkNFsd3hgX1COnvjoYdQe2TU=;
	b=FZHCFKTwIN81Ek+NFbRqeEq7vymhyohhl6TVIUR6/0kOtdVokHqBgSbdJ20PGmZVZvgE
	 Ex8W8VVsM2YJg5pc9rjloUK68EU6mRg2XFpZHzbQ8ZP0GSvUX++wKoSnR2g33HkIfWcrh
	 RxplSNnZpLPMc9YvR2fjERv5zUKEGhHKaCRzQVFhEWpSjbGefu0nrtpSMmSFGGZX1Hgo3
	 M9/yte8QXwcMrNPyi8rtmcdDYp79uFkNjf2Xsic0cBSifaKIQps9LzOwGDtgYr25lzYo3
	 RXqt67CtE6JFKZdiSfftKO8eU7MVA8J/Mggvp0Z15ErO+PxXLr6/bwk+cyrVirUuv5A==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=merlin-66.de header.i=@merlin-66.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=lQMJXtzN;
	dkim=pass header.d=merlin-66.de header.i=@merlin-66.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b="WJeSLC/n";
	dmarc=fail header.from=merlin-66.de;
	spf=fail smtp.mailfrom=merlin-66.de;
	arc=pass header.oldest-pass=0 smtp.remote-ip=85.215.255.20
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [85.215.255.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07A6D1F000E9
	for <linux-firmware@kernel.org>; Tue, 18 Aug 2026 17:33:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=merlin-66.de header.i=@merlin-66.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=lQMJXtzN;
	dkim=pass header.d=merlin-66.de header.i=@merlin-66.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=WJeSLC/n
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 07A6D1F000E9
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=merlin-66.de
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=merlin-66.de
ARC-Seal: i=1; a=rsa-sha256; t=1787074392; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=a8nhPHrcCFewo19MXNxEYbKF9USdrvD3BvHVg75/J1y8jMLIRbv+6NbWJEziu9fesz
    +QDBzD7xxIWvlIMQBrAffFbP8sSyKypc0Y7Y01agZ4ZadA/pLIQyN7SkPCpgJYhr5HPt
    xh22YA9HB6EdsuqNE0LNxGYD86C1rD3QaXLXF4rkIaeqqaVE76XuFOOBCaNd/ef4YrH5
    JrDf8NLSvwJZBz/regq3VCbyT+U14270vKzjxoabvIkJVBMvt90fZhT0Y6Sy2Ehr2Cwt
    R/qmuvxrmhp14L1PNY41WKKf9ZvidrS3hDdueUrC1swVYILpvAQ+8mE7ogUqlashZRxM
    PwCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1787074392;
    s=strato-dkim-0002; d=strato.com;
    h=Date:Message-ID:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=C7eFlQjmlinw1Y4kLCMwkNFsd3hgX1COnvjoYdQe2TU=;
    b=sUiFnzPdHf+2i3cejbAQQdqGN3i7ANKMvZOSxx8UR+yxmEOxKNYXOxVnxTGsrOA/KT
    tftU5nq0DeblcFykgQZWazXyzAl3TkRuOIsq4+uaxsqeJSLibGHnoDbC1SNe1W6FNe42
    Z7a+aaIzpeJEuNG668DvP7bIylxCGYIxEYu9qdkB6/+yE1Gt1LK/M8B01bRspvZneRKP
    PAXl9MOKglTtcU2IbkArYSJZR7u0mNN0ZT8B2xVXLWpjHFGq3vk5TrDQBRen+AH2amqP
    XcSETS4J6ifoLXXiO9aJC+YscoYMc9f16b/ZgDKIz7fity0stkMgMnGSMdMK8HfEF5wn
    iX5Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1787074392;
    s=strato-dkim-0002; d=merlin-66.de;
    h=Date:Message-ID:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=C7eFlQjmlinw1Y4kLCMwkNFsd3hgX1COnvjoYdQe2TU=;
    b=lQMJXtzNX0MCCWFWzWugRuInJDV6f4+mhKQngbv8u1mRYTJ2y1kUzZWeq8iDPVVCQW
    csmJHfA1WuKn6r1qKrJaXZDHntNCKUhN2LPg1uR/G7ek4kxFvZfLScmz8en5fniuLjDq
    GAs4hQ5YIHUMABnGdSSticsSH3iIyJ9lbP51RTqzfM2aQZCaakThqgUnVIoQP2OvJmgl
    GLEApZG09t8VfWpMQdqIrDKXRpGdBJzs1XFBAbmOrABeslT+ejOAmrpwYZAFq3pI/tTg
    UiJvZo07s6aC0RVoAHsy32TU9l9vfArFp3PTP9fAnRL2sn3P3kwysDmmZ6OzAWJfrlLz
    2KIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1787074392;
    s=strato-dkim-0003; d=merlin-66.de;
    h=Date:Message-ID:Subject:To:From:Cc:Date:From:Subject:Sender;
    bh=C7eFlQjmlinw1Y4kLCMwkNFsd3hgX1COnvjoYdQe2TU=;
    b=WJeSLC/nqJUAv4HU1H1oZL3UoDXDXOlaHHOSxK0wrYdAjz8BzYhT+U/fJMr6t4PoSJ
    7icnpWx1MOulITVotlBg==
X-RZG-AUTH: ":KG0SfE6rct9ovgHH2+2JgtQWMKw+FUnnllWoUNBKdR+Xmn+ljfHp7Ah5IN8dllydOE0s"
Received: from Taliesin
    by smtp.strato.de (RZmta 55.6.2 DYNA|AUTH)
    with ESMTPSA id R90ac627IHXCS4W
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate)
    for <linux-firmware@kernel.org>;
    Tue, 18 Aug 2026 19:33:12 +0200 (CEST)
MIME-Version: 1.0
From: <davinci@merlin-66.de>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: Bug report: RX 6900 XT (Navi 21) DMUB fails to load with sienna_cichlid_dmcub
	 blob - half-black DisplayPort display
Message-ID: <18ccf6b11fffd2fb.d42121459e866efd.bae39e61373f1949@Taliesin>
Date: Tue, 18 Aug 2026 17:33:12 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi,

Bug report for linux-firmware: the sienna_cichlid_dmcub.bin blob shipped in
recent Ubuntu noble packaging (linux-firmware 20240318.git3b128b60-0ubuntu2.29)
fails to load on a Radeon RX 6900 XT (Navi 21, DCN 3.0).

Hardware: Gigabyte B550 AORUS PRO AC, AMD Radeon RX 6900 XT (Navi 21),
ultrawide 3440x1440@144Hz on DisplayPort, 1920x1080 on HDMI.

Symptom: after upgrading linux-firmware 0ubuntu2.27 -> 0ubuntu2.29 and
rebooting, the right half of the DisplayPort ultrawide is black. The hardware
cursor remains visible on the black area; windows dragged there disappear.
After power-cycling the monitor it reports "no display found". xrandr output
toggles fail with "enabling link 0 failed: 15" and REG_WAIT timeouts
(mpc2_assert_idle_mpcc, hubp2_set_blank_regs). HDMI unaffected.
Kernel-independent: reproduces identically on 7.0.0-28 and 7.0.0-29.

Boot log (broken, every boot on 0ubuntu2.29):
  [drm] Loading DMUB firmware via PSP: version=0x01000000
  [drm] Wait for DMUB auto-load failed: 3
  [drm] DMUB hardware initialized: version=0x01000000

Boot log (working, pre-upgrade on 0ubuntu2.27):
  [drm] Loading DMUB firmware via PSP: version=0x02020020
  (no errors)

Root cause analysis: 0ubuntu2.29 ships /lib/firmware/amdgpu/sienna_cichlid_dmcub.bin.zst
as a standalone 37,726-byte blob. In 0ubuntu2.26 (and the working layout) it
was a symlink to beige_goby_dmcub.bin.zst (74,553 bytes). The new 37KB blob
fails to auto-load (error 3) and amdgpu falls back to the silicon ROM DMUB
(version 0x01000000), which lacks the feature set (DSC, link training)
required for this output.

Workaround (confirmed 2026-08-18): replace sienna_cichlid_dmcub.bin.zst with
a symlink to beige_goby_dmcub.bin.zst, hold linux-firmware, reboot. Display
fully restored (DMUB 0x02020020, 144Hz, both monitors).

Upstream history for amdgpu/sienna_cichlid_dmcub.bin already contains
"amdgpu: Revert sienna cichlid dmcub firmware update" (2024-08-26) - a
previous revert of this blob. The current upstream main blob is ~114KB, also
not the 37KB one shipped in 0ubuntu2.29; the 37KB blob appears to be a stale
or bad intermediate version.

Request: restore the sienna_cichlid_dmcub.bin -> beige_goby_dmcub.bin symlink
in the tree, or sync the current upstream blob.

Happy to provide full dmesg/journal excerpts or test a candidate blob.

Best regards,
DaVinci
