Return-Path: <SRS0=ID+6=G2=sdaoden.eu=steffen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63853C4332F
	for <linux-firmware@archiver.kernel.org>; Mon, 13 Nov 2023 21:53:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38CE7C433C9; Mon, 13 Nov 2023 21:53:15 +0000 (UTC)
Received: from sdaoden.eu (sdaoden.eu [217.144.132.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5979C433C8
	for <linux-firmware@kernel.org>; Mon, 13 Nov 2023 21:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5979C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sdaoden.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sdaoden.eu
Date: Mon, 13 Nov 2023 22:53:00 +0100
Author: Steffen Nurpmeso <steffen@sdaoden.eu>
From: Steffen Nurpmeso <steffen@sdaoden.eu>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Question: v20231111 adds rdfind dependency: why not at ball
 build time?
Message-ID: <20231113215300.Fw2CJ%steffen@sdaoden.eu>
User-Agent: s-nail v14.9.24-563-gfad6c39c26
OpenPGP: id=EE19E1C1F2F7054F8D3954D8308964B51883A0DD;
 url=https://ftp.sdaoden.eu/steffen.asc; preference=signencrypt
BlahBlahBlah: Any stupid boy can crush a beetle. But all the professors in
 the world can make no bugs.

Hello.

I see my Linux distro updating its package, and adding hard
rdfind(1) dependency because that copy-*.sh file uses it (and even
added an error-out if not available).

That made me wonder two times: first of all i like that duplicates
vanish, but that is not "a killer".  People downloaded the ball,
and then they get thrown out because the ball is to be slimmed on
their box.  And then, why is the ball slimmed-down on all those
myriads of user boxes after having been downloaded, instead of
once when the ball is created during release?  That is so strange,
you know?

Thank you for all your effort.  (Not subscribed.)

--steffen
|
|Der Kragenbaer,                The moon bear,
|der holt sich munter           he cheerfully and one by one
|einen nach dem anderen runter  wa.ks himself off
|(By Robert Gernhardt)
