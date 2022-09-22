Return-Path: <SRS0=7RMk=ZZ=fastmail.com=neutral@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD9FC54EE9
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Sep 2022 14:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07A0BC433B5; Thu, 22 Sep 2022 14:55:16 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0295C433C1
	for <linux-firmware@kernel.org>; Thu, 22 Sep 2022 14:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0295C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 3C1A8320093A
	for <linux-firmware@kernel.org>; Thu, 22 Sep 2022 10:55:14 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
  by compute3.internal (MEProxy); Thu, 22 Sep 2022 10:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1663858513; x=1663944913; bh=2QyJVVrCtactT7QQHkim0w4zEPn5bnDeLbQ
	ojLDIiz8=; b=FD/AKCU9cw0KepBqhpJCQqy2zgqKeOlCce/NduP0Wu/IIqW1L+n
	ombsHN94JjmnNDavbLqziMJDwgyQgYnpXux9KJhtNUSOFyOmXSsgxGFeGirTC1zU
	U3gUNoXsfPqdBEUz032Xvv+PkqNMKrBq8PqEQChtUy0AfG4h4Sh6bEpRPavBa12+
	YlCclHqflrAV3W373xu3ObHxAbAto1pL1tL8VQ15D1pTJ2yu/TrfLailad7rTFAo
	e0t+nFtclKbvWBhp1uon87TDdrw5mh3MU76CD00PjQw5Ua6Yic2ghTjYabDYSp5+
	dhO6t0ASMMie4dsngQiOorYZWH//bmK/QvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1663858513; x=
	1663944913; bh=2QyJVVrCtactT7QQHkim0w4zEPn5bnDeLbQojLDIiz8=; b=H
	neCoIpZWXLOztCS/Q9IjLndmElHD67wLFb2Ct7vxG7kZ2txSMpmOekdTGEYKQEwc
	ptxPTTpP8Rxg0zXnKE3SLbgRYbneBDnfU0FrEj8sRPL5N4xOHOE7TClxI3SHAfR7
	HopL8+We6X5AT6YVEjURN8bnUMvYMPmuB60Q+pwFRkGZed0B4iPVvOGEqikdl+se
	8aFXv31SZdjrjoX+qoNW/o6o9GMGzIrj+3Qry7aTABM3uUtpe3dVBjiKSPdInST8
	h14HvPuwFctEyiTxJ1qS7FQuEZCM9XM03RYw3sivCGJ0qMyo5BfX8nEPJ+VyNcaD
	ORweCOOwioN+pAPmE4fyw==
X-ME-Sender: <xms:UXcsY52r6MQtiBfWJWQpA2hKMZ4DPSieR8qZbo02UHZnGszg4l9L0w>
    <xme:UXcsYwE88oMiNSxofULpRE9Q_pBCOBP9BvtISDoUlozetMItwlqxcCREqVs2VJlrb
    AOX2C9Y-cuR1AxcDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefgedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
    erredtnecuhfhrohhmpedflfgvrhgvmhihucfqkdeurhhivghnfdcuoehnvghuthhrrghl
    sehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepvdehgfejfeetvdejhf
    ffgefhvdelhfdvveffvddtffejheefleevleelkeeiudeunecuffhomhgrihhnpehkvghr
    nhgvlhdrohhrghdpihhnthgvlhdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehnvghuthhrrghlsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:UXcsY57KWPa3tl76st_Z4V6FAemcO41q73vo6aGHLOl-3UaLpcnWpg>
    <xmx:UXcsY22lY7ymqZ8xLKbUgR5cU0jQaxfz8pP1NNClTUxNuZqqCe-XjA>
    <xmx:UXcsY8Ehzf_UETSdf8Pb6VuOpfV9AlTm2w295HZVW0B-P5iDwtY1NA>
    <xmx:UXcsYwQNlsH59mgaftWyt3yXJ3ZpgLcAl4ow3l75l0dOzPDTm0bq0g>
Feedback-ID: ib2e04023:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 77F452D40071; Thu, 22 Sep 2022 10:55:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <92340821-a78f-4b13-930f-c43b9e163cb3@www.fastmail.com>
Date: Thu, 22 Sep 2022 10:54:51 -0400
From: "Jeremy O'Brien" <neutral@fastmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Newer Intel AX200 firmware available?
Content-Type: text/plain

I was having packet loss issues under high traffic load with my Intel AX200, so in my investigation I downloaded the firmware[1] from Intel[2] directly to compare with the latest version in the linux-firmware git repo. There seems to be a few blocks of differences between the two ucode files, but more importantly, using the ucode from Intel seems to have completely resolved the packet loss I was seeing.

I'm not sure if there was a silent update that Intel pushed or there's something else going on, but either way I thought it might be worth investigating.

Thank you,
Jeremy

[1]: https://wireless.wiki.kernel.org/_media/en/users/drivers/iwlwifi/iwlwifi-cc-46.3cfab8da.0.tgz
[2]: https://www.intel.com/content/www/us/en/support/articles/000005511/wireless.html
