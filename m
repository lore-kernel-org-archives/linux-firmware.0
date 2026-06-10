Return-Path: <SRS0=Cr2W=EG=send.c127.dev=0100019eb284f2f3-52c3f99b-b3bf-41a1-87aa-50966385d0b3-000000@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698F2CD8C90
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Jun 2026 17:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 156681F00893; Wed, 10 Jun 2026 17:12:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=54.240.9.1
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781111520;
	b=nEQLaqq58/+qhlebr8cZEGTF2cXO2mikMaZcXaIKo7dtXJr1wpIkiezOYIASSafBpz3A
	 FJbGWo1ZsAbsrgOrsQMkYOcWXc3IlyrxbGReCQuWNijcChYdKvxsTI7GGNh9wKBQmWPzs
	 M/lrs2AaQ7fgUgwfmoY/miIabgise8xottZbqHE7H95Ny4IIULe69063aR3KQi18zVtf8
	 b4ZGLVWyxC7h9+7leQxs3BNNQOzcsyrfC6PG2b76a8jkRrs8FLhzZil61OF0bIOr77ulu
	 U8G1BEVaH+8qcQ79QtdAb0KcO4B9xKUodwiFtYobO48z4worDnsPm/RLRvHMsOnG/Jg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781111520;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:List-Id:Cc:
	 Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:
	 Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=2Qeew6AWhGTEkgv9VJvjtkcMIRlVzgqXpyUEtgKfBi4=;
	b=eMImumqPf2lE9dBvYuQedTRe77K9ml0pULXA8E5r6azG68a6kOAVwIiFfYVADfeYifM7
	 8wADUVKxjdjb+s8YuRjRqgZpH2Uv68ZzFN27d9+0AfXq+eX+H68uWjasD4yFThsJr01u8
	 dqIB7tR2jhNX+H7z6T3Jf15/wva6HA7oLSttRocQQqchzicVKRTjdabxE+gL7fpM0PF1+
	 baIMWqmFl/ebKkn8Q5Og5x/lVDBFdxfHDF4NC7aPV/oz/3cOYzQtb/TYWTisGvW1RZyCY
	 6AijW8j9emurNVBJYH05t0P3YUYln7S3DcAVlT0YY6NxxRHBc25C8a4UmRraLyVYF+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=c127.dev header.i=@c127.dev header.a=rsa-sha256 header.s=resend header.b="o7eZDF/n";
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=ZIZp8PgV;
	dmarc=none header.from=c127.dev;
	spf=pass smtp.mailfrom=send.c127.dev;
	arc=none smtp.remote-ip=54.240.9.1
Received: from a9-1.smtp-out.amazonses.com (a9-1.smtp-out.amazonses.com [54.240.9.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F7851F00898;
	Wed, 10 Jun 2026 17:11:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=c127.dev header.i=@c127.dev header.a=rsa-sha256 header.s=resend header.b=o7eZDF/n;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=ZIZp8PgV
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 3F7851F00898
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=c127.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=send.c127.dev
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=c127.dev; t=1781111518;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=ddvJQW/VBSYC7C5MbMmkcrXjLq/hMmJe6bydGstt7yw=;
	b=o7eZDF/n0QL9l4yOQyE8g1vCf673PXSQmkIdd/Gx+pCSUiRF0oyfHa402lFfx/1H
	BMU/1LIgZa82kgSeFb5j1NTGB0gHmcUPHj/PtdJyrTh4cEAz6frUCs7j0hpj/vLY5uS
	ikuf05dEVfvXT+GWJHCGJxBQ2S93frboGw9aJEyM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1781111518;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=ddvJQW/VBSYC7C5MbMmkcrXjLq/hMmJe6bydGstt7yw=;
	b=ZIZp8PgVpmBByYuUk49GiQ1kbMNbV6SfK7Vv7/XnndXVOqH7dCN6rmKTnBJYQeen
	rRx3NTLh0MViRAtrXWSj/ZMkGxYptcpZ5PuhdoRG0ll00nFW1ri+D+5hzPswkgi3+Zq
	eNmpAnxFM7YUBEZPmm30Gmc5IElUHGfip9DkB/TI=
From: Johan Alvarado <contact@c127.dev>
To: nic_swsd@realtek.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linusw@kernel.org, alsi@bang-olufsen.dk, 
	dmitry.baryshkov@oss.qualcomm.com, linux-firmware@kernel.org
Subject: RTL8367S DW8051 SerDes firmware: license clarification for
 linux-firmware inclusion
Message-ID: <0100019eb284f2f3-52c3f99b-b3bf-41a1-87aa-50966385d0b3-000000@email.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 17:11:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.us-east-1.z4rHY0qbNtjoW80ZyzVy+DEul17RQEOMT7FC66S60ffkhLWkV35D8ZWXVyxJY1/89bAuLCem4GFJq1VXsxM0u6ZfZbvT1qSjDUeuZG9/Lxk1uINIqi7CenEa93u+fNllqnJMZ0quaBrclhnmtzdFllG4KHSjZOEcaGLa1BWoSpA=:1.us-east-1.epbACCJLarUaEI78XZoGREJ9LamRjxMH5pM2kZb64rA=:AmazonSES
X-SES-Outgoing: 2026.06.10-54.240.9.1

Hello,

I am the author of a patch series currently under review on netdev,
adding SGMII/HSGMII support for the RTL8367S switch to the mainline
Linux rtl8365mb DSA driver:

  https://lore.kernel.org/netdev/0100019eb0b18=
22e-ffc5626c-1b9f-4c8a-8a1a-759a9e665f4f-000000@email.amazonses.com/

Bringing up the SerDes on this chip requires loading a small firmware
blob (1233 bytes) into the embedded DW8051 microcontroller. The driver
requests it via the kernel firmware API as realtek/rtl8367s-sgmii.bin.

The only public source of this blob is the rtl8367c vendor SDK as
distributed in GPL source code releases by Realtek's customers (in my
case the Mercusys MR80X v2 GPL code drop), where it is embedded as a
byte array (Sgmii_Init[] in rtl8367c_asicdrv_port.c).

I submitted the blob to linux-firmware:

  https://gitlab.=
com/kernel-firmware/linux-firmware/-/merge_requests/1092

but it cannot be accepted in its current state: the surrounding SDK
code is GPL-licensed, yet the actual source code of the 8051 microcode
has never been published, so the effective license of the blob is
unclear and GPL compliance cannot be met by redistributing it
(see review by Dmitry Baryshkov in the MR above).

May I ask Realtek for =
one of the following:

  1. Submit the firmware to linux-firmware directly,=
 with an
     appropriate redistribution license, as the Realtek NIC team
     already does for the rtl_nic firmware files; or

  2. Provide an explicit license statement permitting redistribution
     of this firmware via linux-firmware, and ACK the merge request
     above.

If this mailbox is not the right contact for the switch =
product line,
I would be very grateful if you could forward this request to=
 the
team responsible for the RTL8367S / rtl8367c SDK, or point me to the
right contact.

Thank you for your time.

Best regards,
Johan Alvarado <contact@c127.dev>
