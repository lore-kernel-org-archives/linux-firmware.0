Return-Path: <SRS0=2AEd=H3=sdaoden.eu=steffen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637F8C41535
	for <linux-firmware@archiver.kernel.org>; Sat, 16 Dec 2023 22:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33563C433C8; Sat, 16 Dec 2023 22:36:34 +0000 (UTC)
Received: from sdaoden.eu (sdaoden.eu [217.144.132.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 63ED3C433C7
	for <linux-firmware@kernel.org>; Sat, 16 Dec 2023 22:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 63ED3C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sdaoden.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sdaoden.eu
Date: Sat, 16 Dec 2023 23:36:19 +0100
Author: Steffen Nurpmeso <steffen@sdaoden.eu>
From: Steffen Nurpmeso <steffen@sdaoden.eu>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Steffen Nurpmeso <steffen@sdaoden.eu>
Subject: Re: Question: v20231111 adds rdfind dependency: why not at
 ball build time?
Message-ID: <20231216223619.nRgZNdqv@steffen%sdaoden.eu>
In-Reply-To: <20231117014630.lO5xbFXr@steffen%sdaoden.eu>
References: <20231113215300.Fw2CJ%steffen@sdaoden.eu>
 <73529434-9b82-4131-8cbd-05eff75537db@amd.com>
 <20231117011925.PPRKHhpq@steffen%sdaoden.eu>
 <20231117014630.lO5xbFXr@steffen%sdaoden.eu>
Mail-Followup-To: linux-firmware@kernel.org,
 Steffen Nurpmeso <steffen@sdaoden.eu>
User-Agent: s-nail v14.9.24-579-gb275bb8d45
OpenPGP: id=EE19E1C1F2F7054F8D3954D8308964B51883A0DD;
 url=https://ftp.sdaoden.eu/steffen.asc; preference=signencrypt
BlahBlahBlah: Any stupid boy can crush a beetle. But all the professors in
 the world can make no bugs.

Thank you very much for making rdfind an optional thing!

I still have not understood why this complicated mechanism is
applied twice, for both creating a distribution tarball and then
again on the user box, instead of maybe (if it really has to be
done that hard) doing a final find(1) run during tarball creation,
and creating a schedule what to cp(1) and what to ln(1) -s (and
where to, of course), however.

But i wanted to say thank you, and then i was wondering why the
Linux kernel uses --ultra -22 for zstd(1), whereas Linux-firmware
uses a very, very low number.  Also note that zstd(1) -T0 works
regardless of whether SMP is compiled in or not, last time
i looked, it is simply ignored without.  And it is very helpful,
especially with --ultra -22 and on a modern box.

Thanks again, and
Ciao,

--steffen
|
|Der Kragenbaer,                The moon bear,
|der holt sich munter           he cheerfully and one by one
|einen nach dem anderen runter  wa.ks himself off
|(By Robert Gernhardt)
|
| Only in December: lightful Dubai COP28 Narendra Modi quote:
|  A small part of humanity has ruthlessly exploited nature.
|  But the entire humanity is bearing the cost of it,
|  especially the inhabitants of the Global South.
|  The selfishness of a few will lead the world into darkness,
|  not just for themselves but for the entire world.
|  [Christians might think of Revelation 11:18
|    The nations were angry, and your wrath has come[.]
|    [.]for destroying those who destroy the earth.
|   But i find the above more kind, and much friendlier]
