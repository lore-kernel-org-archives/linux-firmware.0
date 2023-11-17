Return-Path: <SRS0=sK9h=G6=sdaoden.eu=steffen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BD5C197A0
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Nov 2023 01:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AEC98C433C8; Fri, 17 Nov 2023 01:32:59 +0000 (UTC)
Received: from sdaoden.eu (sdaoden.eu [217.144.132.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CA667C433C9
	for <linux-firmware@kernel.org>; Fri, 17 Nov 2023 01:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CA667C433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sdaoden.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sdaoden.eu
Date: Fri, 17 Nov 2023 02:19:25 +0100
Author: Steffen Nurpmeso <steffen@sdaoden.eu>
From: Steffen Nurpmeso <steffen@sdaoden.eu>
To: Mario Limonciello <mario.limonciello@amd.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Steffen Nurpmeso <steffen@sdaoden.eu>
Subject: Re: Question: v20231111 adds rdfind dependency: why not at
 ball build time?
Message-ID: <20231117011925.PPRKHhpq@steffen%sdaoden.eu>
In-Reply-To: <73529434-9b82-4131-8cbd-05eff75537db@amd.com>
References: <20231113215300.Fw2CJ%steffen@sdaoden.eu>
 <73529434-9b82-4131-8cbd-05eff75537db@amd.com>
Mail-Followup-To: Mario Limonciello <mario.limonciello@amd.com>,
 linux-firmware@kernel.org, Steffen Nurpmeso <steffen@sdaoden.eu>
User-Agent: s-nail v14.9.24-568-g80560405a6
OpenPGP: id=EE19E1C1F2F7054F8D3954D8308964B51883A0DD;
 url=https://ftp.sdaoden.eu/steffen.asc; preference=signencrypt
BlahBlahBlah: Any stupid boy can crush a beetle. But all the professors in
 the world can make no bugs.

Hello!

Mario Limonciello wrote in
 <73529434-9b82-4131-8cbd-05eff75537db@amd.com>:
 |On 11/13/2023 15:53, Steffen Nurpmeso wrote:
 |> I see my Linux distro updating its package, and adding hard
 |> rdfind(1) dependency because that copy-*.sh file uses it (and even
 |> added an error-out if not available).
 |> 
 |> That made me wonder two times: first of all i like that duplicates
 |> vanish, but that is not "a killer".  People downloaded the ball,
 |> and then they get thrown out because the ball is to be slimmed on
 |> their box.  And then, why is the ball slimmed-down on all those
 |> myriads of user boxes after having been downloaded, instead of
 |> once when the ball is created during release?  That is so strange,
 |> you know?
 |
 |I believe it's because of the way it's created and signed it's not 
 |possible to run a build action before creation.

That is bitter.  (And cannot be changed??)

 |Another possibility is that we can just run rdfind on the repo and store 
 |a bunch of symlinks but I worry that if a vendor submits a binary that
 |used to be the same for two products but no longer is it will lead to 
 |unexpected results.

If you could run it at ball-build time then you could simply
create the entire installation plan as a shell script, instead of
running these complicated pipes on the user boxes.
I mean the ball is so huge and few kilobytes shell script does
then not matter.  (Not that i think i say something noone ever has
thought of, you know -- it just all seems so, hm, excessive.)

 |> Thank you for all your effort.  (Not subscribed.)

Yes.
Ciao,

--steffen
|
|Der Kragenbaer,                The moon bear,
|der holt sich munter           he cheerfully and one by one
|einen nach dem anderen runter  wa.ks himself off
|(By Robert Gernhardt)
