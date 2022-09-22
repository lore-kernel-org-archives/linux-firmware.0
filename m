Return-Path: <SRS0=7RMk=ZZ=fastmail.com=neutral@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DD3ECAAD8
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Sep 2022 19:34:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26D73C433D6; Thu, 22 Sep 2022 19:34:48 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04454C433C1
	for <linux-firmware@kernel.org>; Thu, 22 Sep 2022 19:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04454C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 02EE05C010F
	for <linux-firmware@kernel.org>; Thu, 22 Sep 2022 15:34:46 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute3.internal (MEProxy); Thu, 22 Sep 2022 15:34:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1663875285; x=1663961685; bh=oLqEDkZuU/
	nbHw7qlR0hjVhwTyvoePH8oKfRopUJgKc=; b=9V6MtRuf24g1dsVlpV3X7/1g6l
	HU0z5dvQnjL4h4zJ+9usG0GZXZH3tSNqCxurKchenjCsJcHxVrz/VMbc+/0VuPqy
	hmrSu3DXKEA7YrRMxbN/Srp9EScBVbi2UGbDOoffZrjvNFf3zCuLgk4I8YwKfK9A
	pMlgfGJ/5j237IL71tSJVFDfk48d9ybV8b/HL0Y31i5MTHhGQthWwUYn9/GRad1w
	CFyibI5100+c/SOiQ+fgVgufLAJgxDdY/pp6/hcDaX8HyXqT7nlDB8rrNssuZy9b
	e4ykQmxkELqWPoIMcMnJFzQZGHjRg6Y0EfoJD+lmtBzmE8r5UZm+NIxSBFWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663875285; x=1663961685; bh=oLqEDkZuU/nbHw7qlR0hjVhwTyvo
	ePH8oKfRopUJgKc=; b=XmhjssTspLI4BnuQZ8BJ5Zaek4raFIkA15B2TL2/eVb6
	jwGpqtgPV/jROzFFf/JECeIB+VwDBkUc8rPuZlPveW5Hxr1PYlGNaaVSSs5I0+nx
	EvmU5w4qKa6Ja3/UBz5U1yHGhGp7eGogByDMYyqyy9odt9XXBQcEOMgHcc/cEqVX
	kp9NQ2sEfk+IwtaFEqsQY8w5w/7xe979ilwIJrcEmYnlQStV4o42MTlmrvwRm8yy
	eGKNCgqc/K8nYzFhCfka7+xgMTAeTolV5auEQmxEpwQHTDZU34B90MR3AMqVLZ48
	/5HBmODFv3/XOzdYsRUeQwWGZC7mWGWbOtyULyeHXw==
X-ME-Sender: <xms:1bgsY8VJHepGzPfQbMyQQ34QksmCQBvsQAXnEt0r6XuIIbwlh5s-kA>
    <xme:1bgsYwmDUR788idoeoHuCdJN1z6AEvIKjV79GYYLuegsIIcFTCTmjBp0_rY_LPUGk
    jWSThilLHndgFaAZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedflfgvrhgvmhihucfqkdeurhhivghnfdcuoehnvghuthhr
    rghlsehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepledtheekieefle
    dthefgvedvjeffhfekveelueejkedtjedvveekgfeklefhvdffnecuffhomhgrihhnpehk
    vghrnhgvlhdrohhrghdpihhnthgvlhdrtghomhenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehnvghuthhrrghlsehfrghsthhmrghilhdrtgho
    mh
X-ME-Proxy: <xmx:1bgsYwY5G7bQ8xvTay_QMBGeg1x49sxPiJswOfdxJeYrIfgv4Bt3_g>
    <xmx:1bgsY7UXPgl1DCpZ0KbEd8IbwsDMh8LDMGecbAzOiG1PNyIk4R2Yrw>
    <xmx:1bgsY2l63MV4ngkMF8kj8l72vKERcYbNOROplyiRpFcGQJwnlUpb8A>
    <xmx:1bgsYyxIYe9k1oPFTmVJqKKSpwvjL-tw5YI3UXuEOGQaKTWITI3YWg>
Feedback-ID: ib2e04023:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A54A02D4007D; Thu, 22 Sep 2022 15:34:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <5754e59c-d087-4c1f-866f-1a8a330ed0c7@www.fastmail.com>
In-Reply-To: <92340821-a78f-4b13-930f-c43b9e163cb3@www.fastmail.com>
References: <92340821-a78f-4b13-930f-c43b9e163cb3@www.fastmail.com>
Date: Thu, 22 Sep 2022 15:34:25 -0400
From: "Jeremy O'Brien" <neutral@fastmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Re: Newer Intel AX200 firmware available?
Content-Type: text/plain

On Thu, Sep 22, 2022, at 10:54, Jeremy O'Brien wrote:
> I was having packet loss issues under high traffic load with my Intel 
> AX200, so in my investigation I downloaded the firmware[1] from 
> Intel[2] directly to compare with the latest version in the 
> linux-firmware git repo. There seems to be a few blocks of differences 
> between the two ucode files, but more importantly, using the ucode from 
> Intel seems to have completely resolved the packet loss I was seeing.
>
> I'm not sure if there was a silent update that Intel pushed or there's 
> something else going on, but either way I thought it might be worth 
> investigating.
>
> Thank you,
> Jeremy
>
> [1]: 
> https://wireless.wiki.kernel.org/_media/en/users/drivers/iwlwifi/iwlwifi-cc-46.3cfab8da.0.tgz
> [2]: 
> https://www.intel.com/content/www/us/en/support/articles/000005511/wireless.html

Nevermind on the issue being fixed. It's still happening even with the ucode I snagged directly from Intel. Sorry for the noise.
